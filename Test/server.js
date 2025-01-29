const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const rooms = {}; // Oggetto per tracciare i partecipanti nelle stanze

// Serve i file statici
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

// Route per la pagina iniziale (inserimento username)
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

// Route per creare una nuova stanza
app.get("/create", (req, res) => {
    const roomId = uuidv4();
    const username = req.query.username;

    if (username) {
        rooms[roomId] = [];
        res.redirect(`/room/${roomId}?username=${username}`);
    } else {
        res.send(`
            <script>
                alert("Username mancante.");
                window.location.href = "/";
            </script>
        `);
    }
});

// Route per gestire le lobbies
app.get("/room/:roomId", (req, res) => {
    const roomId = req.params.roomId;
    const username = req.query.username;

    if (!rooms[roomId]) {
        res.send(`
            <script>
                alert("Stanza non trovata.");
                window.location.href = "/";
            </script>
        `);
    } else if (rooms[roomId].find(user => user.username === username)) {
        res.send(`
            <script>
                alert("Username già preso in questa stanza.");
                window.location.href = "/";
            </script>
        `);
    } else {
        res.sendFile(path.join(__dirname, "public", "lobby.html"));
    }
});


// Socket.IO logica di connessione
io.on("connection", (socket) => {
    console.log("Nuovo client connesso:", socket.id);

    // Gestisce l'evento di unione alla stanza
    socket.on("join-room", (roomId, username) => {
        if (!rooms[roomId]) {
            console.log(`${username} (${socket.id}) ha provato ad unirsi in una stanza non esistente con id ${roomId}`);
        } else {

            // Aggiungi l'utente alla stanza
            rooms[roomId].push({ id: socket.id, username: username });
            socket.join(roomId);
            console.log(`${username} (${socket.id}) si è unito alla stanza ${roomId}`);

            // Notifica agli altri utenti della stanza l'elenco aggiornato dei partecipanti
            io.to(roomId).emit("update-participants", rooms[roomId]);

            // Gestisce la disconnessione
            socket.on("disconnect", () => {
                console.log(`${username} si è disconnesso`);
                if (rooms[roomId]) {
                    rooms[roomId] = rooms[roomId].filter((user) => user.id !== socket.id);
                    io.to(roomId).emit("update-participants", rooms[roomId]);

                    // Notifica agli altri utenti che un partecipante si è disconnesso
                    io.to(roomId).emit("user-disconnected", username);

                    // Elimina la stanza se vuota
                    if (rooms[roomId].length === 0) {
                        delete rooms[roomId];
                    }
                }
            });
        }
    });
});

// Avvio del server
server.listen(3000, () => {
    console.log("Server in ascolto su http://localhost:3000");
});
