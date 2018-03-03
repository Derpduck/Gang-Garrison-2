room_caption = global.currentMap;
global.startedGame = true;

if(!global.fullscreen){
    window_set_position((display_get_width()/2)-(window_get_width()/2), (display_get_height()/2)-(window_get_height()/2))
}

global.totalMapAreas = 1+instance_number(NextAreaO);

if global.totalMapAreas > 1 {
    global.area[1] = 0;
    
    for(i=2;i<=global.totalMapAreas;i+=1) {
        global.area[i] = instance_find(NextAreaO,i-2).y;
    }

    if (global.currentMapArea == 1)
    {
        with all if y > global.area[2] instance_destroy();
    }
    else if global.currentMapArea < global.totalMapAreas {
        with all if (y > global.area[global.currentMapArea+1] || y < global.area[global.currentMapArea]) && y > 0 instance_destroy();
    }
    else if global.currentMapArea == global.totalMapAreas {
        with all if y < global.area[global.currentMapArea] && y > 0 instance_destroy();
    }
}

with(ParallaxController)
    event_user(0);

offloadSpawnPoints();
with(Player) {
    canSpawn = 1;
    humiliated = 0;
}

if(instance_exists(IntelligenceBase) or instance_exists(Intelligence)){
    if (instance_exists(ControlPointSetupGate)){
        instance_create(0, 0, InvasionHUD);
    }else{
        instance_create(0, 0, CTFHUD);
    }
}else if(instance_exists(Generator)){
    instance_create(0,0,GeneratorHUD);
}else if(instance_exists(ArenaControlPoint)){
    instance_create(0, 0, ArenaHUD);
    if (ArenaHUD.roundStart==0){
        if global.isLive==1{
            with (Player){
                canSpawn = 0;
            }
        }
    }
}else if(instance_exists(KothControlPoint)){
    instance_create(0,0,KothHUD);
}else if(instance_exists(KothRedControlPoint) and instance_exists(KothBlueControlPoint)){
    with(ControlPoint){
        event_user(0);
    }
    instance_create(0,0,DKothHUD);
}else if instance_exists(ControlPoint){
    with(ControlPoint){
        event_user(0);
    }
    instance_create(0,0,ControlPointHUD);
}else if instance_exists(MGEController){
    instance_create(0,0,MGE_HUD)
}else{
    instance_create(0, 0, TeamDeathmatchHUD);
}

if global.smallSelectMenu==0{
    instance_create(0,0,TeamSelectController)
}else{
    instance_create(0,0,SmallTeamSelect)
}

//first time start
if !instance_exists(ReadyUpController){
    instance_create(0,0,ReadyUpController)
    with(ReadyUpController){
        event_user(1)
    }
}else{
    //subsequent rounds
    with(ReadyUpController){
        event_user(1)
    }
    
    if instance_exists(ArenaHUD){
        with (Player){
            canSpawn=1
        }
        with(ArenaHUD){
            endCount = 0;
            roundStart = 0;
            gameStarted = 0;
        }
    }
}

if global.currentConfig!=""{
    config_load(global.currentConfig)
}

if !instance_exists(KillLog){
    instance_create(0,0,KillLog)
    with (KillLog) {
        map = ds_map_create();
    }
}

sound_stop_all();

if(global.music == MUSIC_BOTH || global.music == MUSIC_INGAME_ONLY) {
    AudioControlPlaySong(global.IngameMusic, true);
}
instance_create(map_width()/2,map_height()/2,Spectator);

//Bots
//load_bot_nodes()
//global.mesh=initialize_mesh("Maps\"+global.currentMap+".png")

global.redCaps = 0;
global.blueCaps = 0;
global.winners = -1;
global.adcpWinner=""

if global.currentConfig==""{
    if global.autoStart==1{
        global.forceReady=1
    }else if global.autoStart==0{
        global.forceReady=0
    }
}/*else{
    if global.cfgrup==1{
        global.forceReady=0
    }else if global.cfgrup==0{
        global.forceReady=1
    }
}*/

if instance_exists(MGE_HUD){
    global.forceReady=1
}

if(instance_exists(GameServer))
{
    if(!GameServer.hostSeenMOTD and !global.dedicatedMode and global.welcomeMessage != "")
    {
        with(NoticeO)
            instance_destroy();
        with(instance_create(0, 0, NoticeO))
        {
            notice = NOTICE_CUSTOM;
            message = global.welcomeMessage;
        }
        GameServer.hostSeenMOTD = true;
    }
}
