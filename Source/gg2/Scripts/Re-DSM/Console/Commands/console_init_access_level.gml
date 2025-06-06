// Reads / writes console command access levels to Re-DSM.ini
var commandName, defaultAccessLevel, accessLevel;
commandName = argument0;
defaultAccessLevel = argument1;

ini_open("Re-DSM.ini");
accessLevel = ini_read_real("Command Access Level", commandName, defaultAccessLevel);
ini_write_real("Command Access Level", commandName, accessLevel);
ini_close();

return accessLevel;
