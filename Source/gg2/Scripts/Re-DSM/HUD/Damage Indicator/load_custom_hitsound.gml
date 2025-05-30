if (global.damageIndicatorCustomSound == "" or !file_exists(working_directory + "\DSM\Sounds\" + global.damageIndicatorCustomSound))
    global.damageIndicatorSound = HitsoundSnd;
else
    global.damageIndicatorSound = sound_add(working_directory + "\DSM\Sounds\" + global.damageIndicatorCustomSound, 0, true);
