if (room == Menu) exit;

var commandName, commandAccessLevel, player;
commandName = argument0;
commandAccessLevel = argument1;

for (i=0; i<ds_list_size(global.rconUsers); i+=1)
{
    player = ds_list_find_value(global.rconUsers, i);
    
    // Feature not supported for clients below v6
    if (player.dsmClientVersion >= 6)
    {
        write_ubyte(player.socket, DSM_ACCESS_LEVELS);
        write_ubyte(player.socket, commandAccessLevel);
        write_ubyte(player.socket, string_length(commandName));
        write_string(player.socket, commandName);
    }
};
