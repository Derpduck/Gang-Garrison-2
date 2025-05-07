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
', '', CC_CLIENT);
