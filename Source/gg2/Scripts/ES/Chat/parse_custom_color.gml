//we use the blank characters in the chat font to represent a colour code
//character code is offset by +33 (of sprite index number, e.g. "(", image 7, code is 33+7=40)
//unfortunately we cant create new characters (afaik), so we are limited to the number of existing blank characters in the font (7)
//[MAYBE] image 97 (was identical to comma) [single low quotation mark] was appropriated for this
//[MAYBE] image 104 [per mile sign] was appropriated for this
//[MAYBE] image 197 [latin ae] was appropriated for this
//this character is shown to the player when typing the message, it will be represented as a coloured block
//when sent the character is converted to a normal colour code with this script
//hold alt and press a number key to pick the colour i guess

//argument0=message sent by client
var message;
message=argument0
string(chr(94+33))

var col1,col2,col3,col4,col5,col6,col7,col8,col9,col0;
col1=C_WHITE //94
col2=C_BLACK //96
col3=P_DKRED //97
col4=P_ORNGE //104
col5=C_PINK //108
col6=P_DKPRP //110
col7=C_CYAN //111
col8=P_DBLUE //124
col9=P_AQUA //127
col0=P_DKGRN //197
//255 0 150  pinky/redy
//maybe add a random colour, sever just picks 3 random rgb values for the colour code

if string_count(string(chr(94+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(94+33)),col1)
    }else{
        message=string_replace_all(message,string(chr(94+33)),"")
    }
}
if string_count(string(chr(96+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(96+33)),col2)
    }else{
        message=string_replace_all(message,string(chr(96+33)),"")
    }
}
if string_count(string(chr(97+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(97+33)),col3)
    }else{
        message=string_replace_all(message,string(chr(97+33)),"")
    }
}
if string_count(string(chr(104+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(104+33)),col4)
    }else{
        message=string_replace_all(message,string(chr(104+33)),"")
    }
}
if string_count(string(chr(108+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(108+33)),col5)
    }else{
        message=string_replace_all(message,string(chr(108+33)),"")
    }
}
if string_count(string(chr(110+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(110+33)),col6)
    }else{
        message=string_replace_all(message,string(chr(110+33)),"")
    }
}
if string_count(string(chr(111+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(111+33)),col7)
    }else{
        message=string_replace_all(message,string(chr(111+33)),"")
    }
}
if string_count(string(chr(124+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(124+33)),col8)
    }else{
        message=string_replace_all(message,string(chr(124+33)),"")
    }
}
if string_count(string(chr(127+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(127+33)),col9)
    }else{
        message=string_replace_all(message,string(chr(127+33)),"")
    }
}
if string_count(string(chr(197+33)),message)>0{
    if global.chatColorCodes==1{
        message=string_replace_all(message,string(chr(197+33)),col0)
    }else{
        message=string_replace_all(message,string(chr(197+33)),"")
    }
}

return message;
