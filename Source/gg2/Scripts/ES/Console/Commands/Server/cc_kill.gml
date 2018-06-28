console_addCommand("kill", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]
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

//Check ID
var player;
if string_letters(input[1])==''{
    if (trueID<ds_list_size(global.players)){
        player=ds_list_find_value(global.players,trueID)
        if(player.object!=-1){
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
            console_print(c_filter(player.name)+' has been killed by admin.')
            var color;
            color=getPlayerColor(player, true);
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been killed by admin.',global.printAdminCC)
            exit;
        }else{
            console_print(c_filter(player.name)+' is not alive.')
            exit;
        }
    }
}

//ID failed, check names
with Player{
    if name == string_lower(other.input[1]){
        if(object!=-1){
            with(player.object){
                if (!instance_exists(lastDamageDealer) || lastDamageDealer == Player){
                    sendEventPlayerDeath(Player, Player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                    doEventPlayerDeath(Player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
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
            console_print(c_filter(name)+' has been killed by admin.')
            var color;
            color=getPlayerColor(self, true);
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been killed by admin.',global.printAdminCC)
            exit;
        }else{
            console_print(c_filter(name)+' is not alive.')
            exit;
        }
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: kill <Player ID/Player Name>')
console_print('Kills the selected player. IDs are considered before names.')
");
