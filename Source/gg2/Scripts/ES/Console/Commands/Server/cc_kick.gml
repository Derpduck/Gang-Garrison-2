console_addCommand("kick", "
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
    if (trueID<ds_list_size(global.players) and trueID>0){
        player=ds_list_find_value(global.players,trueID)
        with player{
            kicked=true
            dcReason=KICK_ADMIN_KICK
            write_ubyte(socket, KICK)
            write_ubyte(socket, KICK_ADMIN_KICK)
            alarm[6]=30/global.delta_factor
        }
        
        console_print(c_filter(player.name)+' has been kicked from the server.')
        var color;
        color=getPlayerColor(player, true);
        chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been'+C_ORNGE+' kicked '+C_WHITE+'from the server.',global.printKBM)
        exit;
    }else if trueID==0{
        console_print('The host cannot be kicked.')
        exit;
    }
}

//ID failed, check names
with Player{
    if name == other.input[1]{
        if id==global.myself{
            console_print('The host cannot be kicked.')
            exit;
        }
        kicked=true
        dcReason=KICK_ADMIN_KICK
        write_ubyte(socket, KICK)
        write_ubyte(socket, KICK_ADMIN_KICK)
        alarm[6]=30/global.delta_factor
        
        console_print(c_filter(name)+' has been kicked from the server.')
        var color;
        color=getPlayerColor(self, true)
        chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been'+C_ORNGE+' kicked '+C_WHITE+'from the server.',global.printKBM)
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: kick <Player ID/Player Name>')
console_print('Kicks the selected player from the server. IDs are considered before names.')
");
