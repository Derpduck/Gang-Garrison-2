var xr, yr, barCount, ybaseoffset, barHeight;
xr = argument0;
yr = argument1;
barCount = 0;
ybaseoffset = 25;
barHeight = 5;

draw_set_alpha(1);
var barColor;

// Health Bar
if (player != global.myself or global.showHealthBar)
{
    barColor = c_green;
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil((hp / maxHp) * 100), c_black, c_red, barColor, 0, true, true);
    
    // Afterburn Bar
    var afterburn;
    afterburn = min(maxHp, get_remaining_afterburn());
    if (afterburn > 0)
    {
        barColor = c_orange;
        
        // Make bar start where end of current health is
        draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil((afterburn / maxHp) * 100), c_black, c_orange, c_orange, 0, true, true);
    }
    
    barCount += 1;
}

// Ammo Bar
if (global.ammoBar != 0 and (player == global.myself or global.ammoBar == 1))
{
    var ammoCount;
    barColor = c_white;
    
    if (player.class == CLASS_SNIPER)
    {
        if (currentWeapon.readyToShoot)
        {
            barColor = c_white;
            ammoCount = (currentWeapon.readyToShoot) * 100;
        }
        else
        {
            barColor = c_gray;
            ammoCount = (currentWeapon.readyToShoot) * 100;
            ammoCount = ((currentWeapon.lastReloadTime - currentWeapon.alarm[0]) / currentWeapon.lastReloadTime) * 100;
        }
    }
    else
    {
        ammoCount = (currentWeapon.ammoCount / currentWeapon.maxAmmo) * 100;
    }
    
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil(ammoCount), c_black, c_gray, barColor, 0, true, true);
    
    barCount += 1;
}

// Class Specific
// Uber
if (global.uberBar != 0 and (player == global.myself or global.uberBar == 1) and weapons[0] == Medigun)
{
    if (currentWeapon.uberReady or currentWeapon.ubering)
        barColor = c_blue;
    else
        barColor = c_aqua;
    
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil((currentWeapon.uberCharge / 2000) * 100), c_black, c_teal, barColor, 0, true, true);
    
    barCount += 1;
}

// Nuts 'N' Bolts
if (global.nutsBar != 0 and (player == global.myself or global.nutsBar == 1) and weapons[0] == Shotgun)
{
    if (nutsNBolts == maxNutsNBolts)
        barColor = c_yellow;
    else
        barColor = c_gray;
    
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil((nutsNBolts / maxNutsNBolts) * 100), c_black, c_gray, barColor, 0, true, true);
    
    barCount += 1;
}

// Sandwich
if (global.sandwichBar != 0 and (player == global.myself or global.sandwichBar == 1) and weapons[0] == Minigun)
{
    var cooldown;
    if (canEat)
    {
        barColor = c_yellow;
        cooldown = 100;
    }
    else if (omnomnomnom)
    {
        barColor = c_yellow;
        cooldown = (1 - (omnomnomnomindex / omnomnomnomend)) * 100
    }
    else
    {
        barColor = c_gray;
        cooldown = ((eatCooldown - (alarm[6] * global.delta_factor)) / eatCooldown) * 100
    }
    
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil(cooldown), c_black, c_gray, barColor, 0, true, true);
    
    barCount += 1;
}

return barCount;


// Health Numbers

// Ammo Numbers

/*
if (((team == global.myself.team or (global.myself.class=CLASS_SPY and point_distance(x,y,global.myself.object.x,global.myself.object.y)<=150)) and (player != global.myself or global.showHealthBar) or global.myself.team==TEAM_SPECTATOR)){
    var xr, yr;
    xr = round(x)
    yr = round(y)
    //0=no text
    if global.hpTextPos==1{
        //centre, top
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text_color(xr+1,yr-19,ceil(hp),c_black,c_black,c_black,c_black,1)
        draw_text_color(xr,yr-20,ceil(hp),c_white,c_white,c_white,c_white,1)
    }else if global.hpTextPos==2{
        //left side
        draw_set_halign(fa_right)
        draw_set_valign(fa_middle)
        draw_text_color(xr-10,yr-29,ceil(hp),c_black,c_black,c_black,c_black,1)
        draw_text_color(xr-11,yr-30,ceil(hp),c_white,c_white,c_white,c_white,1)
    }else if global.hpTextPos==3{
        //right side
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        draw_text_color(xr+11,yr-29,ceil(hp),c_black,c_black,c_black,c_black,1)
        draw_text_color(xr+12,yr-30,ceil(hp),c_white,c_white,c_white,c_white,1)
    }else if global.hpTextPos==4{
        //centre, bottom
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text_color(xr+1,yr+34,ceil(hp),c_black,c_black,c_black,c_black,1)
        draw_text_color(xr,yr+35,ceil(hp),c_white,c_white,c_white,c_white,1)
    }
}
