// Returns true if the game is successfully initialized, false if there was an error and we should quit.
ES_init()
initCharacterSpritePrefixes();
initAllHeadPoses();
initGear();
 
instance_create(0,0,RoomChangeObserver)
set_little_endian_global(true)
if file_exists("game_errors.log") file_delete("game_errors.log")
if file_exists("last_plugin.log") file_delete("last_plugin.log")

// Delete old left-over files created by the updater
var backupFilename;
backupFilename = file_find_first("gg2-old.delete.me.*", 0)
while(backupFilename != ""){
    file_delete(backupFilename)
    backupFilename = file_find_next()
}
file_find_close()

global.isHost=0

var customMapRotationFile, restart;
restart = false
initializeDamageSources()
global.sendBuffer = buffer_create()
global.tempBuffer = buffer_create()
global.HudCheck = false
global.map_rotation = ds_list_create()
global.CustomMapCollisionSprite = -1
window_set_region_scale(-1, false)
    
ini_open("gg2.ini")
    //client settings
    global.playerName = ini_read_string("Settings", "PlayerName", "Player")
    global.playerName = string_copy(global.playerName, 0, min(string_length(global.playerName), MAX_PLAYERNAME_LENGTH))
    ini_write_string("Settings", "PlayerName", global.playerName)
    
    global.fullscreen = ini_read_real("Settings", "Fullscreen", 0)
    window_set_fullscreen(global.fullscreen)
    ini_write_real("Settings", "Fullscreen", global.fullscreen)
    
    global.particles =  ini_read_real("Settings", "Particles", PARTICLES_NORMAL)
    ini_write_real("Settings", "Particles", global.particles)
    
    global.gibLevel = ini_read_real("Settings", "Gib Level", 3)
    ini_write_real("Settings", "Gib Level", global.gibLevel)
    
    global.medicRadar = ini_read_real("Settings", "Healer Radar", 1)
    ini_write_real("Settings", "Healer Radar", global.medicRadar)
    
    global.showHealer = ini_read_real("Settings", "Show Healer", 1)
    ini_write_real("Settings", "Show Healer", global.showHealer)
    
    global.showHealing = ini_read_real("Settings", "Show Healing", 1)
    ini_write_real("Settings", "Show Healing", global.showHealing)
    
    global.showHealthBar = ini_read_real("Settings", "Show Healthbar", 1)
    ini_write_real("Settings", "Show Healthbar", global.showHealthBar)
    
    global.showTeammateStats = ini_read_real("Settings", "Show Extra Teammate Stats", 1)
    ini_write_real("Settings", "Show Extra Teammate Stats", global.showTeammateStats)
    
    global.serverPluginsPrompt = ini_read_real("Settings", "ServerPluginsPrompt", 1)
    ini_write_real("Settings", "ServerPluginsPrompt", global.serverPluginsPrompt)
    
    global.restartPrompt = ini_read_real("Settings", "RestartPrompt", 1)
    ini_write_real("Settings", "RestartPrompt", global.restartPrompt)
    
    global.timerPos=ini_read_real("Settings","Timer Position", 0)
    ini_write_real("Settings", "Timer Position", global.timerPos)
    
    global.killLogPos=ini_read_real("Settings","Kill Log Position", 0)
    ini_write_real("Settings", "Kill Log Position", global.killLogPos)
    
    global.kothHudPos=ini_read_real("Settings","KoTH HUD Position", 0)
    ini_write_real("Settings", "KoTH HUD Position", global.kothHudPos)
    
    var CrosshairFilename, CrosshairRemoveBG;
    CrosshairFilename = ini_read_string("Settings", "CrosshairFilename", "")
    ini_write_string("Settings", "CrosshairFilename", CrosshairFilename)
    
    CrosshairRemoveBG = ini_read_real("Settings", "CrosshairRemoveBG", 1)
    ini_write_real("Settings", "CrosshairRemoveBG", CrosshairRemoveBG)
    
    global.queueJumping = ini_read_real("Settings", "Queued Jumping", 1)
    ini_write_real("Settings", "Queued Jumping", global.queueJumping)
    
    global.resolutionkind = ini_read_real("Settings", "Resolution", 1)
    rooms_menu_size()
    rooms_fix_views()
    global.changed_resolution = false
    ini_write_real("Settings", "Resolution", global.resolutionkind)
    
    global.frameratekind = ini_read_real("Settings", "Framerate", 0)
    if(global.frameratekind == 1){
        global.game_fps = 60;
    }else if global.frameratekind == 2{
        global.game_fps = 90;
    }else{
        global.game_fps = 30;
    }
    ini_write_real("Settings", "Framerate", global.frameratekind)
    
    global.monitorSync = ini_read_real("Settings", "Monitor Sync", 0)
    set_synchronization(global.monitorSync)
    ini_write_real("Settings", "Monitor Sync", global.monitorSync)
    
    //server settings
    global.useLobbyServer = ini_read_real("Settings", "UseLobby", 1)
    ini_write_real("Settings", "UseLobby", global.useLobbyServer)
    
    global.hostingPort = ini_read_real("Settings", "HostingPort", 8190)
    ini_write_real("Settings", "HostingPort", global.hostingPort)
    
    global.playerLimit = ini_read_real("Settings", "PlayerLimit", 10)
    ini_write_real("Settings", "PlayerLimit", global.playerLimit)
    
    global.multiClientLimit = ini_read_real("Settings", "MultiClientLimit", 3)
    ini_write_real("Settings", "MultiClientLimit", global.multiClientLimit)
    
    customMapRotationFile = ini_read_string("Server", "MapRotation", "")
    global.mapRotationFile = customMapRotationFile
    ini_write_string("Server", "MapRotation", customMapRotationFile)
    
    global.shuffleRotation = ini_read_real("Server", "ShuffleRotation", 1)
    ini_write_real("Server", "ShuffleRotation", global.shuffleRotation)
    
    global.timeLimitMins = max(1, min(255, ini_read_real("Server", "Time Limit", 10)))
    ini_write_real("Server", "Time Limit", global.timeLimitMins)
    
    global.serverPassword = ini_read_string("Server", "Password", "")
    ini_write_string("Server", "Password", global.serverPassword)
    
    global.dedicatedMode = ini_read_real("Server", "Dedicated", 0)
    ini_write_real("Server", "Dedicated", global.dedicatedMode)
    
    global.serverName = ini_read_string("Server", "ServerName", "My Server")
    ini_write_string("Server", "ServerName", global.serverName)
    
    global.welcomeMessage = ini_read_string("Server", "WelcomeMessage", "")
    ini_write_string("Server", "WelcomeMessage", global.welcomeMessage)
    
    global.caplimit = max(1, min(255, ini_read_real("Server", "CapLimit", 4)))
    global.caplimitBkup = global.caplimit
    ini_write_real("Server", "CapLimit", global.caplimit)
    
    global.killLimit = max(1, min(65535, ini_read_real("Server", "Deathmatch Kill Limit", 30)))
    ini_write_real("Server", "Deathmatch Kill Limit", global.killLimit)
    
    global.Server_RespawntimeSec = ini_read_real("Server", "Respawn Time", 5)
    ini_write_real("Server", "Respawn Time", global.Server_RespawntimeSec)
    
    global.mapdownloadLimitBps = ini_read_real("Server", "Total bandwidth limit for map downloads in bytes per second", 50000)
    ini_write_real("Server", "Total bandwidth limit for map downloads in bytes per second", global.mapdownloadLimitBps)
    
    global.attemptPortForward = ini_read_real("Server", "Attempt UPnP Forwarding", 0)
    ini_write_real("Server", "Attempt UPnP Forwarding", global.attemptPortForward) 
    
    global.serverPluginList = ini_read_string("Server", "ServerPluginList", "")
    ini_write_string("Server", "ServerPluginList", global.serverPluginList) 
    
    global.serverPluginsRequired = ini_read_real("Server", "ServerPluginsRequired", 0)
    if (string_length(global.serverPluginList) > 254) {
        show_message("Error: Server plugin list cannot exceed 254 characters")
        return false
    }
    ini_write_real("Server", "ServerPluginsRequired", global.serverPluginsRequired)
    
    //classlimit settings
    readClasslimitsFromIni()
    ini_write_real("Classlimits", "Scout", global.classlimits[CLASS_SCOUT])
    ini_write_real("Classlimits", "Pyro", global.classlimits[CLASS_PYRO])
    ini_write_real("Classlimits", "Soldier", global.classlimits[CLASS_SOLDIER])
    ini_write_real("Classlimits", "Heavy", global.classlimits[CLASS_HEAVY])
    ini_write_real("Classlimits", "Demoman", global.classlimits[CLASS_DEMOMAN])
    ini_write_real("Classlimits", "Medic", global.classlimits[CLASS_MEDIC])
    ini_write_real("Classlimits", "Engineer", global.classlimits[CLASS_ENGINEER])
    ini_write_real("Classlimits", "Spy", global.classlimits[CLASS_SPY])
    ini_write_real("Classlimits", "Sniper", global.classlimits[CLASS_SNIPER])
    ini_write_real("Classlimits", "Quote", global.classlimits[CLASS_QUOTE])
    
    //haxxy rewards
    global.rewardKey = unhex(ini_read_string("Haxxy", "RewardKey", ""))
    
    global.rewardId = ini_read_string("Haxxy", "RewardId", "")
