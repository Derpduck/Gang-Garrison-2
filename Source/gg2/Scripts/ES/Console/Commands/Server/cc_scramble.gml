console_addCommand("scramble", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]
if global.isRCON==1 and !global.isHost{
    //Parse string
    var stringLength;
    stringLength=string_length(string(command))
        
    write_ubyte(global.serverSocket,RCON_COMMAND)
    write_ubyte(global.serverSocket,stringLength)
    write_string(global.serverSocket,command)
    socket_send(global.serverSocket)
    exit;
}else if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
}
if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

/*
with(player.object){
    if (!instance_exists(lastDamageDealer) || lastDamageDealer == player){
        sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
        doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
    }else{
        var assistant;
        assistant = secondToLastDamageDealer;
    if (lastDamageDealer.object){
        if (lastDamageDealer.object.healer){
            assistant = lastDamageDealer.object.healer;
        }
    }
    sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
    doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
    }
}
player.team=newTeam
ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
*/

var newReds,newBlues;
newReds=0
newBlues=0

//Initial scramble
for(i=0; i<ds_list_size(global.players); i+=1){
    newTeam=choose(0,1)
    player=ds_list_find_value(global.players,i)
    if player.team!=TEAM_SPECTATOR{

        if(getCharacterObject(newTeam, player.class) != -1){
            with player {
                canSpawn = 1;
                if object != -1 with object instance_destroy();
                alarm[5] = 1;
            }
        }
        player.team=newTeam
        ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
        
        //Keep track of players per team
        if player.team==TEAM_RED{
            newReds+=1
        }else if player.team==TEAM_BLUE{
            newBlues+=1
        }
    }
}

//Check difference in player numbers for teams
if newReds-1>newBlues{
    var difference;
    difference=(newReds-newBlues)-1
    
    for(i=0; i<difference; i+=1){ 
        player=ds_list_find_value(global.players,i)
        if player.team==TEAM_RED{
            newTeam=TEAM_BLUE
            if(getCharacterObject(newTeam, player.class) != -1){
                with player {
                    canSpawn = 1;
                    if object != -1 with object instance_destroy();
                    alarm[5] = 1;
                }
            }
            player.team=newTeam
            ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
        }
    }
    console_print('Scramble was biased to red team, moving additional players.')
}else if newBlues-1>newReds{
    var difference;
    difference=(newBlues-newReds)-1
    
    for(i=0; i<difference; i+=1){ 
        player=ds_list_find_value(global.players,i)
        if player.team==TEAM_BLUE{
            newTeam=TEAM_RED
            if(getCharacterObject(newTeam, player.class) != -1){
                with player {
                    canSpawn = 1;
                    if object != -1 with object instance_destroy();
                    alarm[5] = 1;
                }
            }
            player.team=newTeam
            ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
        }
    }
    console_print('Scramble was biased to blue team, moving additional players.')
}

console_print('Teams have been scrambled.')

global.srvMsgChatPrint=global.chatPrintPrefix+C_WHITE+'Teams have been scrambled!'
console_miscmsg()
//", "
console_print('Syntax: scramble')
console_print('Randomly re-orders the teams. All players will be killed on doing this.')
//")
