ini_open("Re-DSM.ini");
// Damage Indicator
global.damageIndicator = ini_read_real("Damage Indicator", "Show Damage Indicator", 1);
ini_write_real("Damage Indicator", "Show Damage Indicator", global.damageIndicator);

global.damageIndicatorSelf = ini_read_real("Damage Indicator", "Show Self Damage", 0);
ini_write_real("Damage Indicator", "Show Self Damage", global.damageIndicatorSelf);

global.damageIndicatorHealing = ini_read_real("Damage Indicator", "Show Healing Given", 1);
ini_write_real("Damage Indicator", "Show Healing Given", global.damageIndicatorHealing);

global.damageIndicatorColor = ini_read_real("Damage Indicator", "Damage Indicator Color", 1);
ini_write_real("Damage Indicator", "Damage Indicator Color", global.damageIndicatorColor);

global.damageIndicatorColorSelf = ini_read_real("Damage Indicator", "Self Damage Color", 2);
ini_write_real("Damage Indicator", "Self Damage Color", global.damageIndicatorColorSelf);

global.damageIndicatorColorHealing = ini_read_real("Damage Indicator", "Healing Color", 4);
ini_write_real("Damage Indicator", "Healing Color", global.damageIndicatorColorHealing);

global.damageIndicatorVolume = max(0, min(100, ini_read_real("Damage Indicator", "Volume", 100)));
ini_write_real("Damage Indicator", "Volume", global.damageIndicatorVolume);

global.damageIndicatorCustomSound = ini_read_string("Damage Indicator", "Custom Sound File", "");
ini_write_string("Damage Indicator", "Custom Sound File", global.damageIndicatorCustomSound);

global.damageIndicatorScale = ini_read_real("Damage Indicator", "Scale", 1);
ini_write_real("Damage Indicator", "Scale", global.damageIndicatorScale);

global.damageIndicatorHoldDuration = ini_read_real("Damage Indicator", "Hold Duration", 0.75);
ini_write_real("Damage Indicator", "Hold Duration", global.damageIndicatorHoldDuration);

global.damageIndicatorFadeDuration = ini_read_real("Damage Indicator", "Fade Duration", 1.5);
ini_write_real("Damage Indicator", "Fade Duration", global.damageIndicatorFadeDuration);

global.damageIndicatorShrink = ini_read_real("Damage Indicator", "Shrink on Fade", 1);
ini_write_real("Damage Indicator", "Shrink on Fade", global.damageIndicatorShrink);

global.damageIndicatorShadow = ini_read_real("Damage Indicator", "Drop Shadow", 1);
ini_write_real("Damage Indicator", "Drop Shadow", global.damageIndicatorShadow);

// Hosting
global.headlessMode = ini_read_real("Hosting", "Headless Mode (Launch Option Only)", 0);
ini_write_real("Hosting", "Headless Mode (Launch Option Only)", global.headlessMode);

// Audio
global.masterVolume = max(0, min(100, ini_read_real("Audio", "Master Volume", 100)));
ini_write_real("Audio", "Master Volume", global.masterVolume);
ini_close();

ini_open("controls.gg2");
ini_close();
