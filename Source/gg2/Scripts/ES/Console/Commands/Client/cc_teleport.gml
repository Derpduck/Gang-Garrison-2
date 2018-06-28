console_addCommand("teleport", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if string_lower(input[1])='mouse'{
    xTele=mouse_x
    yTele=mouse_y
}else{
    xTele=real(string_digits(input[1]))
    yTele=real(string_digits(input[2]))
}

write_ubyte(global.serverSocket,PLAYER_TELEPORT)
write_ushort(global.serverSocket,xTele/5)
write_ushort(global.serverSocket,yTele/5)
socket_send(global.serverSocket)

console_print('Teleported to: X: '+string(xTele)+' | Y: '+string(yTele))
", "
console_print('Syntax: teleport <x position> <y position>')
console_print('Teleports the player to the specified location. Enter first value as <mouse> to teleport to your cursor.')
")
