global.menuFontDSM = font_add_sprite(ConsoleFontS, ord("!"), false, -2);

global.queuedJoin = false;

DSM_options();
create_DSM_folders();
color_codes();
console_init();
headless_mode();
load_custom_hitsound();

sound_global_volume(global.masterVolume / 100);
