x=0
while(sound_exists(x)){
    if file_exists("Custom/"+sound_get_name(x)+".wav"){
        sound_replace(x,"Custom/"+sound_get_name(x)+".wav",0,true)
    }
    x+=1
}
