console_add_command('hurt', '
if (console_validate_args(2, arg[0], "hurt <player> <damage>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1]);
    break;
}
else
{
    // Check if damage number given is actually a number
    if (!string_is_real(arg[2]))
    {
        console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[2] + COL_RED + " is not a valid number");
        break;
    }
    
    var damage;
    damage = real(arg[2]);
    
    if (player.object != -1)
    {
        player.object.hp -= damage;
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was dealt: " + COL_YELLOW + arg[2] + COL_ORANGE + " damage");
    }
    else
    {
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " is not alive");
    }
}
', '
console_print(COL_ORANGE + "Syntax: hurt <player> <damage>");
console_print(COL_ORANGE + "Deals damage to the given player");
', console_init_access_level('hurt', CC_HOST_RCON));
