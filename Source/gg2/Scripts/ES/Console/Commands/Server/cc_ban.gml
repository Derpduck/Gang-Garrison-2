console_addCommand("ban", "
/*
//HOST ONLY
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if !global.isHost{
    console_print('Only the host can use this command.')
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
            write_ubyte(socket, KICK_BANNED)
            socket_destroy_abortive(socket)
            socket=-1
        }
        
        //Write to file
        var text, str, i;
        str=''
        for (i=0; i<ds_list_size(global.banned_ips); i+=1){
            str+=ds_list_find_value(global.banned_ips,i)+chr(10)
        }
        text=file_text_open_write('Banned_IPs.txt')
        file_text_write_string(text,str)
        file_text_close(text)
        
        console_print(c_filter(player.name)+' has been banned from the server.')
        if global.chatPBF_2!=1 and global.srvMsgChatPrint==''{
            var color;
            color=getPlayerColor(player, true);
            global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been'+P_RED+' banned '+C_WHITE+'from the server.'
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
        socket_destroy_abortive(socket)
        socket=-1
        
        //Write to file
        var text, str, i;
        str=''
        for (i=0; i<ds_list_size(global.banned_ips); i+=1){
            str+=ds_list_find_value(global.banned_ips,i)+chr(10)
        }
        text=file_text_open_write('Banned_IPs.txt')
        file_text_write_string(text,str)
        file_text_close(text)
        
        console_print(c_filter(name)+' has been banned from the server.')
        var color;
        color=getPlayerColor(player, true)
        global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been'+P_RED+' banned '+C_WHITE+'from the server.'
        console_sendmsg()
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: ban <Player ID/Player Name>')
console_print('Bans the selected player from the server. IDs are considered before names.')
console_print('You can unban a person with the <unban> command, or by removing their IP from the banlist,')
console_print('but that will not take effect until the server is restarted.')
");
