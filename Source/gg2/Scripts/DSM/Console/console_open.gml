instance_create(0, 0, Console)
global.consoleIsOpen = true
with InGameMenuController{
    menu_change_option(0, "Close Console", "console_close()")
}
