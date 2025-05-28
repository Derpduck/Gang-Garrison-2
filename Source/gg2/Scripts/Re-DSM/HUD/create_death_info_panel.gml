if (global.deathInfo == 0)
    exit;

// Create the panel
var deathInfo;
deathInfo = instance_create(0, 0, DeathInfo);
deathInfo.killer = argument0;
deathInfo.assistant = argument1;

// Get killer and assistant info
var killerName, killerClass, killerHP;
if (deathInfo.killer == noone)
{
    // Killer object doesn't exist
    killerName = "NOT FOUND";
    killerClass = "NOT FOUND";
    killerHP = "NOT FOUND";
}
else if (deathInfo.killer.object == -1)
{
    // Killer is dead
    killerName = deathInfo.killer.name;
    killerClass = deathInfo.killer.class;
    killerHP = "Dead";
}
else if (deathInfo.killer == global.myself)
{
    // Killed yourself
    killerName = deathInfo.killer.name + " (You)";
    killerClass = deathInfo.killer.class;
    killerHP = "Dead";
}
else
{
    // Get living killer info
    killerName = deathInfo.killer.name;
    killerClass = deathInfo.killer.class;
    killerHP = string(ceil(deathInfo.killer.object.hp));
}

var assistName, assistClass;
if (deathInfo.assistant == noone)
{
    // Assistant object doesn't exist
    assistName = "NOT FOUND";
    assistClass = "NOT FOUND";
}
else if (deathInfo.assistant.object == -1)
{
    // Assistant is dead
    assistName = deathInfo.assistant.name;
    assistClass = deathInfo.assistant.class;
}
else if (deathInfo.assistant == global.myself)
{
    // Assisted yourself
    assistName = deathInfo.assistant.name + " (You)";
    assistClass = deathInfo.assistant.class;
}
else
{
    // Get living assistant info
    assistName = deathInfo.assistant.name;
    assistClass = deathInfo.assistant.class;
}

if (deathInfo.killer != noone)
{
    deathInfo.messageKiller = ( "Killed By:#" + killerName
                              + "#(" + classname(killerClass) + ")#"
                              + "#HP Remaining:#" + killerHP);
}

if (deathInfo.assistant != noone)
{
    deathInfo.messageAssist = ( "##Assisted By:#" + assistName
                              + "#(" + classname(assistClass) + ")");
}

deathInfo.message = deathInfo.messageKiller + deathInfo.messageAssist;