ini_close()

//Key Mapping
ini_open("controls.gg2")
    global.jump = ini_read_real("Controls", "jump", ord("W"))
    global.down = ini_read_real("Controls", "down", ord("S"))
    global.left = ini_read_real("Controls", "left", ord("A"))
    global.right = ini_read_real("Controls", "right", ord("D"))
    global.attack = ini_read_real("Controls", "attack", MOUSE_LEFT)
    global.special = ini_read_real("Controls", "special", MOUSE_RIGHT)
    global.taunt = ini_read_real("Controls", "taunt", ord("F"))
    global.chat1 = ini_read_real("Controls", "chat1", ord("Z"))
    global.chat2 = ini_read_real("Controls", "chat2", ord("X"))
    global.chat3 = ini_read_real("Controls", "chat3", ord("C"))
    global.medic = ini_read_real("Controls", "medic", ord("E"))
    global.drop = ini_read_real("Controls", "drop", ord("B"))
    global.changeTeam = ini_read_real("Controls", "changeTeam", ord("N"))
    global.changeClass = ini_read_real("Controls", "changeClass", ord("M"))
    global.showScores = ini_read_real("Controls", "showScores", vk_shift)
ini_close()

sound_global_volume(global.volume/100)
global.MenuMusic=-1
global.IngameMusic=-1
global.FaucetMusic=-1
global.music = 3
global.killCam = 0
global.fadeScoreboard = 1
global.clientPassword = ""
global.autobalance = 0
global.updaterBetaChannel = 0
global.hideSpyGhosts = 1
global.backgroundHash = "default"
global.backgroundTitle = ""
global.backgroundURL = ""
global.backgroundShowVersion = true
//global.frameratekind = 0
//global.game_fps = 30
global.mapchanging = false    
global.currentMapArea=1
global.totalMapAreas=1
global.setupTimer=1800
global.joinedServerName=""
global.serverPluginsInUse=false
window_set_sizeable(0)
// Create plugin packet maps
global.pluginPacketBuffers = ds_map_create()
global.pluginPacketPlayers = ds_map_create()

