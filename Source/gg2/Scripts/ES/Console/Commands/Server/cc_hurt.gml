console_addCommand("hurt", "
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
dmgAmount=real(input[2])

//Check ID
var player;
if string_letters(input[1])==''{
    if (trueID<ds_list_size(global.players)){
        player=ds_list_find_value(global.players,trueID)
        if(player.object!=-1){
            player.object.hp-=dmgAmount
            console_print(c_filter(player.name)+' has been hurt for '+string(dmgAmount)+' by admin.')
            var color;
            color=getPlayerColor(player, true);
            global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' hurt for'+P_RED+' '+string(dmgAmount)+C_WHITE+' damage.'
            console_sendmsg()
            exit;
        }else{
            console_print(c_filter(player.name)+' is not alive.')
            exit;
        }
    }
}

//ID failed, check names
with Player{
    if name == other.input[1]{
        if(object!=-1){
            object.hp-=dmgAmount
            console_print(c_filter(name)+' has been hurt for '+string(dmgAmount)+' by admin.')
            var color;
            color=getPlayerColor(self, true);
            global.srvMsgChatPrint=global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' hurt for'+P_RED+' '+string(dmgAmount)+C_WHITE+' damage.'
            console_sendmsg()
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
console_print('Syntax: hurt <Player ID/Player Name> <Damage Amount>')
console_print('Damages the selected player by the amount of HP specified. IDs are considered before names.')
");
