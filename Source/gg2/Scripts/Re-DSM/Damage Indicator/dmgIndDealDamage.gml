// argument0 = Source player
// argument1 = Damage victim instance ID
// argument2 = Damage dealt
//show_message(string(argument2))
if (!global.damageIndicator) exit;

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

// Add damage instance to indicator
var damageMap, damage;
ds_map_add(indicator.damageMap, current_time, argument2);

// Set position of damage indicator
if (instance_exists(argument1))
{
    indicator.lastx = round(argument1.x);
    indicator.lasty = round(argument1.y);
}

playsound(view_xview[0] + (view_wview[0] / 2),view_yview[0] + (view_hview[0] / 2), global.damageIndicatorSound);
