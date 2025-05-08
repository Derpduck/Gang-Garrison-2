// TODO: Add documentation
console_add_command('rcon', '
if (console_validate_args(1, arg[0], "rcon <command> <optional: argument>") == false) exit;

// Check for the correct number of arguments on specific commands
if (string_lower(arg[1]) != "toggle" and string_lower(arg[1]) != "save" and string_lower(arg[1]) != "users")
{
    if (console_validate_args(2, arg[0], "rcon " + arg[1] + " <argument>") == false) exit;
}

switch(string_lower(arg[1]))
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
    
    var player;
    player = console_get_player(arg[2]);
    if (player == -1)
    {
        console_print(COL_RED + "[ERROR] Invalid player: " + arg[2]);
        break;
    }
    
    rcon_user_add(player);
    rcon_write_to_file(player);
    console_print(COL_PINK + "[RCON LOGIN] " + player.name + " was given RCON access");
    break;

case "remove":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon remove");
        break;
    }
    
    var player;
    player = console_get_player(arg[2]);
    if (player == -1)
    {
        console_print(COL_RED + "[ERROR] Invalid player: " + arg[2]);
        break;
    }
    
    rcon_user_remove(player);
    rcon_remove_from_file(player);
    console_print(COL_PINK + "[RCON LOGIN] " + player.name + SINGLE_QUOTE + "s RCON access was revoked");
    break;

case "password":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon password");
        break;
    }
    
    global.rconPassword = string(arg[2]);
    console_print(COL_ORANGE + "RCON password changed to: " + global.rconPassword);
    console_print(COL_ORANGE + "New password saved to: " + SINGLE_QUOTE + "Re-DSM.ini" + SINGLE_QUOTE);
    
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
        console_print(COL_ORANGE + "RCON access enabled");
    else
        console_print(COL_ORANGE + "RCON access disabled");
    break;

case "save":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon save");
        break;
    }
    
    global.saveRconUsers = !global.saveRconUsers;
    
    if (global.saveRconUsers)
        console_print(COL_ORANGE + "New RCON users will now be saved to: " + SINGLE_QUOTE + "RCON_Users.txt" + SINGLE_QUOTE);
    else
        console_print(COL_ORANGE + "New RCON users will no longer be saved");
    break;

case "users":
    if (!global.isHost)
    {
        console_print(COL_RED + "[ERROR] Only the host can use this command: rcon users");
        break;
    }
    
    // ID | IP | Name
    console_print(COL_ORANGE + string(ds_list_size(global.rconUsers)) + " rcon user(s) currently active")
    for (i=0; i<ds_list_size(global.rconUsers); i+=1)
    {
        var player, playerID, playerIP, idSpaces, ipSpaces;
        player = ds_list_find_value(global.rconUsers, i);
        
        if (instance_exists(player))
        {
            playerID = string(ds_list_find_index(global.players, player));
            idSpaces = string_repeat(" ", 2 - string_length(playerID));
            playerIP = string(socket_remote_ip(player.socket));
            ipSpaces = string_repeat(" ", 15 - string_length(playerIP));
            
            console_print(COL_ORANGE + "ID: " + COL_WHITE + playerID + idSpaces + COL_ORANGE + " | " + COL_WHITE + playerIP + ipSpaces + COL_ORANGE + " | " + get_team_color_code(player) + player.name);
        }
    };
    break;

default:
    console_print(COL_RED + "[ERROR] Invalid RCON command: " + arg[1]);
    break;
}
', '', CC_CLIENT);
