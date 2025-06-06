menu_addtablink("Commands", '
    instance_destroy();
    instance_create(x,y,ServerMgt_Commands);
');

menu_addback("Back", '
    instance_destroy();
    if(room == Menu)
        instance_create(0,0,MainMenuController);
    else
        instance_create(0,0,InGameMenuController);
');
