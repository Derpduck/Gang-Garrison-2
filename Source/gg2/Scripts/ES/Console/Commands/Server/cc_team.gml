console_addCommand("team", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]+' '+input[2]
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

trueID=floor(real(string_digits(input[1])))

newT=input[2]
newTString=''
if newT==string_lower('red') or newT==string(1){
    newT=TEAM_RED
    newTString='Red'
}else if newT==string_lower('blue') or newT==string(2){
    newT=TEAM_BLUE
    newTString='Blue'
}else if newT==string_lower('spec') or newT==string_lower('spectator') or newT==string_lower('none') or newT==string(0){
    newT=TEAM_SPECTATOR
    newTString='Spectator'
}else{
    console_print('Invalid team selection.')
    exit;
}

//Check ID
var player;
if string_letters(input[1])==''{
    if (trueID<ds_list_size(global.players)){
        player=ds_list_find_value(global.players,trueID)
        
        if player.team==newT{
            console_print('Player is already on this team.')
            exit;
        }
        
        if player.team==TEAM_SPECTATOR{
            player.alarm[5] = global.Server_Respawntime / global.delta_factor
        }
        
        var color,oldColor;
        oldColor=getPlayerColor(player, true)
        
        player.team=newT
        if player.object!=-1{
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
        }
        ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
        console_print(c_filter(player.name)+' has been moved to team: '+newTString+'.')
        
        color=getPlayerColor(player, true)
        chat_sendmsg(global.chatPrintPrefix+oldColor+c_filter(player.name)+C_WHITE+' was moved to team: '+color+newTString+C_WHITE+'.',global.printAdminCC)
        exit;
    }
}

//ID failed, check names
with Player{
    if name == string_lower(other.input[1]){
        if team==other.newT{
            console_print('Player is already on this team.')
            exit;
        }
        
        if team==TEAM_SPECTATOR{
            alarm[5] = global.Server_Respawntime;
        }
        
        var color,oldColor;
        oldColor=getPlayerColor(id, true)
        
        team=other.newT
        if object!=-1{
            with(object){
                if (!instance_exists(lastDamageDealer) || lastDamageDealer == Player){
                    sendEventPlayerDeath(Player, Player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                    doEventPlayerDeath(Player, Player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                }else{
                    var assistant;
                    assistant = secondToLastDamageDealer;
                    if (lastDamageDealer.object){
                        if (lastDamageDealer.object.healer){
                            assistant = lastDamageDealer.object.healer;
                        }
                    }
                    sendEventPlayerDeath(Player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                    doEventPlayerDeath(Player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                }
            }
        }
        ServerPlayerChangeteam(ds_list_find_index(global.players,id),team,global.sendBuffer)
        console_print(c_filter(name)+' has been moved to team: '+other.newTString+'.')
        
        color=getPlayerColor(self, true)
        chat_sendmsg(global.chatPrintPrefix+oldColor+c_filter(name)+C_WHITE+' was moved to team: '+color+other.newTString+C_WHITE+'.',global.printAdminCC)
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: team <Player ID/Player Name> <new team>')
console_print('Moves the selected player to the desired team. Team can be chosen by name or number. Use <0> for spectator team.')
");
