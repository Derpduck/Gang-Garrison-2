//trackers
global.isLive=0
global.forceReady=0
global.isReady=0
global.readyTotal=0
global.readyMax=0

//store rup data
globalvar rupPlayers;
if global.madeRupList==0{
    rupPlayers=ds_map_create()
    global.madeRupList=1
}

//timers
global.rupTime=5*30
global.preventEarlyStart=1//5*30
global.canStart=0
global.canRUP=1

//rup chat command handlers
global.chatReady=0
global.chatUnready=0
global.chatToggleReady=0
