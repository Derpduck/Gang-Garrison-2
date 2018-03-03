console_addCommand("quit", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

write_ubyte(global.serverSocket, DC_REASON_USER)
socket_send(global.serverSocket)

with(Console){
    event_user(0)
    instance_destroy()
}
    
with(ChatBox){
    event_user(15)
    instance_destroy()
}

game_end();
", "
console_print('Syntax: quit')
console_print('Closes the game.')
")
