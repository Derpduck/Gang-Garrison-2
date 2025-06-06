console_add_command('unbind', '
if (console_validate_args(1, arg[0], "unbind <key>") == false) exit;

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
        bind_remove(keyCode);
        console_print(COL_ORANGE + "Removed bind from key: " + COL_YELLOW + keyCode);
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
    bind_remove(keyCode);
    console_print(COL_ORANGE + "Removed bind from key: " + COL_YELLOW + keyCode);
}
else
{
    // Invalid key
    console_print(COL_RED + "[ERROR] Invalid key: " + COL_YELLOW + arg[1]);
}
', '
console_print(COL_ORANGE + "Syntax: unbind <key>");
console_print(COL_ORANGE + "Removes the bind assigned to the given key");
', console_init_access_level('unbind', CC_CLIENT));
