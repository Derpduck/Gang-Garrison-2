// TODO: Add documentation
console_add_command('rcon', '
// Check for the correct number of arguments
if (arg[0] == 0)
{
    console_print(COL_RED + "[ERROR] Incorrect number of arguments, syntax: rcon <command> <argument>");
    exit;
}

if (arg[0] < 2)
{
    if (arg[1] != "toggle" and arg[1] != "save" and arg[1] != "users")
    {
        console_print(COL_RED + "[ERROR] Incorrect number of arguments, syntax: rcon <command> <argument>");
        exit;
    }
}


switch(arg[1])
{
case "login":
    if (global.isHost)
    {
        console_print(COL_RED + "[ERROR] The host cannot use command: rcon login");
        break;
    }
    
    if (global.isRCON)
    {
        // TODO: Remove check as it could cause issues if client desyncs, perform check at server side
        console_print(COL_RED + "[ERROR] You already have RCON access");
        break;
    }
    
    var password;
    password = arg[2];
    
    // Send the password to the server and attempt to login
    write_ubyte(global.serverSocket, DSM_RCON_LOGIN);
    write_ubyte(global.serverSocket, string_length(password));
    write_string(global.serverSocket, password);
    socket_send(global.serverSocket);
    break;

case "add":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon add");
        break;
    }
    
    //TODO: Add functionality
    break;

case "remove":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon remove");
        break;
    }
    
    //TODO: Add functionality
    break;

case "password":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon password");
        break;
    }
    
    global.rconPassword = string(arg[2]);
    console_print(COL_CYAN + "RCON password changed to: " + global.rconPassword);
    console_print(COL_CYAN + "New password saved to: " + chr(39) + "Re-DSM.ini" + chr(39));
    
    DSM_write_ini("RCON", "RconPassword", global.rconPassword);
    break;

case "toggle":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon toggle");
        break;
    }
    
    global.rconEnabled = !global.rconEnabled;
    
    if (global.rconEnabled)
        console_print(COL_CYAN + "RCON access enabled");
    else
        console_print(COL_CYAN + "RCON access disabled");
    break;

case "save":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon save");
        break;
    }
    
    global.saveRconUsers = !global.saveRconUsers;
    
    if (global.saveRconUsers)
        console_print(COL_CYAN + "New RCON users will now be saved to: " + chr(39) + "RCON_Users.txt" + chr(39));
    else
        console_print(COL_CYAN + "New RCON users will no longer be saved");
    break;

case "users":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon users");
        break;
    }
    
    // TODO: Print player ID
    // TODO: Validation check if player instance exists
    // TODO: Print player name in team colour
    // Print details for each currently active RCON user
    // ID  |  IP  |  Name
    var player, playerIP;
    for (i=0; i<ds_list_size(global.rconUsers); i+=1)
    {
        player = ds_list_find_value(global.rconUsers, i);
        playerIP = socket_remote_ip(player.socket);
        
        console_print(COL_CYAN + string(playerIP) + "  |  " + player.name);
    };
    
    
    break;

default:
    console_print(COL_RED + "[ERROR] Invalid RCON command: " + arg[1]);
    break;
}
', '', 0);
