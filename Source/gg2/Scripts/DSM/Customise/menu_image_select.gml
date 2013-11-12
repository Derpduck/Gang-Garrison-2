if global.dsmBackground==0 or global.dsmBackground==3 exit;
if (room!=Menu or room!=Credits or room!=Options or room!=StatsR or room!=Lobby) exit

background_visible[0]=false

if global.dsmBackground==1{ //Match text colour
    if global.textHighlightColour==0{ //Red
        background_visible[1]=false
        background_visible[3]=false
        
        background_visible[2]=true
    }else if global.textHighlightColour==1{ //Blue
        background_visible[1]=false
        background_visible[2]=false
        
        background_visible[3]=true
    }else if global.textHighlightColour==2{ //Green
        background_visible[2]=false
        background_visible[3]=false
    
        background_visible[1]=true
    }else if global.textHighlightColour==3{ //Random
        background_visible[1]=false
        background_visible[2]=false
        background_visible[3]=false
        
        background_visible[random_range(1,3)]=true
    }
}else if global.dsmBackground==2{ //Any
        background_visible[1]=false
        background_visible[2]=false
        background_visible[3]=false
        
    background_visible[random_range(1,3)]=true
}else{
    background_visible[0]=true
}
