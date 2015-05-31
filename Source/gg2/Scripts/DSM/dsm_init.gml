//We'll do a better format for this than game_init

ini_open("DSM.ini")
    global.colouredProjectiles=ini_read_real("Cosmetic","ColouredProjectiles",1)
    ini_write_real("Cosmetic","ColouredProjectiles",global.colouredProjectiles)

    global.dsmHUDs=ini_read_real("Cosmetic","DSMHUDs",1)
    ini_write_real("Cosmetic","DSMHUDs",global.dsmHUDs)

    global.dsmBackground=ini_read_real("Cosmetic","DSMBackground",1) //0=normal, 1=dsm, match text colour, 2=dsm, any colour, 3=no downloaded bg
    ini_write_real("Cosmetic","DSMBackground",global.dsmBackground)

    global.dsmTextColour=ini_read_real("Cosmetic","DSMTextColour",0) //0=red, 1=blue, 2=green, 3=yellow, 4=purple, 5=random
    ini_write_real("Cosmetic","DSMTextColour",global.dsmTextColour)
    
    global.dsmStereoSound=ini_read_real("Settings","DSMStereoSound",1)
    ini_write_real("Settings","DSMStereoSound",global.dsmStereoSound)
    
    global.dsmSkipFaucet=ini_read_real("Settings","DSMSkipFaucet",0)
    ini_write_real("Settings","DSMSkipFaucet",global.dsmSkipFaucet)
    
    global.dsmShowKillLog=ini_read_real("Cosmetic","DSMShowKillLog",100)
    ini_write_real("Cosmetic","DSMShowKillLog",global.dsmShowKillLog)
    global.dsmShowKillLogReal=global.dsmShowKillLog/100
    
    global.dsmDrawIntelArrows=ini_read_real("Cosmetic","DSMDrawIntelArrows",1)
    ini_write_real("Cosmetic","DSMDrawIntelArrows",global.dsmDrawIntelArrows)
    
    global.dsmRespawnTimer=ini_read_real("Settings","DSMRespawnTimer",1) //0=off, 1=vanilla, 2=type 2
    ini_write_real("Settings","DSMRespawnTimer",global.dsmRespawnTimer)
    
    global.dsmHealingArrow=ini_read_real("Cosmetic","DSMHealingArrow",1)
    ini_write_real("Cosmetic","DSMHealingArrow",global.dsmHealingArrow)
    
    global.dsmPingDisplay=ini_read_real("Settings","DSMPingDisplay",1)
    ini_write_real("Settings","DSMPingDisplay",global.dsmPingDisplay)
    
    global.dsmFPSDisplay=ini_read_real("Settings","DSMFPSDisplay",0)
    ini_write_real("Settings","DSMFPSDisplay",global.dsmFPSDisplay)
    
    global.dsmHPText=ini_read_real("Cosmetic","DSMHPText",1) //0=off, 1=centre, 2=left
    ini_write_real("Cosmetic","DSMHPText",global.dsmHPText)
    
    global.dsmAmmoBars=ini_read_real("Cosmetic","DSMAmmoBars",1)
    ini_write_real("Cosmetic","DSMAmmoBars",global.dsmAmmoBars)
    
    global.dsmShowScoreboardWhenDead=ini_read_real("Settings","DSMShowScoreboardWhenDead",0)
    ini_write_real("Settings","DSMShowScoreboardWhenDead",global.dsmShowScoreboardWhenDead)
    
    global.dsmShowAssists=ini_read_real("Settings","DSMShowAssists",1)
    ini_write_real("Settings","DSMShowAssists",global.dsmShowAssists)
    
    global.dsmKillerInfo=ini_read_real("Settings","DSMKillerInfo",1)
    ini_write_real("Settings","DSMKillerInfo",global.dsmKillerInfo)
    
    global.dsmRecordStats=ini_read_real("Settings","DSMRecordStats",1)
    ini_write_real("Settings","DSMRecordStats",global.dsmRecordStats)
    
    global.dsmAlwaysShowSpinjump=ini_read_real("Cosmetic","DSMAlwaysShowSpinjump",1)
    ini_write_real("Cosmetic","DSMAlwaysShowSpinjump",global.dsmAlwaysShowSpinjump)
    
    global.dsmOldBlood=ini_read_real("Cosmetic","DSMOldBlood",0)
    ini_write_real("Cosmetic","DSMOldBlood",global.dsmOldBlood)
    
    global.dsmVolume=ini_read_real("Settings","DSMVolume",100)
    ini_write_real("Settings","DSMVolume",global.dsmVolume)
    sound_global_volume(global.dsmVolume/100)
    
    global.dsmHudOpacity=ini_read_real("Cosmetic","DSMHUDOpacity",100)
    ini_write_real("Cosmetic","DSMHUDOpacity",global.dsmHudOpacity)
    global.dsmHudOpacityReal=global.dsmHudOpacity/100
    
    global.dsmBodyFade=ini_read_real("Cosmetic","DSMBodyFade",0)
    ini_write_real("Cosmetic","DSMBodyFade",global.dsmBodyFade)
    
    global.dsmShowPluginList=ini_read_real("Settings","DSMShowPluginList",1)
    ini_write_real("Settings","DSMShowPluginList",global.dsmShowPluginList)
    
    global.dsmOldDeathSounds=ini_read_real("Settings","DSMOldDeathSounds",0)
    ini_write_real("Settings","DSMOldDeathSounds",global.dsmOldDeathSounds)
    
    global.dsmPlayerThreshold=ini_read_real("Settings","DSMPlayerThreshold",0)
    ini_write_real("Settings","DSMPlayerThreshold",global.dsmPlayerThreshold)
    
    global.dsmServerPasswordString=ini_read_string("Settings","DSMServerPasswordString","")
    ini_write_string("Settings","DSMServerPasswordString",global.dsmServerPasswordString)
    
    global.dsmAdvancedSpectator=ini_read_real("Cosmetic","DSMAdvancedSpectator",0)
    ini_write_real("Cosmetic","DSMAdvancedSpectator",global.dsmAdvancedSpectator)
    
    global.dsmRCONAllowed=ini_read_real("Settings","DSMRCONAllowed",0)
    ini_write_real("Settings","DSMRCONAllowed",global.dsmRCONAllowed)
    
    global.dsmRCONPassword=ini_read_string("Settings","DSMRCONPassword","")
    ini_write_string("Settings","DSMRCONPassword",global.dsmRCONPassword)
    
    global.dsmArrowOrigin=ini_read_real("Cosmetic","DSMArrowOrigin",0)
    ini_write_real("Cosmetic","DSMArrowOrigin",global.dsmArrowOrigin)
    
    global.dsmUseSecretFlag=ini_read_real("Cosmetics","DSMUseSecretFlag",1)
    ini_write_real("Cosmetic","DSMUseSecretFlag",global.dsmUseSecretFlag)
    
    global.dsmWriteConsoleLog=ini_read_real("Settings","DSMWriteConsoleLog",0)
    ini_write_real("Settings","DSMWriteConsoleLog",global.dsmWriteConsoleLog)
    
    global.dsmTransparentSkull=ini_read_real("Cosmetic","DSMTransparentSkull",0)
    ini_write_real("Cosmetic","DSMTransparentSkull",global.dsmTransparentSkull)
    
    global.dsmDisableCorpseTracking=ini_read_real("Cosmetic","DSMDisableCorpseTracking",0)
    ini_write_real("Cosmetic","DSMDisableCorpseTracking",global.dsmDisableCorpseTracking)
