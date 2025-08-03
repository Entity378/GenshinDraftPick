-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 24, 2025 alle 18:13
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `draftpick`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `weapon`
--

CREATE TABLE `weapon` (
  `Name` varchar(50) NOT NULL,
  `Stars` int(11) NOT NULL,
  `WeaponType` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `weapon`
--

INSERT INTO `weapon` (`Name`, `Stars`, `WeaponType`, `ImageLink`) VALUES
("Skyward Blade", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_SkywardBlade.png"),
("Aquila Favonia", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_AquilaFavonia.png"),
("Summit Shaper", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_SummitShaper.png"),
("Primordial Jade Cutter", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_PrimordialJadeCutter.png"),
("Freedom-Sworn", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Freedom-Sworn.png"),
("Mistsplitter Reforged", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_MistsplitterReforged.png"),
("Haran Geppaku Futsu", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_HaranGeppakuFutsu.png"),
("Key of Khaj-Nisut", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_KeyOfKhaj-Nisut.png"),
("Light of Foliar Incision", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_LightOfFoliarIncision.png"),
("Uraku Misugiri", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_UrakuMisugiri.png"),
("Absolution", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Absolution.png"),
("Peak Patrol Song", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_PeakPatrolSong.png"),
("Azurelight", "5", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Azurelight.png"),

("Skyward Spine", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_SkywardSpine.png"),
("Vortex Vanquisher", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_VortexVanquisher.png"),
("Primordial Jade Winged-Spear", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_PrimordialJadeWinged-Spear.png"),
("Staff of Homa", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_StaffOfHoma.png"),
("Engulfing Lightning", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_EngulfingLightning.png"),
("Calamity Queller", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_CalamityQueller.png"),
("Staff of the Scarlet Sands", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_StaffOftheScarletSands.png"),
("Crimson Moon's Semblance", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_CrimsonMoonsSemblance.png"),
("Lumidouce Elegy", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_LumidouceElegy.png"),
("Symphonist of Scents", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_SymphonistOfScents.png"),
("Fractured Halo", "5", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_FracturedHalo.png"),

("Skyward Pride", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_SkywardPride.png"),
("Wolf's Gravestone", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_WolfsGravestone.png"),
("The Unforged", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_TheUnforged.png"),
("Song of Broken Pines", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_SongOfBrokenPines.png"),
("Redhorn Stonethresher", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_RedhornStonethresher.png"),
("Beacon of the Reed Sea", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_BeaconOftheReedSea.png"),
("Verdict", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_Verdict.png"),
("Fang of the Mountain King", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_FangOfTheMountainKing.png"),
("A Thousand Blazing Suns", "5", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_AThousandBlazingSuns.png"),

("Skyward Atlas", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SkywardAtlas.png"),
("Lost Prayer to the Sacred Winds", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_LostPrayerToTheSacredWinds.png"),
("Memory of Dust", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_MemoryofDust.png"),
("Everlasting Moonglow", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_EverlastingMoonglow.png"),
("Kagura's Verity", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_KagurasVerity.png"),
("A Thousand Floating Dreams", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_AThousandFloatingDreams.png"),
("Tulaytullah's Remembrance", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_TulaytullahsRemembrance.png"),
("Jadefall's Splendor", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_JadefallsSplendor.png"),
("Cashflow Supervision", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_CashflowSupervision.png"),
("Tome of the Eternal Flow", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_TomeOfTheEternalFlow.png"),
("Crane's Echoing Call", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_CranesEchoingCall.png"),
("Surf's Up", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SurfsUp.png"),
("Starcaller's Watch", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_StarcallersWatch.png"),
("Sunny Morning Sleep-In", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SunnyMorningSleep-In.png"),
("Vivid Notions", "5", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_Vivid Notions.png"),

("Skyward Harp", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_SkywardHarp.png"),
("Elegy for the End", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_ElegyForTheEnd.png"),
("Polar Star", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_PolarStar.png"),
("Amos' Bow", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AmosBow.png"),
("Thundering Pulse", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_ThunderingPulse.png"),
("Aqua Simulacra", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AquaSimulacra.png"),
("Hunter's Path", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_HuntersPath.png"),
("The First Great Magic", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_TheFirstGreatMagic.png"),
("Silvershower Heartstrings", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_SilvershowerHeartstrings.png"),
("Astral Vulture's Crimson Plumage", "5", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AstralVulturesCrimsonPlumage.png"),
("4 Star Sword", "4", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png"),
("4 Star Polearm", "4", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png"),
("4 Star Claymore", "4", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png"),
("4 Star Catalyst", "4", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png"),
("4 Star Bow", "4", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png");

-- --------------------------------------------------------

--
-- Struttura della tabella `element`
--

CREATE TABLE `element` (
  `Element` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `element`
--

INSERT INTO `element` (`Element`, `ImageLink`) VALUES
("Anemo", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Anemo.png"),
("Cryo", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Cryo.png"),
("Dendro", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Dendro.png"),
("Electro", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Electro.png"),
("Geo", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Geo.png"),
("Hydro", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Hydro.png"),
("Pyro", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Pyro.png");

-- --------------------------------------------------------

--
-- Struttura della tabella `character`
--

CREATE TABLE `character` (
  `Name` varchar(50) NOT NULL,
  `Limited` tinyint(1) NOT NULL,
  `Stars` int(11) NOT NULL,
  `Element` varchar(50) NOT NULL,
  `WeaponType` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Dump dei dati per la tabella `character`
--

INSERT INTO `character` (`Name`, `Limited`, `Stars`, `Element`, `WeaponType`, `ImageLink`) VALUES
("Ineffa", "1", "5", "Electro", "Spear", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ineffa.png"),
("Skirk", "1", "5", "Cryo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Skirk.png"),
("Escoffier", "1", "5", "Cryo", "Spear", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Escoffier.png"),
("Varesa", "1", "5", "Electro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Varesa.png"),
("Yumemizuki Mizuki", "0", "5", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mizuki.png"),
("Mavuika", "1", "5", "Pyro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mavuika.png"),
("Citlali", "1", "5", "Cryo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Citlali.png"),
("Chasca", "1", "5", "Anemo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chasca.png"),
("Xilonen", "1", "5", "Geo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xilonen.png"),
("Kinich", "1", "5", "Dendro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kinich.png"),
("Mualani", "1", "5", "Hydro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mualani.png"),
("Emilie", "1", "5", "Dendro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Emilie.png"),
("Sigewinne", "1", "5", "Hydro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sigewinne.png"),
("Clorinde", "1", "5", "Electro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Clorinde.png"),
("Arlecchino", "1", "5", "Pyro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Arlecchino.png"),
("Chiori", "1", "5", "Geo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chiori.png"),
("Xianyun", "1", "5", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xianyun.png"),
("Navia", "1", "5", "Geo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Navia.png"),
("Furina", "1", "5", "Hydro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Furina.png"),
("Wriothesley", "1", "5", "Cryo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Wriothesley.png"),
("Neuvillette", "1", "5", "Hydro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Neuvillette.png"),
("Lyney", "1", "5", "Pyro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lyney.png"),
("Baizhu", "1", "5", "Dendro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Baizhu.png"),
("Dehya", "0", "5", "Pyro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dehya.png"),
("Alhaitham", "1", "5", "Dendro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Alhaitham.png"),
("Wanderer", "1", "5", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Wanderer.png"),
("Nahida", "1", "5", "Dendro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Nahida.png"),
("Nilou", "1", "5", "Hydro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Nilou.png"),
("Cyno", "1", "5", "Electro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Cyno.png"),
("Tighnari", "0", "5", "Dendro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Tighnari.png"),
("Yelan", "1", "5", "Hydro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yelan.png"),
("Kamisato Ayato", "1", "5", "Hydro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ayato.png"),
("Yae Miko", "1", "5", "Electro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yae.png"),
("Shenhe", "1", "5", "Cryo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Shenhe.png"),
("Arataki Itto", "1", "5", "Geo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Itto.png"),
("Sangonomiya Kokomi", "1", "5", "Hydro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kokomi.png"),
("Raiden Shogun", "1", "5", "Electro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Raiden.png"),
("Aloy", "0", "5", "Cryo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Aloy.png"),
("Yoimiya", "1", "5", "Pyro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yoimiya.png"),
("Kamisato Ayaka", "1", "5", "Cryo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ayaka.png"),
("Kaedehara Kazuha", "1", "5", "Anemo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kazuha.png"),
("Eula", "1", "5", "Cryo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Eula.png"),
("Hu Tao", "1", "5", "Pyro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/HuTao.png"),
("Xiao", "1", "5", "Anemo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xiao.png"),
("Ganyu", "1", "5", "Cryo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ganyu.png"),
("Albedo", "1", "5", "Geo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Albedo.png"),
("Zhongli", "1", "5", "Geo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Zhongli.png"),
("Tartaglia", "1", "5", "Hydro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Tartaglia.png"),
("Klee", "1", "5", "Pyro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Klee.png"),
("Venti", "1", "5", "Anemo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Venti.png"),
("Keqing", "0", "5", "Electro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Keqing.png"),
("Mona", "0", "5", "Hydro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mona.png"),
("Qiqi", "0", "5", "Cryo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Qiqi.png"),
("Diluc", "0", "5", "Pyro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Diluc.png"),
("Jean", "0", "5", "Anemo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Jean.png"),

("Dahlia", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dahlia.png"),
("Ifa", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ifa.png"),
("Iansan", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Iansan.png"),
("Lan Yan", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/LanYan.png"),
("Ororon", "0", "4", "Electro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ororon.png"),
("Sethos", "0", "4", "Electro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sethos.png"),
("Gaming", "0", "4", "Pyro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Gaming.png"),
("Chevreuse", "0", "4", "Pyro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chevreuse.png"),
("Charlotte", "0", "4", "Cryo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Charlotte.png"),
("Freminet", "0", "4", "Cryo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Freminet.png"),
("Lynette", "0", "4", "Anemo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lynette.png"),
("Kirara", "0", "4", "Dendro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kirara.png"),
("Kaveh", "0", "4", "Dendro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kaveh.png"),
("Mika", "0", "4", "Cryo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mika.png"),
("Yaoyao", "0", "4", "Dendro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yaoyao.png"),
("Faruzan", "0", "4", "Anemo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Faruzan.png"),
("Layla", "0", "4", "Cryo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Layla.png"),
("Candace", "0", "4", "Hydro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Candace.png"),
("Dori", "0", "4", "Electro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dori.png"),
("Collei", "0", "4", "Dendro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Collei.png"),
("Shikanoin Heizou", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Heizou.png"),
("Kuki Shinobu", "0", "4", "Electro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kuki.png"),
("Yun Jin", "0", "4", "Geo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/YunJin.png"),
("Gorou", "0", "4", "Geo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Gorou.png"),
("Thoma", "0", "4", "Pyro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Thoma.png"),
("Kujou Sara", "0", "4", "Electro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sara.png"),
("Sayu", "0", "4", "Anemo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sayu.png"),
("Yanfei", "0", "4", "Pyro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yanfei.png"),
("Rosaria", "0", "4", "Cryo", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Rosaria.png"),
("Xinyan", "0", "4", "Pyro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xinyan.png"),
("Diona", "0", "4", "Cryo", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Diona.png"),
("Succrose", "0", "4", "Anemo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Succrose.png"),
("Chongyun", "0", "4", "Cryo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chongyun.png"),
("Noelle", "0", "4", "Geo", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Noelle.png"),
("Bennett", "0", "4", "Pyro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Bennett.png"),
("Fischl", "0", "4", "Electro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Fischl.png"),
("Ningguang", "0", "4", "Geo", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ningguang.png"),
("Xingqiu", "0", "4", "Hydro", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xingqiu.png"),
("Beidou", "0", "4", "Electro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Beidou.png"),
("Xiangling", "0", "4", "Pyro", "Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xiangling.png"),
("Razor", "0", "4", "Electro", "Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Razor.png"),
("Barbara", "0", "4", "Hydro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Barbara.png"),
("Lisa", "0", "4", "Electro", "Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lisa.png"),
("Kaeya", "0", "4", "Cryo", "Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kaeya.png"),
("Amber", "0", "4", "Pyro", "Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Amber.png");


-- --------------------------------------------------------

--
-- Struttura della tabella `weapontype`
--

CREATE TABLE `weapontype` (
  `WeaponType` varchar(50) NOT NULL,
  `ImageLink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `weapontype`
--

INSERT INTO `weapontype` (`WeaponType`, `ImageLink`) VALUES
("Bow", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Bow.png"),
("Catalyst", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Catalyst.png"),
("Claymore", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Claymore.png"),
("Polearm", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Polearm.png"),
("Sword", "https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Sword.png");

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `WeaponTypeFK` (`WeaponType`);

--
-- Indici per le tabelle `element`
--
ALTER TABLE `element`
  ADD PRIMARY KEY (`Element`);

--
-- Indici per le tabelle `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `ElementFK` (`Element`),
  ADD KEY `WeaponTypeFK` (`WeaponType`);

--
-- Indici per le tabelle `weapontype`
--
ALTER TABLE `weapontype`
  ADD PRIMARY KEY (`WeaponType`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `weapon`
--
ALTER TABLE `weapon`
  ADD CONSTRAINT `WeaponTypeArmaFK` FOREIGN KEY (`WeaponType`) REFERENCES `weapontype` (`WeaponType`);

--
-- Limiti per la tabella `character`
--
ALTER TABLE `character`
  ADD CONSTRAINT `ElementPersonaggioFK` FOREIGN KEY (`Element`) REFERENCES `element` (`Element`),
  ADD CONSTRAINT `WeaponTypePersionaggioFK` FOREIGN KEY (`WeaponType`) REFERENCES `weapontype` (`WeaponType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
