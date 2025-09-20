// Send any remaining data to players
with(Player)
{
    write_buffer(socket, global.sendBuffer);
    socket_send(socket);
}

// Reset send buffer on map change to clear unsent data
// Without this, replays created on a map change will not work
buffer_clear(global.sendBuffer);
