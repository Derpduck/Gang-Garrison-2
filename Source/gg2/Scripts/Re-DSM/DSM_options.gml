ini_open("Re-DSM.ini");
// Hosting
global.headlessMode = ini_read_real("Hosting", "Headless Mode (Launch Option Only)", 0);
ini_write_real("Hosting", "Headless Mode (Launch Option Only)", global.headlessMode);

// Audio
global.masterVolume = min(100, ini_read_real("Audio", "Master Volume", 100));
ini_write_real("Audio", "Master Volume", global.masterVolume);
ini_close();

ini_open("controls.gg2");
ini_close();


headless_mode();
