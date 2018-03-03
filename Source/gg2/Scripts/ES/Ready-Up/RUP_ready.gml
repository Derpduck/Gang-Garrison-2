if global.isLive==1 exit;
if global.canRUP==0 exit;
if global.myself.team==TEAM_SPECTATOR exit;
write_ubyte(global.serverSocket, RUP_READY)
socket_send(global.serverSocket)
global.isReady=1
global.canRUP=0
ModController.alarm[3]=31/global.delta_factor
