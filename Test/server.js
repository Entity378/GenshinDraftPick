const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

const app = express();
const server = http.createServer(app);
const io = new Server(server);

const rooms = {}; // Oggetto per tracciare i partecipanti nelle stanze
const usernames = {}; // Memorizza gli username

// Serve i file statici
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

// Route per la pagina iniziale (inserimento username)
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

// Route per creare una nuova stanza
app.get("/create", (req, res) => {
    const roomId = uuidv4(); // Genera un ID univoco per la stanza
    const username = req.query.username; // Leggi l'username dalla query string
    if (username) {
        rooms[roomId] = [];
        res.redirect(`/room/${roomId}?username=${username}`); // Reindirizza alla stanza
    } else {
        res.status(400).send("Username mancante.");
    }
});

// Route per gestire le lobbies
app.get("/room/:roomId", (req, res) => {
    const roomId = req.params.roomId;
    
    if (rooms[roomId]) {
        res.sendFile(path.join(__dirname, "public", "lobby.html")); // Carica la pagina della lobby
    } else {
        res.status(404).send("Stanza non trovata."); // Restituisci errore se la stanza non esiste
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
