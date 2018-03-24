//argument0=player id of vote starter
player=argument0
picks=argument1
mix=argument2
maps=argument3

if global.pugVoteAllowed==0{
    var message;
    message = global.chatPrintPrefix+C_WHITE+'PUG voting is'+P_RED+' disabled'+C_WHITE+'.'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
    exit;
}

if global.isVoting==1{
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Cannot start a new vote while one is already in progress.'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
    exit;
}

global.isVoting=1
global.yesVotes=1
global.noVotes=0
global.votedList=ds_list_create()
ds_list_add(global.votedList,player)
vote=instance_create(0,0,VoteHandler)
vote.type="pug"
vote.voteMix=argument2
if vote.voteMix==1{
    typeString=" MIX"
}else if vote.voteMix==2{
    typeString=" WAR"
}else{
    typeString=" PUG"
}

var message;
message = global.chatPrintPrefix+C_WHITE+'Voting to start a '+C_PINK+string(picks)+"v"+string(picks)+C_GREEN+typeString+C_WHITE+'...'
write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
write_ushort(global.publicChatBuffer, string_length(message))
write_string(global.publicChatBuffer, message)
write_byte(global.publicChatBuffer,-1)
print_to_chat(message);// For the host

var message;
message = global.chatPrintPrefix+C_WHITE+string(global.voteTimer)+' seconds to vote '+C_GREEN+'!y'+C_WHITE+'/'+P_RED+'!n'
write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
write_ushort(global.publicChatBuffer, string_length(message))
write_string(global.publicChatBuffer, message)
write_byte(global.publicChatBuffer,-1)
print_to_chat(message);// For the host

global.pugVotePicks=picks
global.pugVoteMaps=maps
