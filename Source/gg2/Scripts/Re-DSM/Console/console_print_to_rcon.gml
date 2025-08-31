// Send console print messages to rcon
var input, rconPlayer;
input = argument0;
rconPlayer = argument1

if (rconPlayer > 0)
{
    if (instance_exists(rconPlayer))
    {
        if (rconPlayer.dsmClientVersion >= 7)
        {
            write_ubyte(rconPlayer.socket, DSM_RCON_PRINT);
            write_ubyte(rconPlayer.socket, string_length(input));
            write_string(rconPlayer.socket, input);
        }
    }
}
