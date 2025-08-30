BEGIN TRANSACTION;
CREATE TABLE `character` (
  `Name` varchar(50) NOT NULL
,  `Limited` integer NOT NULL
,  `Stars` integer NOT NULL
,  `Element` varchar(50) NOT NULL
,  `WeaponType` varchar(50) NOT NULL
,  `ImageLink` varchar(200) NOT NULL
,  PRIMARY KEY (`Name`)
,  CONSTRAINT `WeaponTypeCharacterFK` FOREIGN KEY (`WeaponType`) REFERENCES `weapontype` (`WeaponType`)
,  CONSTRAINT `ElementCharacterFK` FOREIGN KEY (`Element`) REFERENCES `element` (`Element`)
);
INSERT INTO `character` VALUES ('Albedo',1,5,'Geo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Albedo.png');
INSERT INTO `character` VALUES ('Alhaitham',1,5,'Dendro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Alhaitham.png');
INSERT INTO `character` VALUES ('Aloy',0,5,'Cryo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Aloy.png');
INSERT INTO `character` VALUES ('Amber',0,4,'Pyro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Amber.png');
INSERT INTO `character` VALUES ('Arataki Itto',1,5,'Geo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Itto.png');
INSERT INTO `character` VALUES ('Arlecchino',1,5,'Pyro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Arlecchino.png');
INSERT INTO `character` VALUES ('Baizhu',1,5,'Dendro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Baizhu.png');
INSERT INTO `character` VALUES ('Barbara',0,4,'Hydro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Barbara.png');
INSERT INTO `character` VALUES ('Beidou',0,4,'Electro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Beidou.png');
INSERT INTO `character` VALUES ('Bennett',0,4,'Pyro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Bennett.png');
INSERT INTO `character` VALUES ('Candace',0,4,'Hydro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Candace.png');
INSERT INTO `character` VALUES ('Charlotte',0,4,'Cryo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Charlotte.png');
INSERT INTO `character` VALUES ('Chasca',1,5,'Anemo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chasca.png');
INSERT INTO `character` VALUES ('Chevreuse',0,4,'Pyro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chevreuse.png');
INSERT INTO `character` VALUES ('Chiori',1,5,'Geo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chiori.png');
INSERT INTO `character` VALUES ('Chongyun',0,4,'Cryo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Chongyun.png');
INSERT INTO `character` VALUES ('Citlali',1,5,'Cryo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Citlali.png');
INSERT INTO `character` VALUES ('Clorinde',1,5,'Electro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Clorinde.png');
INSERT INTO `character` VALUES ('Collei',0,4,'Dendro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Collei.png');
INSERT INTO `character` VALUES ('Cyno',1,5,'Electro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Cyno.png');
INSERT INTO `character` VALUES ('Dahlia',0,4,'Hydro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dahlia.png');
INSERT INTO `character` VALUES ('Dehya',0,5,'Pyro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dehya.png');
INSERT INTO `character` VALUES ('Diluc',0,5,'Pyro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Diluc.png');
INSERT INTO `character` VALUES ('Diona',0,4,'Cryo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Diona.png');
INSERT INTO `character` VALUES ('Dori',0,4,'Electro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Dori.png');
INSERT INTO `character` VALUES ('Emilie',1,5,'Dendro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Emilie.png');
INSERT INTO `character` VALUES ('Escoffier',1,5,'Cryo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Escoffier.png');
INSERT INTO `character` VALUES ('Eula',1,5,'Cryo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Eula.png');
INSERT INTO `character` VALUES ('Faruzan',0,4,'Anemo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Faruzan.png');
INSERT INTO `character` VALUES ('Fischl',0,4,'Electro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Fischl.png');
INSERT INTO `character` VALUES ('Freminet',0,4,'Cryo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Freminet.png');
INSERT INTO `character` VALUES ('Furina',1,5,'Hydro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Furina.png');
INSERT INTO `character` VALUES ('Gaming',0,4,'Pyro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Gaming.png');
INSERT INTO `character` VALUES ('Ganyu',1,5,'Cryo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ganyu.png');
INSERT INTO `character` VALUES ('Gorou',0,4,'Geo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Gorou.png');
INSERT INTO `character` VALUES ('Hu Tao',1,5,'Pyro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/HuTao.png');
INSERT INTO `character` VALUES ('Iansan',0,4,'Electro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Iansan.png');
INSERT INTO `character` VALUES ('Ifa',0,4,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ifa.png');
INSERT INTO `character` VALUES ('Ineffa',1,5,'Electro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ineffa.png');
INSERT INTO `character` VALUES ('Jean',0,5,'Anemo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Jean.png');
INSERT INTO `character` VALUES ('Kaedehara Kazuha',1,5,'Anemo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kazuha.png');
INSERT INTO `character` VALUES ('Kaeya',0,4,'Cryo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kaeya.png');
INSERT INTO `character` VALUES ('Kamisato Ayaka',1,5,'Cryo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ayaka.png');
INSERT INTO `character` VALUES ('Kamisato Ayato',1,5,'Hydro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ayato.png');
INSERT INTO `character` VALUES ('Kaveh',0,4,'Dendro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kaveh.png');
INSERT INTO `character` VALUES ('Keqing',0,5,'Electro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Keqing.png');
INSERT INTO `character` VALUES ('Kinich',1,5,'Dendro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kinich.png');
INSERT INTO `character` VALUES ('Kirara',0,4,'Dendro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kirara.png');
INSERT INTO `character` VALUES ('Klee',1,5,'Pyro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Klee.png');
INSERT INTO `character` VALUES ('Kujou Sara',0,4,'Electro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sara.png');
INSERT INTO `character` VALUES ('Kuki Shinobu',0,4,'Electro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kuki.png');
INSERT INTO `character` VALUES ('Lan Yan',0,4,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/LanYan.png');
INSERT INTO `character` VALUES ('Layla',0,4,'Cryo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Layla.png');
INSERT INTO `character` VALUES ('Lisa',0,4,'Electro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lisa.png');
INSERT INTO `character` VALUES ('Lynette',0,4,'Anemo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lynette.png');
INSERT INTO `character` VALUES ('Lyney',1,5,'Pyro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Lyney.png');
INSERT INTO `character` VALUES ('Mavuika',1,5,'Pyro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mavuika.png');
INSERT INTO `character` VALUES ('Mika',0,4,'Cryo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mika.png');
INSERT INTO `character` VALUES ('Mona',0,5,'Hydro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mona.png');
INSERT INTO `character` VALUES ('Mualani',1,5,'Hydro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mualani.png');
INSERT INTO `character` VALUES ('Nahida',1,5,'Dendro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Nahida.png');
INSERT INTO `character` VALUES ('Navia',1,5,'Geo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Navia.png');
INSERT INTO `character` VALUES ('Neuvillette',1,5,'Hydro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Neuvillette.png');
INSERT INTO `character` VALUES ('Nilou',1,5,'Hydro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Nilou.png');
INSERT INTO `character` VALUES ('Ningguang',0,4,'Geo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ningguang.png');
INSERT INTO `character` VALUES ('Noelle',0,4,'Geo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Noelle.png');
INSERT INTO `character` VALUES ('Ororon',0,4,'Electro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Ororon.png');
INSERT INTO `character` VALUES ('Qiqi',0,5,'Cryo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Qiqi.png');
INSERT INTO `character` VALUES ('Raiden Shogun',1,5,'Electro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Raiden.png');
INSERT INTO `character` VALUES ('Razor',0,4,'Electro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Razor.png');
INSERT INTO `character` VALUES ('Rosaria',0,4,'Cryo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Rosaria.png');
INSERT INTO `character` VALUES ('Sangonomiya Kokomi',1,5,'Hydro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Kokomi.png');
INSERT INTO `character` VALUES ('Sayu',0,4,'Anemo','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sayu.png');
INSERT INTO `character` VALUES ('Sethos',0,4,'Electro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sethos.png');
INSERT INTO `character` VALUES ('Shenhe',1,5,'Cryo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Shenhe.png');
INSERT INTO `character` VALUES ('Shikanoin Heizou',0,4,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Heizou.png');
INSERT INTO `character` VALUES ('Sigewinne',1,5,'Hydro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Sigewinne.png');
INSERT INTO `character` VALUES ('Skirk',1,5,'Cryo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Skirk.png');
INSERT INTO `character` VALUES ('Succrose',0,4,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Succrose.png');
INSERT INTO `character` VALUES ('Tartaglia',1,5,'Hydro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Tartaglia.png');
INSERT INTO `character` VALUES ('Thoma',0,4,'Pyro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Thoma.png');
INSERT INTO `character` VALUES ('Tighnari',0,5,'Dendro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Tighnari.png');
INSERT INTO `character` VALUES ('Varesa',1,5,'Electro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Varesa.png');
INSERT INTO `character` VALUES ('Venti',1,5,'Anemo','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Venti.png');
INSERT INTO `character` VALUES ('Wanderer',1,5,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Wanderer.png');
INSERT INTO `character` VALUES ('Wriothesley',1,5,'Cryo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Wriothesley.png');
INSERT INTO `character` VALUES ('Xiangling',0,4,'Pyro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xiangling.png');
INSERT INTO `character` VALUES ('Xianyun',1,5,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xianyun.png');
INSERT INTO `character` VALUES ('Xiao',1,5,'Anemo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xiao.png');
INSERT INTO `character` VALUES ('Xilonen',1,5,'Geo','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xilonen.png');
INSERT INTO `character` VALUES ('Xingqiu',0,4,'Hydro','Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xingqiu.png');
INSERT INTO `character` VALUES ('Xinyan',0,4,'Pyro','Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Xinyan.png');
INSERT INTO `character` VALUES ('Yae Miko',1,5,'Electro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yae.png');
INSERT INTO `character` VALUES ('Yanfei',0,4,'Pyro','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yanfei.png');
INSERT INTO `character` VALUES ('Yaoyao',0,4,'Dendro','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yaoyao.png');
INSERT INTO `character` VALUES ('Yelan',1,5,'Hydro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yelan.png');
INSERT INTO `character` VALUES ('Yoimiya',1,5,'Pyro','Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Yoimiya.png');
INSERT INTO `character` VALUES ('Yumemizuki Mizuki',0,5,'Anemo','Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Mizuki.png');
INSERT INTO `character` VALUES ('Yun Jin',0,4,'Geo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/YunJin.png');
INSERT INTO `character` VALUES ('Zhongli',1,5,'Geo','Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Character_Icons/Zhongli.png');
CREATE TABLE `element` (
  `Element` varchar(50) NOT NULL
,  `ImageLink` varchar(200) NOT NULL
,  PRIMARY KEY (`Element`)
);
INSERT INTO `element` VALUES ('Anemo','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Anemo.png');
INSERT INTO `element` VALUES ('Cryo','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Cryo.png');
INSERT INTO `element` VALUES ('Dendro','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Dendro.png');
INSERT INTO `element` VALUES ('Electro','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Electro.png');
INSERT INTO `element` VALUES ('Geo','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Geo.png');
INSERT INTO `element` VALUES ('Hydro','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Hydro.png');
INSERT INTO `element` VALUES ('Pyro','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Element_Icons/Pyro.png');
CREATE TABLE `weapon` (
  `Name` varchar(50) NOT NULL
,  `Stars` integer NOT NULL
,  `WeaponType` varchar(50) NOT NULL
,  `ImageLink` varchar(200) NOT NULL
,  PRIMARY KEY (`Name`)
,  CONSTRAINT `WeaponTypeArmaFK` FOREIGN KEY (`WeaponType`) REFERENCES `weapontype` (`WeaponType`)
);
INSERT INTO `weapon` VALUES ('4 Star Bow',4,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png');
INSERT INTO `weapon` VALUES ('4 Star Catalyst',4,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png');
INSERT INTO `weapon` VALUES ('4 Star Claymore',4,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png');
INSERT INTO `weapon` VALUES ('4 Star Polearm',4,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png');
INSERT INTO `weapon` VALUES ('4 Star Sword',4,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Generic_4Star.png');
INSERT INTO `weapon` VALUES ('A Thousand Blazing Suns',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_AThousandBlazingSuns.png');
INSERT INTO `weapon` VALUES ('A Thousand Floating Dreams',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_AThousandFloatingDreams.png');
INSERT INTO `weapon` VALUES ('Absolution',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Absolution.png');
INSERT INTO `weapon` VALUES ('Amos'' Bow',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AmosBow.png');
INSERT INTO `weapon` VALUES ('Aqua Simulacra',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AquaSimulacra.png');
INSERT INTO `weapon` VALUES ('Aquila Favonia',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_AquilaFavonia.png');
INSERT INTO `weapon` VALUES ('Astral Vulture''s Crimson Plumage',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_AstralVulturesCrimsonPlumage.png');
INSERT INTO `weapon` VALUES ('Azurelight',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Azurelight.png');
INSERT INTO `weapon` VALUES ('Beacon of the Reed Sea',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_BeaconOftheReedSea.png');
INSERT INTO `weapon` VALUES ('Calamity Queller',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_CalamityQueller.png');
INSERT INTO `weapon` VALUES ('Cashflow Supervision',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_CashflowSupervision.png');
INSERT INTO `weapon` VALUES ('Crane''s Echoing Call',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_CranesEchoingCall.png');
INSERT INTO `weapon` VALUES ('Crimson Moon''s Semblance',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_CrimsonMoonsSemblance.png');
INSERT INTO `weapon` VALUES ('Elegy for the End',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_ElegyForTheEnd.png');
INSERT INTO `weapon` VALUES ('Engulfing Lightning',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_EngulfingLightning.png');
INSERT INTO `weapon` VALUES ('Everlasting Moonglow',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_EverlastingMoonglow.png');
INSERT INTO `weapon` VALUES ('Fang of the Mountain King',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_FangOfTheMountainKing.png');
INSERT INTO `weapon` VALUES ('Fractured Halo',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_FracturedHalo.png');
INSERT INTO `weapon` VALUES ('Freedom-Sworn',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_Freedom-Sworn.png');
INSERT INTO `weapon` VALUES ('Haran Geppaku Futsu',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_HaranGeppakuFutsu.png');
INSERT INTO `weapon` VALUES ('Hunter''s Path',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_HuntersPath.png');
INSERT INTO `weapon` VALUES ('Jadefall''s Splendor',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_JadefallsSplendor.png');
INSERT INTO `weapon` VALUES ('Kagura''s Verity',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_KagurasVerity.png');
INSERT INTO `weapon` VALUES ('Key of Khaj-Nisut',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_KeyOfKhaj-Nisut.png');
INSERT INTO `weapon` VALUES ('Light of Foliar Incision',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_LightOfFoliarIncision.png');
INSERT INTO `weapon` VALUES ('Lost Prayer to the Sacred Winds',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_LostPrayerToTheSacredWinds.png');
INSERT INTO `weapon` VALUES ('Lumidouce Elegy',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_LumidouceElegy.png');
INSERT INTO `weapon` VALUES ('Memory of Dust',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_MemoryofDust.png');
INSERT INTO `weapon` VALUES ('Mistsplitter Reforged',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_MistsplitterReforged.png');
INSERT INTO `weapon` VALUES ('Peak Patrol Song',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_PeakPatrolSong.png');
INSERT INTO `weapon` VALUES ('Polar Star',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_PolarStar.png');
INSERT INTO `weapon` VALUES ('Primordial Jade Cutter',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_PrimordialJadeCutter.png');
INSERT INTO `weapon` VALUES ('Primordial Jade Winged-Polearm',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_PrimordialJadeWinged-Polearm.png');
INSERT INTO `weapon` VALUES ('Redhorn Stonethresher',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_RedhornStonethresher.png');
INSERT INTO `weapon` VALUES ('Silvershower Heartstrings',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_SilvershowerHeartstrings.png');
INSERT INTO `weapon` VALUES ('Skyward Atlas',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SkywardAtlas.png');
INSERT INTO `weapon` VALUES ('Skyward Blade',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_SkywardBlade.png');
INSERT INTO `weapon` VALUES ('Skyward Harp',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_SkywardHarp.png');
INSERT INTO `weapon` VALUES ('Skyward Pride',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_SkywardPride.png');
INSERT INTO `weapon` VALUES ('Skyward Spine',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_SkywardSpine.png');
INSERT INTO `weapon` VALUES ('Song of Broken Pines',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_SongOfBrokenPines.png');
INSERT INTO `weapon` VALUES ('Staff of Homa',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_StaffOfHoma.png');
INSERT INTO `weapon` VALUES ('Staff of the Scarlet Sands',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_StaffOftheScarletSands.png');
INSERT INTO `weapon` VALUES ('Starcaller''s Watch',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_StarcallersWatch.png');
INSERT INTO `weapon` VALUES ('Summit Shaper',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_SummitShaper.png');
INSERT INTO `weapon` VALUES ('Sunny Morning Sleep-In',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SunnyMorningSleep-In.png');
INSERT INTO `weapon` VALUES ('Surf''s Up',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_SurfsUp.png');
INSERT INTO `weapon` VALUES ('Symphonist of Scents',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_SymphonistOfScents.png');
INSERT INTO `weapon` VALUES ('The First Great Magic',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_TheFirstGreatMagic.png');
INSERT INTO `weapon` VALUES ('The Unforged',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_TheUnforged.png');
INSERT INTO `weapon` VALUES ('Thundering Pulse',5,'Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Bow_ThunderingPulse.png');
INSERT INTO `weapon` VALUES ('Tome of the Eternal Flow',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_TomeOfTheEternalFlow.png');
INSERT INTO `weapon` VALUES ('Tulaytullah''s Remembrance',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_TulaytullahsRemembrance.png');
INSERT INTO `weapon` VALUES ('Uraku Misugiri',5,'Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Sword_UrakuMisugiri.png');
INSERT INTO `weapon` VALUES ('Verdict',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_Verdict.png');
INSERT INTO `weapon` VALUES ('Vivid Notions',5,'Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Catalyst_Vivid Notions.png');
INSERT INTO `weapon` VALUES ('Vortex Vanquisher',5,'Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Polearm_VortexVanquisher.png');
INSERT INTO `weapon` VALUES ('Wolf''s Gravestone',5,'Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/Weapon_Icons/Claymore_WolfsGravestone.png');
CREATE TABLE `weapontype` (
  `WeaponType` varchar(50) NOT NULL
,  `ImageLink` varchar(200) NOT NULL
,  PRIMARY KEY (`WeaponType`)
);
INSERT INTO `weapontype` VALUES ('Bow','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Bow.png');
INSERT INTO `weapontype` VALUES ('Catalyst','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Catalyst.png');
INSERT INTO `weapontype` VALUES ('Claymore','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Claymore.png');
INSERT INTO `weapontype` VALUES ('Polearm','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Polearm.png');
INSERT INTO `weapontype` VALUES ('Sword','https://raw.githubusercontent.com/Entity378/GenshinDraftPick/refs/heads/main/Resources/Images/WeaponType_Icons/Sword.png');
CREATE INDEX "idx_character_ElementFK" ON "character" (`Element`);
CREATE INDEX "idx_character_WeaponTypeFK" ON "character" (`WeaponType`);
CREATE INDEX "idx_weapon_WeaponTypeFK" ON "weapon" (`WeaponType`);
END TRANSACTION;
