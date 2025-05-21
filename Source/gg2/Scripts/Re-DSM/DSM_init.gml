//AudioControlToggleMute(); // TODO: Remove, for testing

global.menuFontDSM = font_add_sprite(ConsoleFontS, ord("!"), false, -2);

DSM_options();
create_DSM_folders();
color_codes();
console_init();

sound_global_volume(global.soundVolume / 100);
