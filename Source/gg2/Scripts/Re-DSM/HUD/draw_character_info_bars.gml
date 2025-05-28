var barCount, xr, yr, ybaseoffset, barHeight, barColor;
barCount = 0;
xr = argument0;
yr = argument1;
ybaseoffset = 25;
barHeight = 5;

draw_set_alpha(1);
//draw_set_color(c_white);

// Health Bar
if (player != global.myself or global.showHealthBar)
{
    barColor = c_green;
    draw_healthbar(xr - 10, yr - (ybaseoffset + (barCount * barHeight)) - barHeight,
                   xr + 10, yr - (ybaseoffset + (barCount * barHeight)),
                   ceil((hp / maxHp) * 100), c_black, c_red, barColor, 0, true, true);
    
    // Afterburn Bar
    if (global.afterburnBar)
    {
        var afterburn;
        afterburn = get_remaining_afterburn();
        
        if (afterburn > 0)
        {
            barColor = c_red;
            
            var barWidth, currentHpWidth, afterburnWidth;
            barWidth = 18;
            currentHpWidth = (hp / maxHp) * barWidth;
            afterburnWidth = min(currentHpWidth, (afterburn / maxHp) * barWidth);
            
            draw_rectangle_color(xr - 9 + (currentHpWidth - afterburnWidth),
                                 yr - (ybaseoffset + (barCount * barHeight)) - (barHeight / 2),
                                 xr - 9 + currentHpWidth,
                                 yr - (ybaseoffset + (barCount * barHeight)) - 1, barColor, barColor, barColor, barColor, false);
        }
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

//draw_set_color(c_white);
return barCount;
