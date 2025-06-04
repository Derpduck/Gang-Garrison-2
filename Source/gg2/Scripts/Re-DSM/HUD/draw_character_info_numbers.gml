var xr, yr, barCount;
xr = round(x);
yr = round(y);
barCount = argument0;

// Health Text
if (global.healthText != 0 and (player == global.myself or global.healthText == 1))
{
    var xoffset, yoffset, textColor, healthText;
    
    switch(global.healthTextPosition)
    {
    case 1: // Below Health Bar
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -20;
        break;
    case 2: // Above Info Bars
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -32 - (barCount * 5);
        break;
    case 3: // Left
        draw_set_halign(fa_right);
        xoffset = -12;
        yoffset = -30;
        break;
    case 4: // Right
        draw_set_halign(fa_left);
        xoffset = 12;
        yoffset = -30;
        break;
    case 5: // Below Character
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = 32;
        break;
    case 6: // Below Cursor
        draw_set_halign(fa_center);
        if (player == global.myself)
        {
            xoffset = mouse_x - xr;
            yoffset = mouse_y - yr + 20;
        }
        else
        {
            xoffset = 0;
            yoffset = -20;
        }
        break;
    }
    
    draw_set_valign(fa_middle);
    healthText = ceil(hp);
    
    if (hp > maxHp / 2)
        textColor = get_color_option(global.healthTextColor);
    else
        textColor = get_color_option(global.healthTextLowColor);
    
    if (global.healthTextShadow)
    {
        // Drop Shadow
        if (textColor == c_black)
            draw_set_color(c_white);
        else
            draw_set_color(c_black);
        
        draw_text(xr + xoffset + 1, yr + yoffset + 1, healthText);
    }
    
    draw_set_color(textColor);
    draw_text(xr + xoffset, yr + yoffset, healthText);
}

// Ammo Numbers
if (global.ammoText != 0 and (player == global.myself or global.ammoText == 1) and player.class != CLASS_SNIPER)
{
    var xoffset, yoffset, textColor, ammoText;
    
    switch(global.ammoTextPosition)
    {
    case 1: // Below Health Bar
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -20;
        break;
    case 2: // Above Info Bars
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -32 - (barCount * 5);
        break;
    case 3: // Left
        draw_set_halign(fa_right);
        xoffset = -12;
        yoffset = -30;
        break;
    case 4: // Right
        draw_set_halign(fa_left);
        xoffset = 12;
        yoffset = -30;
        break;
    case 5: // Below Character
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = 32;
        break;
    case 6: // Below Cursor
        draw_set_halign(fa_center);
        if (player == global.myself)
        {
            xoffset = mouse_x - xr;
            yoffset = mouse_y - yr + 20;
        }
        else
        {
            xoffset = 0;
            yoffset = -20;
        }
        break;
    }
    
    // Prevent ammo text from overlapping health text
    if (global.healthTextPosition == global.ammoTextPosition and global.healthText != 0 and (player == global.myself or global.healthText == 1))
    {
        if (global.ammoTextPosition == 2)
            yoffset -= 13;
        else
            yoffset += 13;
    }
    
    draw_set_valign(fa_middle);
    if (player.class == CLASS_HEAVY)
        ammoText = floor(currentWeapon.ammoCount / 3);
    else
        ammoText = floor(currentWeapon.ammoCount)
    
    if (currentWeapon.ammoCount > currentWeapon.maxAmmo / 2)
        textColor = get_color_option(global.ammoTextColor);
    else if (currentWeapon.ammoCount > 0)
        textColor = get_color_option(global.ammoTextLowColor);
    else
        textColor = c_red;
    
    if (global.ammoTextShadow)
    {
        // Drop Shadow
        if (textColor == c_black)
            draw_set_color(c_white);
        else
            draw_set_color(c_black);
        
        draw_text(xr + xoffset + 1, yr + yoffset + 1, max(0, ammoText));
    }
    
    draw_set_color(textColor);
    draw_text(xr + xoffset, yr + yoffset, max(0, ammoText));
}


draw_set_color(c_white);
