//argument0=name of config defined by user
var configName;
configName=string(argument0)

//no config loaded
//if global.currentConfig==""{
//    return 0;
//    exit;
//}

//non-existing config attempted to load
if !file_exists(working_directory+"\Configs\"+configName+".cfg"){
    if room==ModOptions{
        show_message("Config: '"+configName+"' does not exist. Exiting.")
    }
    if room==CustomMapRoom{
        config_print_load(1,configName)
    }
    return 0;
    exit;
}

/*
if global.defaultConfig!="" and !file_exists(working_directory+"\cfg_"+global.defaultConfig+".cfg"){
    show_message("Default config does not exist. Ensure it has been typed correctly.")
    return 0;
    exit;
}

if global.defaultConfig==""{
    return 0;
    exit;
}*/

cfgFile=file_text_open_read(working_directory+"\Configs\"+configName+".cfg")
while !file_text_eof(cfgFile){
    fileString=file_text_read_string(cfgFile)
    execute_string(fileString)
    file_text_readln(cfgFile)
}
file_text_close(cfgFile)

global.currentConfig=cfg_name
global.timeLimitMins=cfg_timeLimit
//change timer for all gamemode huds
with(CTFHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(InvasionHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(ControlPointHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(GeneratorHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(KothHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(DKothHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}
with(TeamDeathmatchHUD){
    timeLimit=global.timeLimitMins*30*60;
    timer=timeLimit;
}

global.caplimit=cfg_capLimit
global.arenaRoundsToWin=cfg_arenaWinLimit
global.killLimit=cfg_deathmatchKillLimit
global.adcpStopwatch=cfg_adcp
global.healCabs=cfg_medCabs
global.spawnDoors=cfg_spawnDoors

//These require special cases
global.cfgrup=cfg_rup
if global.cfgrup==1{
    global.forceReady=0
}else if global.cfgrup==0{
    global.forceReady=1
}

global.Server_RespawntimeSec=cfg_respawnTime
if global.Server_RespawntimeSec==0{
    global.Server_Respawntime=1
}else{
    global.Server_Respawntime=global.Server_RespawntimeSec*30
}

global.minPlayers=cfg_minPlayers
//player limit is not big enough to get the minimum number of players, fix this
if global.playerLimit<global.minPlayers*2{
    global.playerLimit=min(48,global.minPlayers*2)
}
global.maxPlayers=cfg_maxPlayers

//global.cfgclasslimits=cfg_classlimits
global.classlimits[CLASS_SCOUT]=cl_scout
global.classlimits[CLASS_PYRO]=cl_pyro
global.classlimits[CLASS_SOLDIER]=cl_soldier
global.classlimits[CLASS_HEAVY]=cl_heavy
global.classlimits[CLASS_DEMOMAN]=cl_demoman
global.classlimits[CLASS_MEDIC]=cl_medic
global.classlimits[CLASS_ENGINEER]=cl_engineer
global.classlimits[CLASS_SPY]=cl_spy
global.classlimits[CLASS_SNIPER]=cl_sniper
global.classlimits[CLASS_QUOTE]=cl_quote

//Generate a string with all the options in (excluding class limits)
global.configSuperString=string("Name: "+string(cfg_name)
+"#Ready-Up: "+string(cfg_rup)
+"#Time Limit: "+string(cfg_timeLimit)
+"#Respawn Time: "+string(cfg_respawnTime)
+"#Cap Limit: "+string(cfg_capLimit)
+"#Arena Limit: "+string(cfg_arenaWinLimit)
+"#Deathmatch Limit: "+string(cfg_deathmatchKillLimit)
+"#ADCP Stopwatch: "+string(cfg_adcp)
+"#Med Cabinets: "+string(cfg_medCabs)
+"#Spawn Doors: "+string(cfg_spawnDoors))

return 1;
