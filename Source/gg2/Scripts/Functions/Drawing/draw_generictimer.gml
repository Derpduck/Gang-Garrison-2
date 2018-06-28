var xoffset, yoffset, xsize, ysize, countdown, mode;
xoffset = argument0;
yoffset = argument1;
xsize = argument2;
ysize = argument3;
countdown = argument4;
teamoffset = argument5;
mode = argument6; // 0: normal, large
//1: normal, small
//2: outlined, small

if (mode == 0){
    if (overtime){
        draw_set_halign(fa_center);
        if instance_exists(CTFHUD){
            if global.smallTimer==0{
                draw_sprite_ext(TimerHudS,3+teamoffset,xoffset+xsize/2,yoffset+30,3,3,0,c_white,1);
            }
        }else{
            if global.smallTimer==0{
            draw_sprite_ext(TimerHudS,3+teamoffset,xoffset+xsize/2,yoffset+30,3,3,0,c_white,1);
            }
        }
        draw_text((xoffset+xsize/2)+xshift,yoffset+30+yshift,"OVERTIME");
    }else{
        if global.smallTimer==0{
            draw_sprite_ext(TimerHudS,teamoffset,xoffset+xsize/2,yoffset+30,3,3,0,c_white,1);
        }
        draw_set_halign(fa_right);
        if global.smallTimer==0{
            draw_set_font(global.timerFont);
        }else{
            draw_set_font(global.gg2Font)
        }
        
        if(global.setupTimer > 0 and instance_exists(ControlPointSetupGate)){
            if global.smallTimer==0{
                draw_sprite_ext(TimerS,floor(global.setupTimer/1800*12),xoffset+xsize/2+39,yoffset+30,3,3,0,c_white,1);
            }
            var seconds, secstring;
            seconds = ceil(global.setupTimer/30);
            if (seconds >= 10){
                secstring = string(seconds);
            }else{
                secstring = "0" + string(seconds);
            }
            draw_text_transformed(xoffset+xsize/2+20,yoffset+27,"0:" + secstring,1,1,0);
            draw_set_font(global.gg2Font);
            draw_set_halign(fa_center);
            draw_text_transformed(xoffset+xsize/2-3, yoffset+40,"Setup",         1,1,0);
        }else{
            if global.smallTimer==0{
                draw_sprite_ext(TimerS,floor(countdown/timeLimit*12),xoffset+xsize/2+39,yoffset+30,3,3,0,c_white,1);
            }
            var time, minutes, secondcounter, seconds, secstring;
            //minutes = floor(countdown/1800);
            //secondcounter = countdown-minutes*1800;
            //seconds = floor(secondcounter/30);
            secondcounter = ceil(countdown/30);
            minutes = secondcounter div 60;
            seconds = secondcounter mod 60;
            
            if (seconds >= 10){
                secstring = string(seconds);
            }else{
                secstring = "0" + string(seconds);
            }
                
            draw_text_transformed(xoffset+xsize/2+20,yoffset+32,string(minutes) + ":" + secstring,1,1,0);
        }
        draw_set_font(global.gg2Font);
    }
}else{
    if (mode == 2){
        if global.smallTimer==0{
            draw_sprite_ext(TimerOutlineS, 3+teamoffset, xoffset+xsize/2, yoffset, 2, 2, 0, c_white, 1);
        }
    }
    if global.smallTimer==0{
        draw_sprite_ext(TimerHudS, 3+teamoffset, xoffset+xsize/2+xshift, yoffset, 2,2,0,c_white,1);
    }
    if (countdown <= 0){
        draw_set_halign(fa_center);
        draw_text(xoffset+xsize/2+xshift,yoffset+2,"OVERTIME");
    }else{
        draw_set_halign(fa_right);
        var time, minutes, secondcounter, seconds, secstring;
        //minutes = floor(countdown/1800);
        //secondcounter = countdown-minutes*1800;
        //seconds = floor(secondcounter/30);
        secondcounter = ceil(countdown/30);
        minutes = secondcounter div 60;
        seconds = secondcounter mod 60;
        if global.smallTimer==0{
            draw_set_font(global.timerFont);
        }else{
            draw_set_font(global.gg2Font)
        }
        
        if (seconds >= 10){
            secstring = string(seconds);
        }else{
            secstring = "0" + string(seconds);
        }
            
        draw_text_transformed(xoffset+xsize/2+24, yoffset+2, string(minutes) + ":" + secstring, 1, 1, 0);
        draw_set_font(global.gg2Font);
    }
}
