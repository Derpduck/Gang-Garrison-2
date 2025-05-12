console_add_command('unban', '
if (console_validate_args(1, arg[0], "unban <player IP>") == false) exit;

var playerIP;
playerIP = arg[1];

if (unban_user(playerIP))
    console_print(COL_ORANGE + playerIP + " was unbanned");
else
    console_print(COL_ORANGE + playerIP + " is not banned");

ban_remove_from_file(playerIP);
', '
console_print(COL_ORANGE + "Syntax: unban <player IP>");
console_print(COL_ORANGE + "Unbans the given player" + SINGLE_QUOTE + "s IP from the server");
', CC_HOST);
