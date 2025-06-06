console_add_command('disconnect', '
console_save_log();
if (global.serverPluginsInUse)
{
    pluginscleanup(true);
}
else
{
    global.dedicatedMode = 0;
    with(Client)
        instance_destroy();
        
    with(GameServer)
        instance_destroy();
}
', '
console_print(COL_ORANGE + "Syntax: disconnect");
console_print(COL_ORANGE + "Immediately leaves the server");
', console_init_access_level('disconnect', CC_CLIENT));
