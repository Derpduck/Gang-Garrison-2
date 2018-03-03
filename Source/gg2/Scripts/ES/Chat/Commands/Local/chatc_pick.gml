chat_addCommandLocal("pick", "
playerPicked=real(string_digits(input[1]))

write_ubyte(global.serverSocket, PUG_PICK)
write_byte(global.serverSocket, playerPicked)
socket_send(global.serverSocket)

", "
console_print('Syntax: pick <player number>')
console_print('Select a player to be on your team as a PUG captain.')
")
