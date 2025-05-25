var serverIP, serverPort;
serverIP = argument0;
serverPort = argument1;

if (instance_exists(GameServer) and serverIP == "127.0.0.1")
{
    show_notification_message("You are already connected to this server.")
    return false;
}

if (instance_exists(Client))
{
    if (global.serverIP == serverIP and global.serverPort == serverPort)
    {
        show_notification_message("You are already connected to this server.")
        return false;
    }
}

global.isHost = false;
global.serverIP = serverIP;
global.serverPort = serverPort;

if (instance_exists(GameServer) and room != Menu and room != Lobby)
{
    //global.queuedJoin = true;
    
    global.dedicatedMode = 0;
    with(GameServer)
        instance_destroy();
    
    return true;
}

if (room == Lobby)
{
    if(instance_exists(Client))
    {   // We can't _actually_ destroy and recreate the Client here, because destroying it will cause a room change and that will cause the Create event not to run... Yay, GM!
        with(Client)
        {
            event_perform(ev_destroy,0);
            ClientCreate();
        }
    }
    else
    {
        instance_create(0,0,Client);
    }
    Client.returnRoom = Lobby;
}
else
{
    // Force dedicated mode to off so you can go to main menu instead of just restarting server
    if (show_question("Do you really want to leave this match?"))
    {
        if (global.serverPluginsInUse)
        {
            pluginscleanup(true);
            return false; // TODO: Update if plugins cleanup is changed to not force restarts
        }
        else
        {
            //global.queuedJoin = true;
            Client.returnRoom = Lobby;
            
            with(Client)
                instance_destroy();
        }
    }
}

Client.returnRoom = Lobby;
return true;
