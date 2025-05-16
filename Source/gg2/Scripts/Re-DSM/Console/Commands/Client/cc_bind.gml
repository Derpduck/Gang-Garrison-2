console_add_command('bind', '
if (console_validate_args(2, arg[0], "bind <key> <command>") == false) exit;

var keyCode;
keyCode = arg[1];

// Check how to handle the key given
if (string_pos("vk_", keyCode) == 1)
{
    // Special key code
    keyCode = string_lower(keyCode);
    if (ds_map_exists(global.virtualKeysMap, keyCode))
    {
        // Valid key
        bind_add(keyCode, arg[2]);
        console_print(COL_ORANGE + "Bound key: " + COL_YELLOW + keyCode + COL_ORANGE + " to command: " + COL_YELLOW + arg[2]);
    }
    else
    {
        // Invalid key
        console_print(COL_RED + "[ERROR] Invalid key: " + COL_YELLOW + arg[1]);
    }
}
else if (string_length(keyCode) == 1 and ord(keyCode) != 0)
{
    // Single keyboard character
    keyCode = string_upper(keyCode);
    bind_add(keyCode, arg[2]);
    console_print(COL_ORANGE + "Bound key: " + COL_YELLOW + keyCode + COL_ORANGE + " to command: " + COL_YELLOW + arg[2]);
}
else
{
    // Invalid key
    console_print(COL_RED + "[ERROR] Invalid key: " + COL_YELLOW + arg[1]);
}
', '
console_print(COL_ORANGE + "Syntax: bind <key> <command>");
console_print(COL_ORANGE + "Binds the given console command to the key");
', CC_CLIENT);
