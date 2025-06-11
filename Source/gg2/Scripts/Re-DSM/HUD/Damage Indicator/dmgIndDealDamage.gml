// argument0 = Source player
// argument1 = Damage victim instance ID
// argument2 = Damage dealt
var sourcePlayer, damageVictim, damageDealt, indicatorType, selfDamage;
sourcePlayer = argument0;
damageVictim = argument1;
damageDealt = argument2;
indicatorType = 0;
selfDamage = false;

// Damage indicator disabled or no damage dealt
if (!global.damageIndicator or damageDealt <= 0)
    exit;

// If damage dealer was not yourself or your heal target
if (sourcePlayer != global.myself)
{
    if (global.damageIndicatorHealingTarget and sourcePlayer.object != -1)
    {
        if (sourcePlayer.object.healer != global.myself)
            exit;
        else
            indicatorType = 2;
    }
    else
        exit;
}

if (damageVictim.object_index == Character or object_is_ancestor(damageVictim.object_index, Character)) 
{
    if (damageVictim.player == global.myself)
        selfDamage = true;
}

// Don't show self damage unless enabled
if (!global.damageIndicatorSelf and selfDamage)
{
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
        if (instance.victim == damageVictim and instance.type == indicatorType)
            indicator = instance;
    }
};

// No indicator exists for the victim, create one
if (indicator == -1)
{
    indicator = instance_create(0, 0, DamageIndicator);
    indicator.victim = damageVictim;
    indicator.type = indicatorType;
}

// Set position of damage indicator
if (instance_exists(damageVictim))
{
    indicator.lastx = round(damageVictim.x);
    indicator.lasty = round(damageVictim.y);
}

// Add damage instance to indicator, append value if the timestamp exists
var damageMap, damage;
if (ds_map_exists(indicator.damageMap, current_time))
{
    ds_map_replace(indicator.damageMap, current_time, ds_map_find_value(indicator.damageMap, current_time) + damageDealt);
}
else
{
    ds_map_add(indicator.damageMap, current_time, damageDealt);
    ds_map_add(indicator.damageMapX, current_time, indicator.lastx);
    ds_map_add(indicator.damageMapY, current_time, indicator.lasty);
    
    if (indicator.lastDingTime <= 0 and !selfDamage)
    {
        playsound_volume(view_xview[0] + (view_wview[0] / 2),view_yview[0] + (view_hview[0] / 2), global.damageIndicatorSound, global.damageIndicatorVolume / 100);
        indicator.lastDingTime = 5;
    }
}

if (!selfDamage)
    indicator.indicatorColor = get_color_option(global.damageIndicatorColor);
else
    indicator.indicatorColor = get_color_option(global.damageIndicatorColorSelf);
