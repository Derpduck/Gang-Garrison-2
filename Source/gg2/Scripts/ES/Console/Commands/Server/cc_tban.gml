console_addCommand("tban", "
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
        ds_list_add(global.banned_ips,socket_remote_ip(player.socket))
        with player{
            banned=true
            dcReason=KICK_BANNED
            write_ubyte(socket, KICK)
            write_ubyte(socket, KICK_TEMP_BANNED)
            alarm[6]=30/global.delta_factor
        }
        
        console_print(c_filter(player.name)+' has been temporarily banned from the server.')
        if global.chatPBF_2!=1 and global.srvMsgChatPrint==''{
            var color;
            color=getPlayerColor(player, true);
            global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been'+P_RED+' temporarily banned '+C_WHITE+'from the server.'
            console_sendmsg()
        }
        exit;
    }else if trueID==0{
        console_print('The host cannot be banned.')
        exit;
    }
}

//ID failed, check names
with Player{
    if name == other.input[1]{
        if id==global.myself{
            console_print('The host cannot be banned.')
            exit;
        }
        ds_list_add(global.banned_ips, socket_remote_ip(socket))
        banned=true
        dcReason=KICK_BANNED
        write_ubyte(socket, KICK)
        write_ubyte(socket, KICK_BANNED)
        alarm[6]=30/global.delta_factor
        
        console_print(c_filter(name)+' has been temporarily banned from the server.')
        var color;
        color=getPlayerColor(self, true)
        global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been'+P_RED+' temporarily banned '+C_WHITE+'from the server.'
        console_sendmsg()
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: tban <Player ID/Player Name>')
console_print('Temporarily bans the selected player from the server, until the server is restarted.')
console_print('IDs are considered before names.')
console_print('You can unban a person with the <unban> command.')
");
