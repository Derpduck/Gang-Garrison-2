console_add_command('map', '
if (console_validate_args(1, arg[0], "map <map name>") == false) exit;

var mapName;
mapName = arg[1];

if (findInternalMapName(mapName) == "" and !file_exists("Maps/" + mapName + ".png"))
{
    console_print(COL_YELLOW + mapName + " could not be found");
}
else
{
    global.nextMap = mapName;
}
', '
console_print("Syntax: message <text>);
console_print("Sends all clients a notification bearing the message");
', CC_HOST_RCON);
