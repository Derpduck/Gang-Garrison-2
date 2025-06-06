console_add_command('rotation', '
if (console_validate_args(1, arg[0], "rotation <new rotation> <optional: shuffle>") == false) exit;

var shuffle;
shuffle = false;

// Check if shuffle was requested
if (console_validate_args(2, arg[0], "rotation <new rotation> <optional: shuffle>", true) == true)
    if (string_lower(arg[2]) == "true" or arg[2] == "1" or string_lower(arg[2]) == "shuffle")
        shuffle = true;

if (swap_map_rotation(arg[1], shuffle))
{
    console_print(COL_ORANGE + "Map rotation: " + COL_YELLOW + arg[1] + COL_ORANGE + " loaded successfully");
    if (shuffle)
        console_print(COL_ORANGE + "Map rotation was shuffled");
}
else
{
    console_print(COL_RED + "[ERROR] Rotation: " + COL_YELLOW + arg[1] + COL_RED + " could not be found");
}
', '
console_print(COL_ORANGE + "Syntax: rotation <new rotation> <optional: shuffle>");
console_print(COL_ORANGE + "Changes the current map rotation to the given rotation file");
console_print(COL_ORANGE + "Specify true for <shuffle> to shuffle the rotation");
', console_init_access_level('rotation', CC_HOST));
