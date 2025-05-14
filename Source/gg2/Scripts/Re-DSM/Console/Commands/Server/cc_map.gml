// TODO: Fix using map command to add current map as the next map not working
console_add_command('map', '
if (console_validate_args(1, arg[0], "map <map name>") == false) exit;

var mapName;
mapName = arg[1];

if (findInternalMapName(mapName) == "" and !file_exists("Maps/" + mapName + ".png"))
{
    console_print(COL_RED + "[ERROR] Map: " + COL_YELLOW + mapName + COL_ORANGE + " could not be found");
}
else
{
    global.nextMap = mapName;
    global.consoleMapChangeQueued = true;
    console_print(COL_ORANGE + "Next map set to: " + COL_YELLOW + mapName);
}
', '
console_print(COL_ORANGE + "Syntax: map <map name>");
console_print(COL_ORANGE + "Sets the next map to the given map");
', CC_HOST_RCON);