//thy playerlimit shalt not exceed 48!
if (global.playerLimit > 48){
    global.playerLimit = 48
    if (global.dedicatedMode != 1){
        show_message("Warning: Player Limit cannot exceed 48. It has been set to 48")
    }
}

//Server respawn time calculator. Converts each second to a frame. (read: multiply by 30 :hehe:)
if (global.Server_RespawntimeSec == 0){
    global.Server_Respawntime = 1
}else{
    global.Server_Respawntime = global.Server_RespawntimeSec * 30    
}

cursor_sprite = CrosshairS
if (file_exists(CrosshairFilename)){
    sprite_replace(CrosshairS,CrosshairFilename,1,CrosshairRemoveBG,false,0,0)
    sprite_set_offset(CrosshairS,sprite_get_width(CrosshairS)/2,sprite_get_height(CrosshairS)/2)
}

// parse the protocol version UUID for later use
global.protocolUuid = buffer_create()
parseUuid(PROTOCOL_UUID, global.protocolUuid)

global.gg2lobbyId = buffer_create()
parseUuid(GG2_LOBBY_UUID, global.gg2lobbyId)

// Create abbreviations array for rewards use
initRewards()

var a, IPRaw, portRaw;
doubleCheck=0
global.launchMap = ""

for(a = 1; a <= parameter_count(); a += 1){
    if (parameter_string(a) == "-dedicated"){
        global.dedicatedMode = 1
    }else if (parameter_string(a) == "-restart"){
        restart = true
    }else if (parameter_string(a) == "-server"){
        IPRaw = parameter_string(a+1)
        if (doubleCheck == 1){
            doubleCheck = 2
        }else{
            doubleCheck = 1
        }
    }else if (parameter_string(a) == "-port"){
        portRaw = parameter_string(a+1)
        if (doubleCheck == 1){
            doubleCheck = 2
        }else{
            doubleCheck = 1
        }
    }else if (parameter_string(a) == "-map"){
        global.launchMap = parameter_string(a+1)
        global.dedicatedMode = 1
    }
}

