const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const rooms = {};
const games = {};
const connectedGames = {};

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.get("/create", (req, res) => {
    const roomId = uuidv4();
    const username = req.query.username;

    if (username) {
        rooms[roomId] = [];
        res.redirect(`/room/${roomId}?username=${username}`);
    } else {
        res.send(
            `<script>
                alert("Username mancante.");
                window.location.href = "/";
            </script>`
        );
    }
});

app.get("/room/:roomId", (req, res) => {
    const roomId = req.params.roomId;
    const username = req.query.username;

    if (!rooms[roomId]) {
        res.send(
            `<script>
                alert("Stanza non trovata.");
                window.location.href = "/";
            </script>`
        );
    } else if (rooms[roomId].find(user => user.username === username)) {
        res.send(
            `<script>
                alert("Username già preso in questa stanza.");
                window.location.href = "/";
            </script>`
        );
    } else {
        res.sendFile(path.join(__dirname, "public", "lobby.html"));
    }
});

app.get("/game/:roomId", (req, res) => {
    const roomId = req.params.roomId;
    const username = req.query.username;

    if (!games[roomId]) {
        res.send(
            `<script>
                alert("Stanza non trovata.");
                window.location.href = "/";
            </script>`
        );
    } else {
        res.sendFile(path.join(__dirname, "public", "game.html"));
    }
});

io.on("connection", (socket) => {
    console.log("Nuovo client connesso:", socket.id);

    socket.on("join-room", (roomId, username) => {
        if (!rooms[roomId]) {
            console.log(`${username} (${socket.id}) ha provato ad unirsi in una stanza non esistente con id ${roomId}`);
        } else {
            rooms[roomId].push({ id: socket.id, username: username });
            socket.join(roomId);
            console.log(`${username} (${socket.id}) si è unito alla stanza ${roomId}`);
            io.to(roomId).emit("update-participants", rooms[roomId]);
        }
    });

    socket.on("start-game", (roomId) => {
        games[roomId] = rooms[roomId];
        io.to(roomId).emit("redirect-to-game");
    });

    socket.on("join-game", (roomId, username) => {
        if (!games[roomId]) {
            console.log(`${username} (${socket.id}) ha provato ad unirsi in una partita non esistente con id ${roomId}`);
        } else {
            if (!connectedGames[roomId]) {
                connectedGames[roomId] = [];
            }
            connectedGames[roomId].push({ id: socket.id, username: username });
            socket.join(roomId);
            console.log(`${username} (${socket.id}) si è unito alla lobby di gioco ${roomId}`);

            // Invia i partecipanti aggiornati
            io.to(roomId).emit("update-participants", connectedGames[roomId]);
        }
    });

    socket.on("disconnect", () => {
        for (const roomId in connectedGames) {
            const userIndex = connectedGames[roomId].findIndex(user => user.id === socket.id);
            if (userIndex !== -1) {
                const username = connectedGames[roomId][userIndex].username;
                connectedGames[roomId].splice(userIndex, 1);
                io.to(roomId).emit("update-participants", connectedGames[roomId]);
                io.to(roomId).emit("user-disconnected", username);
                
                if (connectedGames[roomId].length === 0) {
                    delete connectedGames[roomId];
                    delete games[roomId];
                }
                break;
            }
        }
    });

    socket.on("send-chat-message", (roomId, message) => {
        const username = connectedGames[roomId].find(user => user.id === socket.id)?.username;
        if (username) {
            io.to(roomId).emit("chat-message", `${username}: ${message}`);
        }
    });

    socket.on("disconnect", () => {
        for (const roomId in rooms) {
            const userIndex = rooms[roomId].findIndex(user => user.id === socket.id);
            if (userIndex !== -1) {
                const username = rooms[roomId][userIndex].username;
                rooms[roomId].splice(userIndex, 1);
                io.to(roomId).emit("update-participants", rooms[roomId]);
                io.to(roomId).emit("user-disconnected", username);

                if (rooms[roomId].length === 0) {
                    delete rooms[roomId];
                }
                break;
            }
        }
    });
});

server.listen(3000, () => {
    console.log("Server in ascolto su http://localhost:3000");
});
