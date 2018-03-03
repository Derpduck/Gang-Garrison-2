var xoffset, yoffset, xsize, ysize, countdown, mode, outlineOffset;
xoffset = argument0;
yoffset = argument1;
xsize = argument2;
ysize = argument3;
countdown = argument4;
teamoffset = argument5;
mode = argument6; // 0: normal, large; 1: normal, small; 2: outlined, small

draw_set_halign(fa_center)
if mode==0{
    if global.smallTimer==0{
        draw_set_color(c_black)
        draw_set_alpha(global.boxBgAlpha/100)
        draw_rectangle((xoffset+xsize/2)-25,yoffset+15,(xoffset+xsize/2)+25,yoffset+40,0)
    }
    draw_set_alpha(global.boxElementAlpha/100)
    draw_set_color(make_color_rgb(50,200,50))
    
    if overtime{
        draw_text((xoffset+xsize/2),yoffset+28,"OVER#TIME")
    }else{
        //draw_set_font(global.timerFont)
        draw_set_font(global.gg2Font)
        
        if global.setupTimer>0 and instance_exists(ControlPointSetupGate){
            if global.smallTimer==0{
                draw_healthbar((xoffset+xsize/2)-20,yoffset+32,(xoffset+xsize/2)+20,yoffset+37,floor(global.setupTimer*100/1800),c_black,c_red,c_green,0,1,0)
            }
        
            var seconds,secstring;
            seconds=floor(global.setupTimer/30)
            if (seconds>=10){
                secstring=string(seconds)
            }else{
                secstring="0"+string(seconds)
            }
            draw_text_transformed((xoffset+xsize/2),yoffset+25,"0:"+secstring,1,1,0)
        }else{
            if global.smallTimer==0{
                draw_healthbar((xoffset+xsize/2)-20,yoffset+32,(xoffset+xsize/2)+20,yoffset+37,floor(countdown*100/timeLimit),c_black,c_red,c_green,0,1,0)
            }

            var time,minutes,secondcounter,seconds,secstring;
            minutes=floor(countdown/1800)
            secondcounter=countdown-minutes*1800
            seconds=floor(secondcounter/30)
            if (seconds>=10){
                secstring=string(seconds)
            }else{
                secstring="0"+string(seconds)
            }
            draw_text_transformed((xoffset+xsize/2),yoffset+25,string(minutes)+":"+secstring,1,1,0)
        }
    }
}else{
    if teamoffset==0{
        draw_set_color(make_color_rgb(84,0,0))
    }else{
        draw_set_color(make_color_rgb(0,0,84))
    }
    if global.smallTimer==0{
        draw_set_alpha(global.boxBgAlpha/100)
        draw_rectangle((xoffset+xsize/2)-25+xshift,yoffset+15,(xoffset+xsize/2)+25+xshift,yoffset+40,0)
        if mode == 2{
            draw_set_alpha(global.boxBgAlpha/100)
            draw_set_color(c_white)
            if teamoffset==0{
                outlineOffset=0
            }else{
                outlineOffset=1
            }
            draw_rectangle((xoffset+xsize/2)-27+xshift+outlineOffset,yoffset+13,(xoffset+xsize/2)+26+xshift+outlineOffset,yoffset+42,1)
            draw_rectangle((xoffset+xsize/2)-26+xshift+outlineOffset,yoffset+14,(xoffset+xsize/2)+25+xshift+outlineOffset,yoffset+41,1)
        }
    }
    draw_set_alpha(global.boxElementAlpha/100)
    draw_set_color(make_color_rgb(50,200,50))
    
    if (countdown<=0){
        draw_text(xoffset+xsize/2+xshift,yoffset+28,"OVER#TIME")
    }else{
        if global.smallTimer==0{
            draw_healthbar((xoffset+xsize/2)-20,yoffset+32,(xoffset+xsize/2)+20,yoffset+37,floor(countdown*100/900),c_black,c_red,c_green,0,1,0)
        }
        
        var time,minutes,secondcounter,seconds,secstring;
        minutes=floor(countdown/1800)
        secondcounter=countdown-minutes*1800
        seconds=floor(secondcounter/30)
        
        if (seconds>=10){
            secstring=string(seconds)
        }else{
            secstring="0"+string(seconds)
        }
        draw_text_transformed((xoffset+xsize/2),yoffset+25,string(minutes)+":"+secstring,1,1,0)
    }
    
}
