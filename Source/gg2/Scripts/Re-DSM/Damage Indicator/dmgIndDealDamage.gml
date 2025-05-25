// argument0 = Source player
// argument1 = Damage victim instance ID
// argument2 = Damage dealt
//show_message(string(argument2))
if (!global.damageIndicator and argument2 > 0) exit;

if (!global.damageIndicatorSelf and global.myself.object != -1)
{
    if (argument1 == global.myself.object)
        exit;
}

var indicator;
indicator = -1;

// Find existing damage indicator attached to victim
for (i=0; i<instance_number(DamageIndicator); i+=1)
{
    var instance;
    instance = instance_find(DamageIndicator, i);
    
    if (instance_exists(instance))
    {
        if (instance.victim == argument1)
            indicator = instance;
    }
};

// No indicator exists for the victim, create one
if (indicator == -1)
{
    indicator = instance_create(0, 0, DamageIndicator);
    indicator.victim = argument1;
}

// Set position of damage indicator
if (instance_exists(argument1))
{
    indicator.lastx = round(argument1.x);
    indicator.lasty = round(argument1.y);
}

// Add damage instance to indicator, append value if the timestamp exists
var damageMap, damage;
if (ds_map_exists(indicator.damageMap, current_time))
{
    ds_map_replace(indicator.damageMap, current_time, ds_map_find_value(indicator.damageMap, current_time) + argument2);
}
else
{
    ds_map_add(indicator.damageMap, current_time, argument2);
    ds_map_add(indicator.damageMapX, current_time, indicator.lastx);
    ds_map_add(indicator.damageMapY, current_time, indicator.lasty);
    
    playsound_volume(view_xview[0] + (view_wview[0] / 2),view_yview[0] + (view_hview[0] / 2), global.damageIndicatorSound, global.damageIndicatorVolume / 100);
}
