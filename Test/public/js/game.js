document.addEventListener('DOMContentLoaded', () => {
    const { socket, getUrlParams } = window.socketUtils;
    const { roomId, username } = getUrlParams();

    const DOM = {
        chatContainer: document.getElementById("chat-box-container"),
        chatBox: document.getElementById("chat-box"),
        chatInput: document.getElementById("chat-input"),
        blueSideBansContainer: document.getElementById("blue-ban-row"),
        redSideBansContainer: document.getElementById("red-ban-row"),
        blueSidePicksContainer: document.getElementById("blue-team-picks"),
        redSidePicksContainer: document.getElementById("red-team-picks"),
        currentPhaseText: document.getElementById("current-phase"),
        redUsernameText: document.getElementById("red-username"),
        blueUsernameText: document.getElementById("blue-username"),
        charactersList: document.getElementById("characters-list"),
        elementsList: document.getElementById("elements-list"),
        weaponTypesList: document.getElementById("weapon-types-list"),
        searchBar: document.getElementById("search-bar"),
        submitBtn: document.getElementById("submit-btn"),
        soundToggle: document.getElementById("sound-toggle")
    };

    let allPicksAndBans = [];
    let msgSent = false;
    let selectedCharacter = null;
    let oldSelectedElement = null;
    let selectedElement = null;
    let oldSelectedWeaponType = null;
    let selectedWeaponType = null;
    let bansNumber = null;
    let teamsNumber = null;
    let savedCharacters = [];
    let savedElements = [];
    let soundEnabled = true;

    const soundManager = {
        sounds: {
            click: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/click.mp3',
            hover: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/hover.mp3',
            ban: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/ban.mp3',
            pick: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/pick.mp3',
            notification: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/notification.mp3',
            phaseChange: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/phase-change.mp3',
            error: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/error.mp3',
            userTurn: 'https://raw.githubusercontent.com/Entity378/GenshinDraftPick/main/Resources/Sounds/user-turn.mp3'
        },

        play(soundType, volume = 0.5) {
            if (!soundEnabled || !this.sounds[soundType]) return;

            try {
                const audio = new Audio(this.sounds[soundType]);
                audio.volume = volume;
                audio.play().catch(e => console.log("Impossibile riprodurre il suono:", e));
            } catch (error) {
                console.log("Errore nella riproduzione del suono:", error);
            }
        },

        toggle() {
            soundEnabled = !soundEnabled;
            DOM.soundToggle.textContent = soundEnabled ? "🔊" : "🔇";
            return soundEnabled;
        }
    };

    function init() {
        bindEvents();
        loadCharacters();
        loadElements();
        loadWeaponTypes();
        socket.emit("join-game", roomId, username);
        updateSoundToggle();
    }

    function bindEvents() {
        DOM.chatContainer.addEventListener("click", (e) => {
            DOM.chatContainer.classList.add("active");
            if (e.target === DOM.chatInput) {
                DOM.chatInput.focus();
            } else {
                DOM.chatInput.blur();
            }
            soundManager.play("click", 0.3);
        });

        DOM.chatInput.addEventListener("keydown", (e) => {
            if (e.key === "Enter") {
                const message = DOM.chatInput.value.trim();
                if (message) {
                    socket.emit("send-chat-message", roomId, message);
                    DOM.chatInput.value = "";
                    soundManager.play("click", 0.3);
                }
                e.preventDefault();
                msgSent = true;
            }
        });

        document.addEventListener("click", (e) => {
            if (!DOM.chatContainer.contains(e.target)) {
                DOM.chatContainer.classList.remove("active");
                DOM.chatInput.blur();
                DOM.chatBox.scrollBy(0, DOM.chatBox.scrollHeight);
            }
        });

        DOM.chatInput.addEventListener("keydown", (e) => {
            if (e.key === "Enter") {
                const message = DOM.chatInput.value.trim();
                if (message) {
                    socket.emit("send-chat-message", roomId, message);
                    DOM.chatInput.value = "";
                    soundManager.play("click", 0.3);
                }
                e.preventDefault();
                msgSent = true;
            }
        });

        DOM.submitBtn.addEventListener("click", submitCharacter);
        DOM.soundToggle.addEventListener("click", toggleSound);

        document.addEventListener('keydown', function (e) {
            if ((e.key === 'm' || e.key === 'M') && document.activeElement !== DOM.chatInput) {
                const enabled = soundManager.toggle();
                showChatMessage(`Suoni ${enabled ? 'abilitati 🔊' : 'disabilitati 🔇'}`, enabled ? '#4CAF50' : '#e74c3c');
                if (enabled) soundManager.play("notification", 0.3);
            }
        });
    }

    function updateSoundToggle() {
        DOM.soundToggle.textContent = soundEnabled ? "🔊" : "🔇";
    }

    function toggleSound() {
        const enabled = soundManager.toggle();
        showChatMessage(`Suoni ${enabled ? 'abilitati 🔊' : 'disabilitati 🔇'}`, enabled ? '#4CAF50' : '#e74c3c');
        if (enabled) soundManager.play("notification", 0.3);
    }

    function showChatMessage(message, color) {
        const messageElement = document.createElement("div");
        messageElement.textContent = message;
        messageElement.style.color = color;
        DOM.chatBox.appendChild(messageElement);
        DOM.chatBox.scrollBy(0, DOM.chatBox.scrollHeight);
    }

    socket.on("chat-message", (message) => {
        const messageElement = document.createElement("div");
        messageElement.textContent = message;
        DOM.chatBox.appendChild(messageElement);

        if (!DOM.chatContainer.classList.contains("active") || msgSent) {
            DOM.chatBox.scrollBy(0, DOM.chatBox.scrollHeight);
            msgSent = false;
        }

        soundManager.play("notification", 0.3);
    });

    socket.on("update-player-hover", (character, playerUsername, phaseType) => {
        const imgLink = getImageLinkByName(character);
        if (!imgLink) return;

        let slotSelector = "";
        if (playerUsername == DOM.redUsernameText.innerText) {
            slotSelector = phaseType === "ban" ? ".red-ban-row-slot.slot-empty" : ".red-pick-slot.slot-empty";
        } else if (playerUsername == DOM.blueUsernameText.innerText) {
            slotSelector = phaseType === "ban" ? ".blue-ban-row-slot.slot-empty" : ".blue-pick-slot.slot-empty";
        }

        if (!slotSelector) return;

        const emptySlot = document.querySelector(slotSelector);
        if (emptySlot) {
            emptySlot.innerHTML = `<img src="${imgLink}" title="${character}" class="mini-character hover"/>`;
        }
    });

    socket.on("update-game-state", (blueSideBans, redSideBans, blueSidePicks, redSidePicks, currentPhase, currentUsername) => {
        if (Array.isArray(blueSideBans)) {
            blueSideBans.forEach((char, i) => {
                const slot = document.getElementById(`blue-ban-row-slot-${i}`);
                if (slot) {
                    slot.className = "blue-ban-row-slot";
                    slot.innerHTML = char ? `<img src="${getImageLinkByName(char)}" title="${char}" class="mini-character ban"/>` : "";
                }
            });
        }

        if (Array.isArray(redSideBans)) {
            redSideBans.forEach((char, i) => {
                const slot = document.getElementById(`red-ban-row-slot-${i}`);
                if (slot) {
                    slot.className = "red-ban-row-slot";
                    slot.innerHTML = char ? `<img src="${getImageLinkByName(char)}" title="${char}" class="mini-character ban"/>` : "";
                }
            });
        }

        if (Array.isArray(blueSidePicks)) {
            blueSidePicks.forEach((char, i) => {
                const slot = document.getElementById(`blue-pick-slot-${i}`);
                if (slot) {
                    slot.className = "blue-pick-slot";
                    slot.innerHTML = char ? `<img src="${getImageLinkByName(char)}" title="${char}" class="mini-character"/>` : "";
                }
            });
        }

        if (Array.isArray(redSidePicks)) {
            redSidePicks.forEach((char, i) => {
                const slot = document.getElementById(`red-pick-slot-${i}`);
                if (slot) {
                    slot.className = "red-pick-slot";
                    slot.innerHTML = char ? `<img src="${getImageLinkByName(char)}" title="${char}" class="mini-character"/>` : "";
                }
            });
        }

        const oldPicksAndBans = [...allPicksAndBans];
        allPicksAndBans = [...blueSideBans, ...redSideBans, ...blueSidePicks, ...redSidePicks];
        updateCharactersList(allPicksAndBans);

        const newlyAdded = allPicksAndBans.filter(c => !oldPicksAndBans.includes(c));
        if (newlyAdded.length > 0) {
            const newChar = newlyAdded[0];
            if (blueSideBans.includes(newChar) || redSideBans.includes(newChar)) {
                soundManager.play("ban", 0.6);
            } else if (blueSidePicks.includes(newChar) || redSidePicks.includes(newChar)) {
                soundManager.play("pick", 0.6);
            }
        }

        const oldPhaseText = DOM.currentPhaseText.innerHTML;
        const newPhaseText = generatePhaseText(currentPhase, currentUsername);
        DOM.currentPhaseText.innerHTML = newPhaseText;

        if (oldPhaseText !== newPhaseText) {
            soundManager.play("phaseChange", 0.4);
        }

        if (currentUsername === username && (currentPhase === "ban" || currentPhase === "pick")) {
            soundManager.play("userTurn", 0.8);

            if (username === DOM.redUsernameText.innerText) {
                DOM.currentPhaseText.closest(".game-container").classList.add("flash-red");
                DOM.currentPhaseText.closest(".game-container").classList.remove("flash-blue");
            } else {
                DOM.currentPhaseText.closest(".game-container").classList.add("flash-blue");
                DOM.currentPhaseText.closest(".game-container").classList.remove("flash-red");
            }
        } else {
            DOM.currentPhaseText.closest(".game-container").classList.remove("flash-blue", "flash-red");
        }
    });

    function updateCharactersList(characters, removeOnClick = true) {
        characters.forEach((char) => {
            const character = document.getElementById(char);
            if (!character) return;
            character.className = "disabled";
            if (removeOnClick) character.onclick = null;
        });
    }

    function generatePhaseText(phaseType, username) {
        let text = "";
        if (username == DOM.redUsernameText.innerText) {
            text += "Red team's";
        } else {
            text += "Blue team's";
        }
        if (phaseType === "ban") {
            text += " turn to ban.";
        } else if (phaseType === "pick") {
            text += " turn to pick.";
        } else if (phaseType === "end") {
            text = "Draft phase ended.";
        }
        return text;
    }

    function createTeamSlots(container, slotsCount, type) {
        container.innerHTML = "";

        if (type.includes("pick")) {
            const rows = Math.ceil(slotsCount / 4);
            for (let r = 0; r < rows; r++) {
                const teamText = document.createElement("div");
                teamText.textContent = "Team " + (r + 1);
                if (container == DOM.redSidePicksContainer) {
                    teamText.className = "red-pick-text";
                } else {
                    teamText.className = "blue-pick-text";
                }
                const rowDiv = document.createElement("div");
                rowDiv.className = "pick-row";

                for (let i = 0; i < 4; i++) {
                    const slotIndex = r * 4 + i;
                    if (slotIndex >= slotsCount) break;

                    const slot = document.createElement("div");
                    slot.className = `${type}-slot slot-empty`;
                    slot.id = `${type}-slot-${slotIndex}`;
                    slot.innerHTML = `<img src="https://github.com/Entity378/GenshinDraftPick/blob/main/Resources/Images/Generic_Icons/Empty.png?raw=true" class="mini-character"/>`;
                    rowDiv.appendChild(slot);
                }
                container.appendChild(teamText);
                container.appendChild(rowDiv);
            }
        } else {
            if (slotsCount == 0) {
                const noBansText = document.createElement("div");
                noBansText.textContent = "No bans";
                noBansText.className = "bans-text";
                container.appendChild(noBansText);
                return;
            }
            for (let i = 0; i < slotsCount; i++) {
                const slot = document.createElement("div");
                slot.className = `${type}-slot slot-empty`;
                slot.id = `${type}-slot-${i}`;
                slot.innerHTML = `<img src="https://github.com/Entity378/GenshinDraftPick/blob/main/Resources/Images/Generic_Icons/Empty.png?raw=true" class="mini-character"/>`;
                container.appendChild(slot);
            }
        }
    }

    socket.on("update-participants", (participants) => {
        // Gestione partecipanti se necessario
    });

    socket.on("update-bans-teams-number", (_bansNumber, _teamsNumber, _blueUsername, _redUsername) => {
        bansNumber = _bansNumber;
        teamsNumber = _teamsNumber;
        DOM.blueUsernameText.innerText = _blueUsername;
        DOM.redUsernameText.innerHTML = _redUsername;
        createTeamSlots(DOM.blueSideBansContainer, bansNumber, "blue-ban-row");
        createTeamSlots(DOM.redSideBansContainer, bansNumber, "red-ban-row");
        createTeamSlots(DOM.blueSidePicksContainer, teamsNumber * 4, "blue-pick");
        createTeamSlots(DOM.redSidePicksContainer, teamsNumber * 4, "red-pick");

        if (username === _blueUsername || username === _redUsername) {
            DOM.submitBtn.style.display = "block";
        } else {
            DOM.submitBtn.style.display = "none";
        }

        soundManager.play("phaseChange", 0.5);
    });

    socket.on("redirect-to-lobby", () => {
        window.location.href = `/room/${roomId}?username=${username}`;
    });

    socket.on("user-disconnected", (username) => {
        console.log(username + " disconnected");
    });

    function renderList(filter = "") {
        DOM.charactersList.innerHTML = "";
        savedCharacters
            .filter(c => c.name.toLowerCase().includes(filter.toLowerCase()))
            .filter(c => !selectedElement || c.element === selectedElement)
            .filter(c => !selectedWeaponType || c.weaponType === selectedWeaponType)
            .forEach((c) => {
                const img = document.createElement("img");
                img.src = c.imageLink;
                img.id = c.name;
                img.title = c.name;
                if (allPicksAndBans.includes(c.name)) {
                    img.className = "disabled";
                } else {
                    img.className = `character star-${c.stars}`;
                    img.addEventListener("click", () => {
                        selectedCharacter = img.id;
                        socket.emit("hovered-character", selectedCharacter, username, roomId);
                        soundManager.play("click", 0.4);
                    });

                    img.addEventListener("mouseenter", () => {
                        soundManager.play("hover", 0.2);
                    });
                }
                DOM.charactersList.appendChild(img);
            });
    }

    async function loadCharacters() {
        try {
            const res = await fetch("/characters");
            const characters = await res.json();

            characters.forEach((c) => {
                savedCharacters.push({ name: c.Name, imageLink: c.ImageLink, stars: c.Stars, element: c.Element, weaponType: c.WeaponType });
            });

            DOM.searchBar.addEventListener("input", (e) => {
                renderList(e.target.value);
                if (e.target.value.length > 0) {
                    soundManager.play("hover", 0.1);
                }
            });
            renderList();
        } catch (err) {
            soundManager.play("error", 0.5);
            console.error("Error while loading character:", err);
        }
    }

    async function loadElements() {
        try {
            const res = await fetch("/elements");
            const elements = await res.json();

            DOM.elementsList.innerHTML = "";
            elements.forEach((e) => {
                const img = document.createElement("img");
                img.src = e.ImageLink;
                img.id = e.Element;
                img.title = e.Element;
                img.className = `element ${e.Element}`;
                img.addEventListener("click", () => {
                    if (selectedElement === img.id) {
                        selectedElement = null;
                        img.classList.remove("selected");
                    }
                    else {
                        oldSelectedElement = selectedElement;
                        if (document.getElementById(oldSelectedElement))
                            document.getElementById(oldSelectedElement).classList.remove("selected");

                        selectedElement = img.id;
                        img.classList.add("selected");
                    }
                    soundManager.play("click", 0.4);
                    renderList(DOM.searchBar.value);
                });

                img.addEventListener("mouseenter", () => {
                    soundManager.play("hover", 0.2);
                });

                DOM.elementsList.appendChild(img);
                savedElements.push({ name: e.Element, imageLink: e.ImageLink });
            });

        } catch (err) {
            soundManager.play("error", 0.5);
            console.error("Error while loading element:", err);
        }
    }

    async function loadWeaponTypes() {
        try {
            const res = await fetch("/weaponTypes");
            const weaponTypes = await res.json();

            DOM.weaponTypesList.innerHTML = "";
            weaponTypes.forEach((w) => {
                const img = document.createElement("img");
                img.src = w.ImageLink;
                img.id = w.WeaponType;
                img.title = w.WeaponType;
                img.className = `weapon-type ${w.WeaponType}`;
                img.addEventListener("click", () => {
                    if (selectedWeaponType === img.id) {
                        selectedWeaponType = null;
                        img.classList.remove("selected");
                    }
                    else {
                        oldSelectedWeaponType = selectedWeaponType;
                        if (document.getElementById(oldSelectedWeaponType))
                            document.getElementById(oldSelectedWeaponType).classList.remove("selected");

                        selectedWeaponType = img.id;
                        img.classList.add("selected");
                    }
                    soundManager.play("click", 0.4);
                    renderList(DOM.searchBar.value);
                });

                img.addEventListener("mouseenter", () => {
                    soundManager.play("hover", 0.2);
                });

                DOM.weaponTypesList.appendChild(img);
                savedElements.push({ name: w.WeaponType, imageLink: w.ImageLink });
            });

        } catch (err) {
            soundManager.play("error", 0.5);
            console.error("Error while loading element:", err);
        }
    }

    function getImageLinkByName(name) {
        const character = savedCharacters.find(c => c.name === name);
        return character ? character.imageLink : null;
    }

    function submitCharacter() {
        if (selectedCharacter == null) {
            alert("Devi prima selezionare un personaggio!");
            return;
        }
        socket.emit("selected-character", selectedCharacter, username, roomId);
        soundManager.play("click", 0.5);
    }

    init();
});