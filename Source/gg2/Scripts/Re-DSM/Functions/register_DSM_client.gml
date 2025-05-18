// Register yourself as a DSM client with the server
var registerPassword;
registerPassword = "ijustwanttheservertoknowihavedsm"
write_ubyte(global.serverSocket, DSM_RCON_LOGIN);
write_ubyte(global.serverSocket, string_length(registerPassword));
write_string(global.serverSocket, registerPassword);
socket_send(global.serverSocket);
