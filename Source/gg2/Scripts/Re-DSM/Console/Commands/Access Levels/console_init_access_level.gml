// Reads / writes console command access levels to Re-DSM.ini
var commandName, defaultAccessLevel, accessLevel;
commandName = argument0;
defaultAccessLevel = argument1;

ds_map_add(global.consoleCommandMapRulesDefault, commandName, defaultAccessLevel);

// Don't allow changing commands to / from client only
if (defaultAccessLevel == CC_CLIENT)
    return CC_CLIENT;

ini_open("Re-DSM.ini");
accessLevel = ini_read_real("Command Access Level", commandName, defaultAccessLevel);
ini_write_real("Command Access Level", commandName, accessLevel);
ini_close();

return accessLevel;
