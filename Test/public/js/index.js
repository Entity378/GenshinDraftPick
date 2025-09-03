function createRoom() {
    const username = document.getElementById("username").value.trim();
    if (username) {
        window.location.href = `/create?username=${encodeURIComponent(username)}`;
    } else {
        alert("Per favore, inserisci un nome utente.");
    }
}

function joinRoom() {
    const username = document.getElementById("username").value.trim();
    const roomId = document.getElementById("roomId").value.trim();
    if (username && roomId) {
        window.location.href = `/room/${roomId}?username=${encodeURIComponent(username)}`;
    } else {
        alert("Per favore, inserisci un nome utente e un ID di stanza.");
    }
}

// Enter key support
document.getElementById("username").addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
        const roomId = document.getElementById("roomId").value.trim();
        if (roomId) {
            joinRoom();
        } else {
            createRoom();
        }
    }
});

document.getElementById("roomId").addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
        joinRoom();
    }
});