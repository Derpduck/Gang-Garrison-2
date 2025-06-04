var serverIP, serverPort;
serverIP = argument0;
serverPort = argument1;

// Don't allow
if (instance_exists(GameServer) and serverIP == "127.0.0.1")
{
    show_notification_message("You are currently hosting this server,#you cannot reconnect without closing the server.")
    exit;
}
/*else if (instance_exists(Client))
{
    if (global.serverIP == serverIP and global.serverPort == serverPort)
        if (!show_question("You are already connected to this server,#are you sure you wish to reconnect?."))
            exit;
}*/


global.isHost = false;
global.serverIP = serverIP;
global.serverPort = serverPort;
// Joining from Lobby room / not in a game
if (room == Lobby or room == Menu)
{
    global.isHost = false;
    global.serverIP = serverIP;
    global.serverPort = serverPort;
    global.queuedJoin = false;
    
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
        instance_create(0, 0, Client);
    }
    Client.returnRoom = Lobby;
}
else
{
    // Joining while in-game
    if (ask_to_leaver_server())
    {
        global.isHost = false;
        global.serverIP = serverIP;
        global.serverPort = serverPort;
        global.queuedJoin = true;
        
        // If currently hosting a game
        if (instance_exists(GameServer) and room != Menu and room != Lobby)
        {
            // Force dedicated mode to off so you can go to main menu instead of just restarting server
            global.dedicatedMode = 0;
            
            with(GameServer)
                instance_destroy();
        }
        else
        {
            Client.returnRoom = Lobby;
            
            with(Client)
                instance_destroy();
        }
    }
}
