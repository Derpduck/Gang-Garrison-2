console_addCommand("disconnect", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

with ReadyUpController{
    event_user(0)
}
// Force dedicated mode to off so you can go to main menu instead of just restarting server
if (global.serverPluginsInUse){
    pluginscleanup(true);
}else{
    global.dedicatedMode = 0;
    with(Client){
        instance_destroy();
    }
    
    with(GameServer){
        instance_destroy();
    }
}
", "
console_print('Syntax: disconnect')
console_print('Disconnects from the server.')
")