if (doubleCheck == 2){
    global.serverPort = real(portRaw)
    global.serverIP = IPRaw
    global.isHost = false
    instance_create(0,0,Client)
}

load_map_rotation()

global.gg2Font = font_add_sprite(gg2FontS,ord("!"),false,0)
global.countFont = font_add_sprite(countFontS, ord("0"),false,2)
global.timerFont = font_add_sprite(timerFontS, ord("0"),true,5)
draw_set_font(global.gg2Font)
global.dealDamageFunction = "" // executed after dealDamage, with same args

if(!directory_exists(working_directory + "\Maps")) directory_create(working_directory + "\Maps")

instance_create(0, 0, AudioControl)
instance_create(0, 0, SSControl)

// custom dialog box graphics
message_background(popupBackgroundB)
message_button(popupButtonS)
message_text_font("Century",9,c_white,1)
message_button_font("Century",9,c_white,1)
message_input_font("Century",9,c_white,0)

calculateMonthAndDay()
builder_init()
character_init()

//if(!directory_exists(working_directory + "\Plugins")) directory_create(working_directory + "\Plugins")
//loadplugins()

//Windows 8 is known to crash GM when more than three (?) sounds play at once
//We'll store the kernel version (Win8 is 6.2, Win7 is 6.1) and check it there.
registry_set_root(1) // HKLM
global.NTKernelVersion = real(registry_read_string_ext("\SOFTWARE\Microsoft\Windows NT\CurrentVersion\", "CurrentVersion")) // SIC

globalvar previous_window_x, previous_window_y, previous_window_w;
previous_window_x = window_get_x()
previous_window_y = window_get_y()
previous_window_w = window_get_width()

if(global.dedicatedMode == 1){
    AudioControlToggleMute()
    room_goto_fix(Menu)
}else if(restart){
    room_goto_fix(Menu)
}

return true
