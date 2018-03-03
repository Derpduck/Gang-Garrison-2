chat_addCommandLocal("captain", "
write_ubyte(global.serverSocket, PUG_CAPTAIN)
socket_send(global.serverSocket)

", "
console_print('Syntax: captain')
console_print('Volunteer as a PUG captain.')
")
