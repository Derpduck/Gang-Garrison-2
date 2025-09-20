// Global "parameters":
// global.totalControlPoints
// global.cp[]

var cpUnlock, xoffset, yoffset, xsize, ysize, drawx, drawy;

cpUnlock = argument0;

xoffset = view_xview[0];
yoffset = view_yview[0];
xsize = view_wview[0];
ysize = view_hview[0];

drawx = xoffset+xsize/2 - (global.totalControlPoints - 1)/2*60;
drawy = yoffset + ysize - 40;

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(global.opacityGamemodeForeground / 100);

for (i=1; i<= global.totalControlPoints; i+=1)
{
    var teamoffset;
    if (global.cp[i].team == TEAM_RED)
        teamoffset = 60;
    else if (global.cp[i].team == TEAM_BLUE)
        teamoffset = 90;
    if (global.cp[i].cappingTeam == TEAM_RED and global.cp[i].team == -1)
        teamoffset = 30;
    else if (global.cp[i].cappingTeam != TEAM_RED and global.cp[i].team == -1)
        teamoffset = 0;

    if (global.cp[i].capping != 0)
    {
        draw_sprite_ext(ControlPointStatusS, teamoffset+floor(global.cp[i].capping/global.cp[i].capTime*30), drawx, drawy, 3, 3, 0, c_white, global.opacityGamemodeBackground / 100);
        
        // Capture %
        if (global.cpCapturePercent)
        {
            draw_set_color(c_black);
            draw_text(drawx + 1, drawy + 16, string(floor(global.cp[i].capping / global.cp[i].capTime * 100)) + "%");
        }
        // Capture Time
        if (global.cpCaptureTime)
        {
            draw_set_color(c_black);
            var timeRemaining, cappers;
            timeRemaining = (global.cp[i].capTime - global.cp[i].capping) / 30;
            draw_text(drawx + 1, drawy - 15, string_format(timeRemaining / max(1, global.cp[i].cappers), 2, 1) + "s");
        }
    }
    else if (global.cp[i].capping == 0)
        draw_sprite_ext(ControlPointStatusS, teamoffset, drawx, drawy, 3, 3, 0, c_white, global.opacityGamemodeBackground / 100);
    
    if (global.cp[i].locked)
    {
        if (cpUnlock >= 150 or cpUnlock == 0)
        {
            if (global.cpShowUnlockTimer and cpUnlock > 0)
            {
                draw_sprite_ext(ControlPointLockS, 0, drawx, drawy - 10, 2, 2, 0, c_white, global.opacityGamemodeForeground / 100);
                draw_set_color(c_white);
                draw_text_transformed(drawx+1, drawy + 13, ceil(cpUnlock/30), 2, 2, 0);
            }
            else
                draw_sprite_ext(ControlPointLockS, 0, drawx, drawy, 3, 3, 0, c_white, global.opacityGamemodeForeground / 100);
        }
        else if (cpUnlock > 0)
        {
            draw_set_color(c_white);
            draw_text_transformed(drawx+2, drawy + 2, ceil(cpUnlock/30), 3, 3, 0);
        }
    }
    else if (global.cp[i].cappers > 0 and not global.cp[i].locked)
    {
        draw_sprite_ext(ControlPointCappersS, 0, drawx, drawy, 3, 3, 0, c_white, global.opacityGamemodeForeground / 100);
        draw_set_color(c_black);
        draw_text_transformed(drawx+13, drawy + 2, string(global.cp[i].cappers), 1.5, 1.5, 0);
    }
    drawx += 60;
}
