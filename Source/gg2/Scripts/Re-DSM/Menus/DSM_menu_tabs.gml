menu_addtablink("General", '
    instance_destroy();
    instance_create(x,y,DSMOptions);
');
menu_addtablink("HUD", '
    instance_destroy();
    instance_create(x,y,DSMOptions_HUD);
');
menu_addtablink("Indicator", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Indicator);
');
menu_addtablink("Team Colors", '
    instance_destroy();
    instance_create(x,y,DSMOptions_TeamColors);
');
menu_addtablink("Hosting", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Hosting);
');
menu_addtablink("Console", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Console);
');
menu_addtablink("Controls", '
    instance_destroy();
    instance_create(x,y,DSMOptions_Controls);
');

menu_addback("Back", '
    instance_destroy();
    if(room == DSMOptionsRoom)
        room_goto_fix(Menu);
    else
        instance_create(0,0,InGameMenuController);
');
