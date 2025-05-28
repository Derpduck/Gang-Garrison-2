if (global.deathInfo == 0)
    exit;

// Create the panel
var deathInfo;
deathInfo = instance_create(0, 0, DeathInfo);
deathInfo.killer = argument0;
deathInfo.assistant = argument1;
