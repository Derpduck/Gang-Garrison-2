console_addCommand("password", "
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

if input[1]==''{
    global.serverPassword=''
    console_print('Server password removed.')
    exit;
}

if global.serverPassword==input[1]{
    console_print('Attempting to change password to current password; remains unchanged.')
    exit;
}

global.serverPassword=string(input[1])
console_print('Password set to: '+global.serverPassword)

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Password set to: '+C_GREEN+global.serverPassword+C_WHITE+'.',global.printPassword)
exit;

//Write the new password to the ini
//ini_open('gg2.ini')
//    ini_write_string('Server','Password',input[1])
//ini_close()
", "
console_print('Syntax: password <password>')
console_print('Changes the current sever password. Can be used to remove the password by leaving the password input blank.')
")
