AudioControlToggleMute(); // TODO: Remove, for testing

color_codes();
console_init();

ini_open("Re-DSM.ini");

ini_close();

ini_open("controls.gg2");
global.consoleKey = ini_read_real("Controls", "ConsoleKey", vk_f3);
ini_close();

global.consoleFont = font_add_sprite(ConsoleFontS, ord("!"), false, 0);
