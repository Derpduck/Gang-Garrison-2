if (room == Menu)
{
    menu_addtablink("Start Game", '
        start_server();
    ');
}

// Standard Options Menus
if (room != Menu)
{
    menu_addtablink("Ingame", '
        instance_destroy();
        instance_create(x,y,OptionsController);
    ');
    menu_addtablink("Engine", '
        instance_destroy();
        instance_create(x,y,EngineOptionsController);
    ');
    menu_addtablink("Controls", '
        instance_destroy();
        instance_create(x,y,ControlsController);
    ');
    menu_addtablink("HUD", '
        instance_destroy();
        instance_create(x,y,HUDOptionsController);
    ');
}

// Host Options
if ((global.isHost and room != Menu) or room == Menu and room != Options)
{
    menu_addtablink("Server", '
        instance_destroy();
        instance_create(x,y,HostOptionsController);
    ');
    menu_addtablink("Classlimits", '
        instance_destroy();
        instance_create(x,y,ClasslimitsMenuController);
    ');
    menu_addtablink("Time Limits", '
        instance_destroy();
        instance_create(0,0,HostOptions_TimeLimits);
    ');
}

menu_addback("Back", '
    instance_destroy();
    if(room == Options)
        room_goto_fix(Menu);
    else if (room == Menu)
        instance_create(x,y,MainMenuController);
    else
        instance_create(0,0,InGameMenuController);
');
