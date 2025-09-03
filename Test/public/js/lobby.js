document.addEventListener('DOMContentLoaded', () => {
    const { socket, getUrlParams, copyToClipboard } = window.socketUtils;
    const { roomId, username } = getUrlParams();

    const DOM = {
        roomIdDiv: document.getElementById("room-id"),
        copyBtn: document.getElementById("copy-btn"),
        copyMessage: document.getElementById("copy-message"),
        participantsList: document.getElementById("participants"),
        blueSideSelect: document.getElementById("blueSide"),
        redSideSelect: document.getElementById("redSide"),
        hostOptions: document.getElementById("host-options"),
        startButton: document.getElementById("start-btn"),
        bansNumber: document.getElementById("bans-number"),
        teamsNumber: document.getElementById("teams-number")
    };

    DOM.roomIdDiv.textContent = roomId;

    DOM.copyBtn.addEventListener("click", () => {
        copyToClipboard(roomId, DOM.copyMessage);
    });

    socket.emit("join-room", roomId, username);

    socket.on("update-participants", (participants, hostUsername) => {
        let blueUsername = DOM.blueSideSelect.value;
        let redUsername = DOM.redSideSelect.value;
        let isBlueSideUsernamePresent = false;
        let isRedSideUsernamePresent = false;

        DOM.participantsList.innerHTML = "";
        DOM.blueSideSelect.innerHTML = "";
        DOM.redSideSelect.innerHTML = "";

        participants.forEach((user) => {
            const listItem = document.createElement("li");
            listItem.textContent = user.username;
            DOM.participantsList.appendChild(listItem);

            const optionItemBlue = document.createElement("option");
            optionItemBlue.value = user.username;
            optionItemBlue.textContent = user.username;

            const optionItemRed = document.createElement("option");
            optionItemRed.value = user.username;
            optionItemRed.textContent = user.username;

            DOM.blueSideSelect.appendChild(optionItemBlue);
            DOM.redSideSelect.appendChild(optionItemRed);

            if (user.username === blueUsername) isBlueSideUsernamePresent = true;
            if (user.username === redUsername) isRedSideUsernamePresent = true;
        });

        // MOSTRA OPZIONI HOST SOLO SE SEI L'HOST
        if (hostUsername === username) {
            DOM.hostOptions.style.display = "block";
        } else {
            DOM.hostOptions.style.display = "none";
        }

        if (isBlueSideUsernamePresent) DOM.blueSideSelect.value = blueUsername;
        if (isRedSideUsernamePresent) DOM.redSideSelect.value = redUsername;
    });

    DOM.startButton.addEventListener("click", () => {
        if (DOM.blueSideSelect.value === DOM.redSideSelect.value) {
            alert("I capitani dei team non possono essere uguali!");
            return;
        }

        socket.emit(
            "start-game",
            roomId,
            username,
            DOM.bansNumber.value,
            DOM.teamsNumber.value,
            DOM.blueSideSelect.value,
            DOM.redSideSelect.value
        );
    });

    socket.on("redirect-to-game", () => {
        window.location.href = `/game/${roomId}?username=${encodeURIComponent(username)}`;
    });

    socket.on("user-disconnected", (username) => {
        console.log(username + " si è disconnesso");
    });

    socket.on("error", (message) => {
        alert(message);
    });
});