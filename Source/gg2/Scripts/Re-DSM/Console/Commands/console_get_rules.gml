// TODO: Update code for new standards

// Built-in checks for who can execute each console command, primarily to prevent malicious clients sending illegal commands
// Used with console_add_command to prepend the checks to each command
// argument0 = Which level of security to apply
// 0 / Default = Client
// 1 = Host + RCON
// 2 = Host Only

var rule;
switch(argument0)
{
// Host + RCON
case 1:
    rule = "
    var command;
    command=input[0]+' '+input[1]+' '+input[2]+' '+input[3]+' '+input[4]+' '+input[5] //delete as necessary
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
    
    "

// Host Only
case 2:
    rule = "
    if global.RCONSentCommand=1{
        console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
        console_print(C_ORNGE+global.RCONCommand_out)
        exit
    }
    
    if !global.isHost{
        console_print('Only the host can use this command.')
        exit;
    }
    
    "

//Client
default:
rule = "
    if global.RCONSentCommand=1{
        console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
        console_print(C_ORNGE+global.RCONCommand_out)
        exit
    }
    
    "
}

return rule;
