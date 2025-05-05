// Built-in checks for who can execute each console command, to prevent illegal commands
// argument0 = Which level of security to apply: 0 / Default = Client, 1 = Host + RCON, 2 = Host Only
// argument1 = Command received by the host from RCON client
// argument2 = Command string
var rconPlayer, rconCommand, originalInput, rconCommand, execute;
rconPlayer = argument1;
originalInput = argument2;

// Check if command was sent via RCON
if (rconPlayer != -1)
{
    rconCommand = true;
}
else
{
    rconCommand = false;
}

switch(argument0)
{
// Host + RCON
case 1:
    // As client: Send command to host if client has RCON access
    if (global.isRCON and !global.isHost)
    {
        console_print(COL_PINK + "[RCON CMD] Sent: " + SINGLE_QUOTE + originalInput + SINGLE_QUOTE);
        
        // Send command to server
        write_ubyte(global.serverSocket, DSM_RCON_CMD);
        write_ubyte(global.serverSocket, string_length(originalInput));
        write_string(global.serverSocket, originalInput);
        socket_send(global.serverSocket);
        
        execute = false;
        break;
    }
    
    //As client: Reject command if not host or no RCON access
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host or RCON can use this command");
        execute = false;
        break;
    }
    
    // As host: Print commands sent via RCON + sender name
    if (rconCommand)
    {
        console_print(COL_PINK + "[RCON CMD: " + rconPlayer.name + "] " + originalInput);
    }
    
    execute = true;
    break;

// Host Only
case 2:
    // As host: Reject command if it came from RCON client
    if (rconCommand)
    {
        console_print(COL_PINK + "[RCON CMD: " + rconPlayer.name + "] Attempted to send a non-RCON enabled command: " + originalInput);
        execute = false;
        break;
    }
    
    // As client: Reject command if player is not the host
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command");
        execute = false;
        break;
    }
    
    execute = true;
    break;

//Client
default:
    // As host: Reject command if it came from RCON client
    if (rconCommand)
    {
        console_print(COL_PINK + "[RCON CMD: " + rconPlayer.name + "] Attempted to send a non-RCON enabled command: " + originalInput);
        execute = false;
        break;
    }
    
    execute = true;
    break;
}

return execute;
