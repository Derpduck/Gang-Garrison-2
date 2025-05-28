var xr, yr;
xr = round(x);
yr = round(y);

// Health Text
if (global.healthText != 0 and (player == global.myself or global.healthText == 1))
{
    var xoffset, yoffset, textColor;
    
    switch(global.healthTextPosition)
    {
    case 1: // Below Health Bar
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -20;
        break;
    case 2: // Above Name
        draw_set_halign(fa_center);
        xoffset = 0;
        yoffset = -53;
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
        xoffset = mouse_x - xr;
        yoffset = mouse_y - yr + 20;
        break;
    }
    
    draw_set_valign(fa_middle);
    textColor = get_color_option(global.healthTextColor);
    
    if (global.healthTextShadow)
    {
        // Drop Shadow
        if (textColor == c_black)
            draw_set_color(c_white);
        else
            draw_set_color(c_black);
        
        draw_text(xr + xoffset + 1, yr + yoffset + 1, ceil(hp));
    }
    
    draw_set_color(textColor);
    draw_text(xr + xoffset, yr + yoffset, ceil(hp));
}

// Ammo Numbers


draw_set_color(c_white);
