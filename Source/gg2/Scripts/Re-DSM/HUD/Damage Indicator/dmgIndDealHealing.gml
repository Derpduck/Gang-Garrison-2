// argument0 = Source player
// argument1 = Healing target instance ID
// argument2 = Healing given
if (!global.damageIndicatorHealing or argument2 <= 0 or argument0 != global.myself) exit;

var indicator;
indicator = -1;

// Find existing damage indicator attached to victim
for (i=0; i<instance_number(DamageIndicator); i+=1)
{
    var instance;
    instance = instance_find(DamageIndicator, i);
    
    if (instance_exists(instance))
    {
        if (instance.victim == argument1 and instance.type == 1)
            indicator = instance;
    }
};

// No indicator exists for the victim, create one
if (indicator == -1)
{
    indicator = instance_create(0, 0, DamageIndicator);
    indicator.victim = argument1;
    indicator.type = 1;
    indicator.ybaseoffset = 40;
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
}

indicator.indicatorColor = get_color_option(global.damageIndicatorColorHealing);
