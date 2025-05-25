global.menuFontDSM = font_add_sprite(ConsoleFontS, ord("!"), false, -2);

global.queuedJoin = false;

DSM_options();
create_DSM_folders();
color_codes();
console_init();
headless_mode();

sound_global_volume(global.masterVolume / 100);

if (global.damageIndicatorCustomSound == "" or !file_exists(working_directory + "\DSM\Sounds\" + global.damageIndicatorCustomSound))
    global.damageIndicatorSound = HitsoundSnd;
else
    global.damageIndicatorSound = sound_add(working_directory + "\DSM\Sounds\" + global.damageIndicatorCustomSound, 0, true);
