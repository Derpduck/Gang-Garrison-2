console_addCommand("jump", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]
if global.isRCON==1 and !global.isHost{
    //Parse string
    var stringLength;
    stringLength=string_length(string(command))
        
    write_ubyte(global.serverSocket,RCON_COMMAND)
    write_ubyte(global.serverSocket,stringLength)
    write_string(global.serverSocket,command)
    socket_send(global.serverSocket)
    exit;
}else if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
}
if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

//arg1=input[1]
if input[1]==''{
    console_print('Invalid or no option selected. Please use a number between 0 and 2.')
    exit;
}
if string_letters(input[1])==''{
    option=real(string_digits(input[1]))
}else{
    console_print('Invalid or no option selected. Please use a number between 0 and 2.')
    exit;
}

if option==0{
    global.jumpMapMode=0
    console_print('Jump map mode disabled.')
}else if option==1{
    global.jumpMapMode=1
    console_print('Jump map mode enabled.')
}else if option==2{
    global.jumpMapMode=2
    console_print('Jump map mode enabled by map name.')
}else{
    console_print('Invalid or no option selected. Please use a number between 0 and 2.')
    exit;
}

global.jumpMode=0
if global.jumpMapMode==1{
    global.jumpMode=1
}else if global.jumpMapMode==2{
    prefixIndex[0]='rj'
    prefixIndex[1]='dj'
    prefixIndex[2]='rr'
    prefixIndex[3]='sj'
    prefixIndex[4]='ej'
    prefixIndex[5]='qr'
    prefixIndex[6]='pj'
    prefixIndex[7]='jt'
    prefixIndex[8]='surf'
    prefixIndex[9]='jump'
    for (i=0; i<10; i+=1){
        if string_pos(prefixIndex[i],string_lower(global.currentMap))==1{
            global.jumpMode=1
        }
    }
}

", "
console_print('Syntax: jump <0-2>')
console_print('Changes the jump map mode option.')
");