ini_close()

//DSM Controls
ini_open("controls.gg2")
    global.dsmQuickX4=ini_read_real("Controls","DSMQuickX4",vk_control)
    global.dsmSuperburst=ini_read_real("Controls","DSMSuperburst",ord("R"))
    global.dsmShowWM=ini_read_real("Controls","DSMShowWM",vk_f7)
    global.dsmConsoleKey=ini_read_real("Controls","DSMConsoleKey",vk_f2)
    global.dsmScreenshot=ini_read_real("Controls","DSMScreenshot",mb_middle)
    global.dsmChatHideButton=ini_read_real("Controls","DSMChatHideButton",ord("I"))
    global.dsmReduceEyePain=ini_read_real("Controls","DSMReduceEyePain",ord("O"))

    //global.toggleSPD=ini_read_real("Controls","ToggleScorePerDeath",vk_f11)
ini_close()

//Variables
global.DSM_ConsoleFont=font_add_sprite(DSM_ConsoleFontS,ord("!"),false,0);
global.myCurrentPlugins=""
global.totalCurrentPlugins=""
globalvar colour1, colour2;
global.dsmMapChange=0
global.dsmBinds=ds_list_create()
global.dsmBindCommands=ds_list_create()
read_binds_from_file()
global.isRCON=0
global.chatHide=0
global.chatHideJustChanged=0
global.enablePrimeNo=0

//Run other DSM scripts
console_init()
spriteLoader()
soundLoader()
stats_init()
//Plugin Fixes and Mods
chatFix_miku()
chat_paste()
chat_hide()

if(!directory_exists(working_directory+"\Custom")) directory_create(working_directory+"\Custom")
if(!directory_exists(working_directory+"\ConsoleLogs")) directory_create(working_directory+"\ConsoleLogs")

//replays
global.replayBuffer = buffer_create();
global.isPlayingReplay = false;
global.replayTime = 0;
global.recordingReplay = false;
global.isPlayingReplay = false;
