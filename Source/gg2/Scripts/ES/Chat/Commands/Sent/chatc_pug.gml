chat_addCommandSent("pug", "
/*
//HOST ONLY
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if !global.isHost{
    console_print('Only the host can use this command.')
    exit;
}

//cfgName=string(input[1])

inputPicks=real(string_digits(input[1]))
picks=ceil(inputPicks)

if picks<=0{
    picks=4
}

mix=string_lower(input[2])


if mix=='mix'{
    mixValue=1
}else{
    mixValue=0
}

pug_create_vote(global.chatCommandPlayerID,picks,mixValue)
", "
console_print('Syntax: pug <players per team>')
console_print('Requests the server to start a pug.')
")
