menu_addtablink("General", '
    instance_destroy();
    instance_create(x,y,DSMOptions_General);
');
menu_addtablink("HP & Ammo", '
    instance_destroy();
    instance_create(x,y,DSMOptions_HUD_HP_Ammo);
');
menu_addtablink("Player HUD", '
    instance_destroy();
    instance_create(x,y,DSMOptions_HUD_Player);
');
menu_addtablink("Game HUD", '
    instance_destroy();
    instance_create(x,y,DSMOptions_HUD_Game);
');
menu_addtablink("Indicator", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Indicator);
');
menu_addtablink("Team Colors", '
    instance_destroy();
    instance_create(x,y,DSMOptions_TeamColors);
');
menu_addtablink("Console", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Console);
');
menu_addtablink("Controls", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Controls);
');
if (room == DSMOptionsRoom or global.isHost)
{
    menu_addtablink("Hosting", '
        instance_destroy();
        instance_create(x,y,DSMOptions_Hosting);
    ');
    menu_addtablink("Host: DKoTH", '
        instance_destroy();
        instance_create(x,y,DSMOptions_DKoth);
    ');
}

menu_addback("Back", '
    instance_destroy();
    if(room == DSMOptionsRoom)
        room_goto_fix(Menu);
    else
        instance_create(0,0,InGameMenuController);
');
