with Console{
    instance_destroy()
}
global.consoleIsOpen = false
with InGameMenuController{
    menu_change_option(0, "Open Console", "console_open()")
}
