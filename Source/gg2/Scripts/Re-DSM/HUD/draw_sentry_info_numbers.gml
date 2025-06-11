var xr, yr;
xr = round(x);
yr = round(y);

draw_set_alpha(global.opacityHPAmmoText / 100);

// Health Text
if (global.healthTextSentry != 0 and (ownerPlayer == global.myself or global.healthTextSentry == 1))
{
    var xoffset, yoffset, textColor, healthText;
    
    switch(global.healthTextPosition)
    {
    case 1: // Below Health Bar
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -16;
        break;
    case 2: // Above Info Bars
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -37;
        break;
    case 3: // Left
        draw_set_halign(fa_right);
        xoffset = -12;
        yoffset = -28;
        break;
    case 4: // Right
        draw_set_halign(fa_left);
        xoffset = 12;
        yoffset = -28;
        break;
    case 5: // Below Character
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = 21;
        break;
    case 6: // Below Cursor
        draw_set_halign(fa_center);
        if (ownerPlayer == global.myself)
        {
            xoffset = mouse_x - xr;
            yoffset = mouse_y - yr + 20;
        }
        else
        {
            xoffset = 0;
            yoffset = -16;
        }
        break;
    }
    
    // Prevent player health text from overlapping sentry health text
    if (global.healthTextPosition == 6 and ownerPlayer == global.myself and global.healthText != 0 and (ownerPlayer == global.myself or global.healthText == 1))
        yoffset +=  13;
    
    // Prevent ammo text from overlapping sentry health text
    if (global.healthTextPosition == 6 and global.ammoTextPosition == 6 and global.ammoText != 0 and (ownerPlayer == global.myself or global.ammoText == 1))
            yoffset += 13;
    
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


draw_set_color(c_white);
draw_set_alpha(1);
