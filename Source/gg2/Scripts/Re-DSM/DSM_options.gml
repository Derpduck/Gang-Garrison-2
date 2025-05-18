ini_open("Re-DSM.ini");
// Audio
global.soundVolume = ini_read_real("Audio", "Volume", 100);
ini_write_real("Audio", "Volume", global.soundVolume);
ini_close();

ini_open("controls.gg2");
ini_close();
