chat_addCommandLocal("map", "
mapPicked=string(input[1])

write_ubyte(global.serverSocket, PUG_MAP)
write_ubyte(global.serverSocket, string_length(mapPicked))
write_string(global.serverSocket, mapPicked)
socket_send(global.serverSocket)

", "
console_print('Syntax: map <map name>')
console_print('Picks a map to be used in the PUG.')
")
