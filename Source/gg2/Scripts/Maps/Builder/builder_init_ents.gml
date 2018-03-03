// Add gamemodes
var ctf, cp, adcp, koth, dkoth, arena, gen;
addGamemode("Free mode");
ctf = addGamemode("Capture the flag (ctf)", '
    var redCount, blueCount;
    redCount = 0;
    blueCount = 0;
    with(LevelEntity) {
        if (type == "redintel") redCount += 1;
        else if (type == "blueintel") blueCount += 1;
    }
    if (redCount != 1 || blueCount != 1) return false;
    return true;
', "Ctf or invasion mode needs 1 red and 1 blue intelligence.");
cp = addGamemode("Control points (cp)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "controlPoint1" || type == "controlPoint2" || type == "controlPoint3" || type == "controlPoint4" || type == "controlPoint5") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints == 0 || controlpoints > 5 || zones == 0) return false;
    return true;
', "CP needs 1-5 control points and capturezones.");
adcp = addGamemode("A/D control points (adcp)", '
    var controlpoints, zones, gates;
    controlpoints = 0;
    zones = 0;
    gates = 0;
    with(LevelEntity) {
        if (type == "controlPoint1" || type == "controlPoint2" || type == "controlPoint3" || type == "controlPoint4" || type == "controlPoint5") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
        else if (type == "SetupGate") gates += 1;
    }
    if (controlpoints == 0 || controlpoints >= 5 || zones == 0 || gates == 0) return false;
    return true;
', "A/D CP needs 1-5 control points, capturezones and setup gates.");
koth = addGamemode("King of the hill (koth)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "KothControlPoint") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints != 1 || zones == 0) return false;
    return true;
', "KOTH needs 1 control point and capturezones.");
dkoth = addGamemode("Dual king of the hill (dkoth)" ,'
    var redcontrolpoints, bluecontrolpoints, zones;
    redcontrolpoints = 0;
    bluecontrolpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "KothRedControlPoint") redcontrolpoints += 1;
        else if (type == "KothBlueControlPoint") bluecontrolpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (redcontrolpoints != 1 || bluecontrolpoints != 1 || zones == 0) return false;
    return true;
', "DKOTH needs 1 red control point, 1 blue control point and capturezones.");
arena = addGamemode("Arena (arena)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "ArenaControlPoint") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints != 1 || zones == 0) return false;
    return true;
', "Arena needs 1 control point and capturezones.");
gen = addGamemode("Generator (gen)", '
    var redgen, bluegen;
    redgen = 0;
    bluegen = 0;
    with(LevelEntity) {
        if (type == "GeneratorRed") redgen += 1;
        else if (type == "GeneratorBlue") bluegen += 1;
    }
    if (redgen != 1 || bluegen != 1) return false;
    return true;
', "Gen needs 1 red and 1 blue generator.");
mge = addGamemode("MGE", '
    var mgecontroller,healcab;
    mgecontroller = 0;
    healcab = 0;
    with(LevelEntity) {
        if (type == "MGEController") mgecontroller += 1;
        if (type == "medCabinet") healcab += 1;
    }
    if (mgecontroller != 1 or healcab < 1) return false;
    return true;
', "MGE needs an MGE Controller and a Med Cabinet anywhere on the map.");
// Add entities
addEntity("spawnroom", -1, "{xscale:1,yscale:1}", SpawnRoom, sprite64, 1, entityButtonS, 74, "Players can instantly respawn in this area.");
addEntity("redspawn", -1, "{}", SpawnPointRed, spawnS, 0, entityButtonS, 30, "Default spawn locator for the red team.");
addEntity("redspawn1", cp | adcp | koth | dkoth | mge, "{}", SpawnPointRed1, spawnS, 1, entityButtonS, 34, "Red forward spawn \#1");
addEntity("redspawn2", cp | adcp | dkoth | mge, "{}", SpawnPointRed2, spawnS, 2, entityButtonS, 38, "Red forward spawn \#2");
addEntity("redspawn3", adcp | mge, "{}", SpawnPointRed3, spawnS, 3, entityButtonS, 42, "Red forward spawn \#3");
addEntity("redspawn4", adcp | mge, "{}", SpawnPointRed4, spawnS, 4, entityButtonS, 46, "Red forward spawn \#4");
addEntity("bluespawn", -1, "{}", SpawnPointBlue, spawnS, 5, entityButtonS, 32, "Default spawn locator for the blue team.");
addEntity("bluespawn1", cp | adcp | koth | dkoth | mge, "{}", SpawnPointBlue1, spawnS, 6, entityButtonS, 36, "Blue forward spawn \#1");
addEntity("bluespawn2", cp | adcp | dkoth | mge, "{}", SpawnPointBlue2, spawnS, 7, entityButtonS, 40, "Blue forward spawn \#2");
addEntity("bluespawn3", adcp | mge, "{}", SpawnPointBlue3, spawnS, 8, entityButtonS, 44, "Blue forward spawn \#3");
addEntity("bluespawn4", adcp | mge, "{}", SpawnPointBlue4, spawnS, 9, entityButtonS, 48, "Blue forward spawn \#4");
addEntity("redintel", ctf, "{}", IntelligenceBaseRed, IntelligenceRedS, 0, entityButtonS, 0, "The red intelligence spawnpoint.");
addEntity("blueintel", ctf, "{}", IntelligenceBaseBlue, IntelligenceBlueS, 0, entityButtonS, 2, "The blue intelligence spawnpoint.");
addEntity("redteamgate", ctf | cp | adcp | gen | koth | dkoth | mge, "{xscale:1,yscale:1}",  RedTeamGate, sprite45, 1, entityButtonS, 84, "A wall that blocks blue players and bullets.");
addEntity("blueteamgate", ctf | cp | adcp | gen | koth | dkoth | mge, "{xscale:1,yscale:1}", BlueTeamGate, sprite45, 2, entityButtonS, 86, "A wall that blocks red players and bullets.");
addEntity("redteamgate2", 0, "{xscale:1,yscale:1}", RedTeamGate2, sprite44, 1, entityButtonS, 90, "A floor that blocks blue players and bullets.");
addEntity("blueteamgate2", 0, "{xscale:1,yscale:1}", BlueTeamGate2, sprite44, 2, entityButtonS, 92, "A floor that blocks red players and bullets.");
addEntity("redintelgate", ctf, "{xscale:1,yscale:1}", RedIntelGate, sprite45, 7, entityButtonS, 8, "A wall that blocks players carrying the red intel.");
addEntity("blueintelgate", ctf, "{xscale:1,yscale:1}", BlueIntelGate, sprite45, 8, entityButtonS, 10, "A wall that blocks players carrying the blue intel.");
addEntity("redintelgate2", 0, "{xscale:1,yscale:1}", RedIntelGate2, sprite44, 6, entityButtonS, 4, "A floor that blocks players carrying the red intel.");
addEntity("blueintelgate2", 0, "{xscale:1,yscale:1}", BlueIntelGate2, sprite44, 7, entityButtonS, 6, "A floor that blocks players carrying the blue intel.");
addEntity("intelgatehorizontal", 0, "{xscale:1,yscale:1}", IntelGateHorizontal, sprite44, 8, entityButtonS, 94, "A floor that blocks players carrying the intel.");
addEntity("intelgatevertical", ctf, "{xscale:1,yscale:1}", IntelGateVertical, sprite45, 9, entityButtonS, 96, "A wall that blocks players carrying the intel.");
addEntity("medCabinet", ctf | cp | adcp | gen | koth | dkoth | mge, "{xscale:1,yscale:1,heal:true,refill:true,uber:false}", HealingCabinet, sprite74, 0, entityButtonS, 64, "Refills health and ammo.");
addEntity("killbox", -1, "{xscale:1,yscale:1}", KillBox, sprite64, 2, entityButtonS, 58, "Kills a player.");
addEntity("pitfall", -1, "{xscale:1,yscale:1}", PitFall, sprite64, 3, entityButtonS, 62, "Kills a player.");
addEntity("fragbox", -1, "{xscale:1,yscale:1}", FragBox, sprite64, 4, entityButtonS, 60, "Gibs a player.");
addEntity("playerwall", -1, "{xscale:1,yscale:1}", PlayerWall, sprite45, 3, entityButtonS, 50, "A wall that blocks players but not bullets.");
addEntity("playerwall_horizontal", 0, "{xscale:1,yscale:1}", PlayerWallHorizontal, sprite44, 3, entityButtonS, 54, "A floor that blocks player but not bullets.");
addEntity("bulletwall", -1, "{xscale:1,yscale:1, distance:-1}", BulletWall, sprite45, 4, entityButtonS, 52, "A wall that blocks bullets but not players.");
addEntity("bulletwall_horizontal", 0, "{xscale:1,yscale:1}", BulletWallHorizontal, sprite44, 4, entityButtonS, 56, "A floor that blocks bullets but not players.");
addEntity("leftdoor", -1, "{xscale:1,yscale:1}", LeftDoor, sprite45, 5, entityButtonS, 102, "Blocks players trying to go left");
addEntity("rightdoor", -1, "{xscale:1,yscale:1}", RightDoor, sprite45, 6, entityButtonS, 104, "Blocks players trying to go right.");
addEntity("controlPoint1", cp | adcp, "{}", ControlPoint1, ControlPointNeutralS, 0, entityButtonS, 12, "Control point \#1");
addEntity("controlPoint2", cp | adcp, "{}", ControlPoint2, ControlPointNeutralS, 2, entityButtonS, 14, "Control point \#2");
addEntity("controlPoint3", cp | adcp, "{}", ControlPoint3, ControlPointNeutralS, 3, entityButtonS, 16, "Control point \#3");
addEntity("controlPoint4", cp | adcp, "{}", ControlPoint4, ControlPointNeutralS, 4, entityButtonS, 18, "Control point \#4");
addEntity("controlPoint5", cp | adcp, "{}", ControlPoint5, ControlPointNeutralS, 5, entityButtonS, 20, "Control point \#5");
addEntity("NextAreaO", ctf | cp | adcp | gen | koth | dkoth, "{}", NextAreaO, NextAreaS, 4, entityButtonS, 106, "Marks the next arena in multi stage maps.");
addEntity("CapturePoint", cp | adcp | koth | dkoth | arena, "{xscale:1,yscale:1}", CaptureZone, CaptureZoneS, 0, entityButtonS, 26, "Players touching this will start capping the nearest control point.");
addEntity("SetupGate", ctf | adcp, "{xscale:1,yscale:1}", ControlPointSetupGate, SetupGateS, 0, entityButtonS, 28, "Prevents players from passing during setup time.");
addEntity("ArenaControlPoint", arena, "{}", ArenaControlPoint, ControlPointNeutralS, 0, entityButtonS, 22, "Arena control point.");
addEntity("GeneratorRed", gen, "{}", GeneratorRed, GeneratorRedS, 0, entityButtonS, 76, "Location of the red generator.");
addEntity("GeneratorBlue", gen, "{}", GeneratorBlue, GeneratorBlueS, 0, entityButtonS, 78, "Location of the blue generator.");
addEntity("MoveBoxUp", -1, "{xscale:1,yscale:1,speed:5}", MoveBoxUp, sprite64, 5, entityButtonS, 66, "Move box up");
addEntity("MoveBoxDown", -1, "{xscale:1,yscale:1,speed:5}", MoveBoxDown, sprite64, 6, entityButtonS, 68, "Move box down");
addEntity("MoveBoxLeft", -1, "{xscale:1,yscale:1,speed:5}", MoveBoxLeft, sprite64, 7, entityButtonS, 72, "Move box left");
addEntity("MoveBoxRight", -1, "{xscale:1,yscale:1,speed:5}", MoveBoxRight, sprite64, 8, entityButtonS, 70, "Move box right ");
addEntity("KothControlPoint", koth, "{}", KothControlPoint, ControlPointNeutralS, 0, entityButtonS, 24, "KOTH control point");
addEntity("KothRedControlPoint", dkoth, "{}", KothRedControlPoint, ControlPointRedS, 0, entityButtonS, 98, "Red KOTH control point");
addEntity("KothBlueControlPoint", dkoth, "{}", KothBlueControlPoint, ControlPointBlueS, 0, entityButtonS, 100, "Blue KOTH control point");
addEntity("dropdownPlatform", -1, "{xscale:1,yscale:1}", DropdownPlatform, sprite44, 5, entityButtonS, 80, "Dropdown platform");
addEntity("foreground", -1, "{xscale:1,yscale:1,depth:-2,fade:true,opacity:1,animationspeed:0,trigger:0,distance:0,resource:''}", SpriteObject, sprite64, 0, entityButtonS, 108, "Resizable foreground.");
addEntity("foreground_scale", -1, "{scale:1,depth:-2,fade:true,opacity:1,animationspeed:0,trigger:0,distance:0,resource:''}", SpriteObject, sprite64, 0, entityButtonS, 110, "Scalable foreground.");
addEntity("moving_platform", -1, "{scale:1,animationspeed:0,trigger:0,resource:'',top:60,left:0,upspeed:3,downspeed:3}", MovingPlatform, sprite64, 0, entityButtonS, 112, "A moving platform.");
addEntity("MGEController", mge, "{}", MGEController, sprite64, 9, entityButtonS, 114, "Activated MGE Mode.");
