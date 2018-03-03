/**
 * Draws a healthbar for HealthHud and SentryHealthHud
 * Arguments: drawHealth(x,y,hp,maxHp)
 * x/y-Position is the top left of the drawn health bar
 */
var xoffset, yoffset, xsize, ysize, xpos, ypos, hp, maxHp;
xoffset = view_xview[0];
yoffset = view_yview[0];
xsize = view_wview[0];
ysize = view_hview[0];

xpos = argument0;
ypos = argument1;
hp = argument2;
maxHp = argument3;
hpText = string(ceil(min(max(hp,0),maxHp)))

draw_set_valign(fa_center)
draw_set_color(c_black)
draw_set_alpha(global.boxBgAlpha/100)

draw_rectangle(xoffset+xpos,yoffset+ypos,xoffset+xpos+67,yoffset+ypos+16,0)

draw_set_alpha(global.boxElementAlpha/100)
draw_set_color(make_color_rgb(50,200,50))
draw_set_halign(fa_right)

draw_text(xoffset+xpos+65,yoffset+ypos+9,hpText)
draw_healthbar(xoffset+xpos+4,yoffset+ypos+4,xoffset+xpos+38,yoffset+ypos+12,hp*100/maxHp,c_black,c_red,c_green,0,1,0)
