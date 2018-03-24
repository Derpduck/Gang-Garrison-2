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

pugValue=0

mapPicks=real(string_digits(input[2]))
mapNumber=ceil(mapPicks)

pug_create_vote(global.chatCommandPlayerID,picks,pugValue,mapNumber)
", "
console_print('Syntax: pug <players per team> <number of maps>')
console_print('Requests the server to start a pug.')
")

//Identical to above, except for pugValue
chat_addCommandSent("mix", "
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

pugValue=1

mapPicks=real(string_digits(input[2]))
mapNumber=ceil(mapPicks)

pug_create_vote(global.chatCommandPlayerID,picks,pugValue,mapNumber)
", "
console_print('Syntax: mix <players per team> <number of maps>')
console_print('Requests the server to start a mix.')
")

//Identical to above, except for pugValue
chat_addCommandSent("war", "
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

pugValue=2

mapPicks=real(string_digits(input[2]))
mapNumber=ceil(mapPicks)

pug_create_vote(global.chatCommandPlayerID,picks,pugValue,mapNumber)
", "
console_print('Syntax: war <players per team> <number of maps>')
console_print('Requests the server to start a war.')
")
