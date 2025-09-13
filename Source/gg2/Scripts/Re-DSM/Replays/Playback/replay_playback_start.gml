var acceptor;
// Fake connection to server to simulate being a client for replay playback
acceptor = tcp_listen(global.serverPort);

global.serverSocket = tcp_connect(global.serverIP, global.serverPort);

do
{
    global.replaySocket = socket_accept(acceptor);
    io_handle();
}
until (global.replaySocket >= 0)
socket_destroy(acceptor);
