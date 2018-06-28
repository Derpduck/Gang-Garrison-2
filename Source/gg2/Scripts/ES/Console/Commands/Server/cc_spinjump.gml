console_addCommand("spinjump", "
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

//For everyone
if real(input[1])==-1 or string_lower(input[1])=='all'{
    with Player{
        autoSpinjump=1
    }
    console_print('Everyone has been given auto-spinjumping!')
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Everyone has been given'+C_GREEN+' auto-spinjumping!',global.printAdminCC)
    exit;
}

//Check ID
var player;
if string_letters(input[1])==''{
    if (trueID<ds_list_size(global.players)){
        player=ds_list_find_value(global.players,trueID)
        with player{
            if autoSpinjump=0{
                autoSpinjump=1
                console_print(c_filter(player.name)+' has been given auto-spinjumping.')
                var color;
                color=getPlayerColor(player, true);
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been given'+C_GREEN+' auto-spinjumping.',global.printAdminCC)
            }else if autoSpinjump==1{
                autoSpinjump=0
                console_print(c_filter(player.name)+' has had their auto-spinjumping removed.')
                var color;
                color=getPlayerColor(player, true);
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has had their'+C_GREEN+' auto-spinjumping'+C_WHITE+' removed.',global.printAdminCC)
            }
        }
        exit;
    }
}

//ID failed, check names
with Player{
    if name == string_lower(other.input[1]){
        if autoSpinjump=0{
            autoSpinjump=1
            console_print(c_filter(name)+' has been given auto-spinjumping.')
            var color;
            color=getPlayerColor(self, true)
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been given'+C_GREEN+' auto-spinjumping.',global.printAdminCC)
        }else if autoSpinjump==1{
            autoSpinjump=0
            console_print(c_filter(name)+' has had their auto-spinjumping removed.')
            var color;
            color=getPlayerColor(self, true)
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has had their'+C_GREEN+' auto-spinjumping'+C_WHITE+' removed.',global.printAdminCC)
        }
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: spinjump <Player ID/Player Name>')
console_print('Toggles the player having automatic spinjumping. Use <-1> or <all> to give it to everyone in the server.')
");
