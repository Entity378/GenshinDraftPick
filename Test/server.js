const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const path = require("path");
const Database = require("better-sqlite3");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const rooms = {};
const games = {};
const connectedGames = {};

//instanzio il database
const dbPath = path.join(__dirname, "public", "resources", "draftpick.db"); //filepath del database
const db = new Database(dbPath, { readonly: true });
console.log("Database connesso:", dbPath);

app.get("/characters", (req, res) => {
    try {
        const characters = db
            .prepare("SELECT * FROM character ORDER BY Stars DESC, Name ASC")
            .all();
        res.json(characters);
    } catch (err) {
        console.error("Errore query:", err);
        res.status(500).send("Errore interno");
    }
});

//fine della merda del database

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
    } else if (connectedGames[roomId]) {
        res.redirect(`/game/${roomId}?username=${username}`);
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
            // </script>`
        );
    } else if (connectedGames[roomId] && connectedGames[roomId].find(user => user.username === username)) {
        res.send(
            `<script>
                alert("Username già preso in questa stanza.");
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

    // Modifica solo l'handler "start-game" così:
    socket.on("start-game", (roomId, username, bansNumber, teamsNumber, blueSideUsername, redSideUsername) => {
        if (blueSideUsername === redSideUsername) {
            console.log(`${username} (${socket.id}) ha provato ad iniziare una partita con lo stesso username per entrambi i lati.`);
            socket.emit("error", "I capitani dei team non possono essere uguali.");
            return;
        }
        if (rooms[roomId][0].username == username) {
            games[roomId] = {
                participants: [...rooms[roomId]],  // Copia i partecipanti
                blueSideUsername: blueSideUsername,
                redSideUsername: redSideUsername,
                bansNumber: bansNumber,
                teamsNumber: teamsNumber,
                blueSideBans: [],
                redSideBans: [],
                blueSidePicks: [],
                redSidePicks: [],
                gamePhase: generatePhases(bansNumber, teamsNumber, blueSideUsername, redSideUsername),
                phaseIndex: 0
            };
            //DIO MERDA TOGLILO
            console.log(`${username} (${socket.id}) ha iniziato la partita ${roomId} (${blueSideUsername} vs ${redSideUsername}) con ${bansNumber} ban e ${teamsNumber} team.`);
            io.to(roomId).emit("redirect-to-game");
        }
        else {
            console.log(`${username} (${socket.id}) ha provato ad iniziare una partita senza essere il creatore della stanza.`);
        }
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

            console.log(`DIOBESTIA ${roomId} con ${games[roomId].bansNumber} ban e ${games[roomId].teamsNumber} team.`);

            const game = games[roomId];
            io.to(roomId).emit("update-bans-teams-number", game.bansNumber, game.teamsNumber, game.blueSideUsername, game.redSideUsername);
            io.to(roomId).emit("update-participants", connectedGames[roomId]);

            io.to(roomId).emit("update-game-state",
                game.blueSideBans,
                game.redSideBans,
                game.blueSidePicks,
                game.redSidePicks,
                game.gamePhase[game.phaseIndex].type || "ban"
            );
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

    socket.on("hovered-character", (selectedCharacter, username, roomId) => {
        const game = games[roomId];
        if (!game) return;

        const currentPhase = game.gamePhase[game.phaseIndex];

        if (username !== currentPhase.username) {
            socket.emit("error", "Non è il tuo turno!");
            return;
        }

        if (game.blueSidePicks.includes(selectedCharacter) || game.redSidePicks.includes(selectedCharacter) ||
            game.blueSideBans.includes(selectedCharacter) || game.redSideBans.includes(selectedCharacter)) {
            socket.emit("error", "CICCIONE DI MERDA!");
            return;
        }

        io.to(roomId).emit("update-player-hover",
            selectedCharacter,
            game.gamePhase[game.phaseIndex].username,
            game.gamePhase[game.phaseIndex].type
        );
    });

    socket.on("selected-character", (selectedCharacter, username, roomId) => {
        const game = games[roomId];
        if (!game) return;

        const currentPhase = game.gamePhase[game.phaseIndex];

        if (username !== currentPhase.username) {
            socket.emit("error", "Non è il tuo turno!");
            return;
        }

        if (currentPhase.type === "ban") {
            if (game.blueSideBans.includes(selectedCharacter) || game.redSideBans.includes(selectedCharacter)) {
                socket.emit("error", "NON FARE COME QUELLA PALLA DI MERDA DI TUA MADRE!");
                return;
            }
            if (username == game.blueSideUsername) {
                game.blueSideBans.push(selectedCharacter);
            }
            else if (username == game.redSideUsername) {
                game.redSideBans.push(selectedCharacter);
            }
        } else if (currentPhase.type === "pick") {
            if (game.blueSidePicks.includes(selectedCharacter) || game.redSidePicks.includes(selectedCharacter) ||
                game.blueSideBans.includes(selectedCharacter) || game.redSideBans.includes(selectedCharacter)) {
                socket.emit("error", "CICCIONE DI MERDA!");
                return;
            } if (username == game.blueSideUsername) {
                game.blueSidePicks.push(selectedCharacter);
            }
            else if (username == game.redSideUsername) {
                game.redSidePicks.push(selectedCharacter);
            }
        }

        game.phaseIndex++;
        io.to(roomId).emit("update-game-state",
            game.blueSideBans,
            game.redSideBans,
            game.blueSidePicks,
            game.redSidePicks,
            game.gamePhase[game.phaseIndex].type,
            game.gamePhase[game.phaseIndex].username
        );
    });

    function generatePhases(bansNumber, teamsNumber, blueSideUsername, redSideUsername) {
        const phases = [];

        // --- BANS: 2 per player ---
        for (let i = 0; i < bansNumber; i++) {
            phases.push({ username: blueSideUsername, type: "ban" });
            phases.push({ username: redSideUsername, type: "ban" });
        }

        // --- PICKS ---
        const totalPicksPerPlayer = teamsNumber * 4;
        const pattern = [blueSideUsername, redSideUsername, redSideUsername, blueSideUsername];
        for (let i = 0; i < totalPicksPerPlayer * 2; i++) {
            const playerName = pattern[i % pattern.length];
            phases.push({ username: playerName, type: "pick" });
        }

        phases.push({ username: null, type: "end" });
        return phases;
    }
});

server.listen(3000, () => {
    console.log("Server in ascolto su http://localhost:3000");
});