global.menuFontDSM = font_add_sprite(ConsoleFontS, ord("!"), false, -2);

global.queuedJoin = false;

DSM_options();
create_DSM_folders();
color_codes();
console_init();
headless_mode();
load_custom_hitsound();
set_window_scale(global.windowScale);

sound_global_volume(global.masterVolume / 100);
window_set_showborder(!global.borderlessWindow);
window_set_showicons(!global.borderlessWindow);
window_set_sizeable(!global.disableWindowResizing);
