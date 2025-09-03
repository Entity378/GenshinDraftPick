const socket = io();

// Gestione errori
socket.on("error", (message) => {
    alert(message);
});

// Utility functions
const getUrlParams = () => {
    const pathParts = window.location.pathname.split("/");
    const roomId = pathParts[2];
    const username = new URLSearchParams(window.location.search).get("username");
    return { roomId, username };
};

const copyToClipboard = (text, messageElement) => {
    navigator.clipboard.writeText(text)
        .then(() => {
            if (messageElement) {
                messageElement.style.display = "block";
                setTimeout(() => {
                    messageElement.style.display = "none";
                }, 2000);
            }
        })
        .catch((err) => {
            console.error("Errore nella copia:", err);
        });
};

// Esporta funzioni
window.socketUtils = {
    socket,
    getUrlParams,
    copyToClipboard
};