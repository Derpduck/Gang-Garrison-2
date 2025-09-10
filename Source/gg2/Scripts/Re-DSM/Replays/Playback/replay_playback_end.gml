buffer_destroy(global.replayBuffer);

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
