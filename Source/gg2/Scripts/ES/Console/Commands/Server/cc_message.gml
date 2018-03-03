console_addCommand("message", "
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

if input[1] != ''{
    var message;
    message = input[1];
    if string_copy(message, 0, 1) == chr(34){
        //Cut off starting and ending quotes
        message = string_copy(message, 2, string_length(message)-2);
    }
    message = string_copy(message, 0, 255);
    
    write_ubyte(global.sendBuffer, MESSAGE_STRING);
    write_ubyte(global.sendBuffer, string_length(message));
    write_string(global.sendBuffer, message);
    var notice;
    with NoticeO instance_destroy();
    notice = instance_create(0, 0, NoticeO);
    notice.notice = NOTICE_CUSTOM;
    notice.message = message;
    
    console_print('Message sent: '+message)
    exit;
}else{
    console_print('No message input; please type a message.')
    exit;
}
", "
console_print('Syntax: message <message>');
console_print('Sends all clients a notification bearing the message. Message containing spaces must be surrounded by quotes.');
");
