console_addCommand("classlimit", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]+' '+input[2]
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

var class, number;
//Undefined
class=''
number=-1

//Check the inputs
if input[1]!=''{
    class=input[1]
    class=string(class)
}
if input[2]!=''{
    number=input[2]
    number=real(number)
}

//Get the class name
if class=='scout' or class=='runner' or class=='1'{
    global.classlimits[CLASS_SCOUT]=number
    console_print(C_LBLUE+'Scout limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Runner '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='pyro' or class=='firebug' or class=='2'{
    global.classlimits[CLASS_PYRO]=number
    console_print(C_LBLUE+'Pyro limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Firebug '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='soldier' or class=='rocketman' or class=='3'{
    global.classlimits[CLASS_SOLDIER]=number
    console_print(C_LBLUE+'Soldier limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Rocketman '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='heavy' or class=='overweight' or class=='4'{
    global.classlimits[CLASS_HEAVY]=number
    console_print(C_LBLUE+'Heavy limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Overweight '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='demoman' or class=='detonator' or class=='5'{
    global.classlimits[CLASS_DEMOMAN]=number
    console_print(C_LBLUE+'Demoman limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Detonator '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='medic' or class=='healer' or class=='6'{
    global.classlimits[CLASS_MEDIC]=number
    console_print(C_LBLUE+'Medic limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Healer '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='engineer' or class=='constructor' or class=='7'{
    global.classlimits[CLASS_ENGINEER]=number
     console_print(C_LBLUE+'Engineer limit changed to: '+string(number))
     global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Constructor '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='spy' or class=='infiltrator' or class=='8'{
    global.classlimits[CLASS_SPY]=number
    console_print(C_LBLUE+'Spy limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Infiltrator '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit
}else if class=='sniper' or class=='rifleman' or class=='9'{
    global.classlimits[CLASS_SNIPER]=number
    console_print(C_LBLUE+'Sniper limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Rifleman '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='quote' or class=='curly' or class=='qc' or class=='q/c' or class=='0'{
    global.classlimits[CLASS_QUOTE]=number
    console_print(C_LBLUE+'Quote/Curly limit changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'Quote/Curly '+C_WHITE+'classlimit set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else if class=='all' or class==string(-1){
    global.classlimits[CLASS_SCOUT]=number
    global.classlimits[CLASS_PYRO]=number
    global.classlimits[CLASS_SOLDIER]=number
    global.classlimits[CLASS_HEAVY]=number
    global.classlimits[CLASS_DEMOMAN]=number
    global.classlimits[CLASS_MEDIC]=number
    global.classlimits[CLASS_ENGINEER]=number
    global.classlimits[CLASS_SPY]=number
    global.classlimits[CLASS_SNIPER]=number
    global.classlimits[CLASS_QUOTE]=number
    console_print(C_LBLUE+'All classlimits changed to: '+string(number))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_LBLUE+'All '+C_WHITE+'classlimits set to: '+C_GREEN+string(number)+C_WHITE+'.'
    console_miscmsg()
    exit;
}else{
    console_print(class+' is not a valid class. For a list of possible class names type <help classlimits>.')
    exit;
}

if class=''{
    console_print('No class specified.')
    exit;
}
if number=-1{
    console_print('No limit specified.')
    exit;
}
","
console_print('Syntax: classlimit <class name> <number>')
console_print('Changes the classlimtis of any class. Use the <GG2> name, <TF2> name, or number for <class name>. <0> is used for Q/C. Use <all> or <-1> to change the classlimit for every class.')
")
