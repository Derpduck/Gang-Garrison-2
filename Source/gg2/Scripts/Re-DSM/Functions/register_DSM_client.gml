// Register yourself as a DSM client with the server
/*var registerPassword;
registerPassword = "ijustwanttheservertoknowihavedsm"
write_ubyte(global.serverSocket, DSM_RCON_LOGIN);
write_ubyte(global.serverSocket, string_length(registerPassword));
write_string(global.serverSocket, registerPassword);
socket_send(global.serverSocket);*/
write_ubyte(global.serverSocket, DSM_HANDSHAKE);
write_ubyte(global.serverSocket, DSM_VERSION);
socket_send(global.serverSocket);

global.myself.dsmClientVersion = DSM_VERSION;
