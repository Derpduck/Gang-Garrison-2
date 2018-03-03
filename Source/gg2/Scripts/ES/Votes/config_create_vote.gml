//argument0=config name
//argument1=player id of vote starter
configName=argument0
player=argument1

if global.configVoteAllowed==0{
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Config voting is'+P_RED+' disabled'+C_WHITE+'.'
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

//non-existing config attempted to load
if !file_exists(working_directory+"\Configs\"+configName+".cfg"){
    if room==ModOptions{
        show_message("Config: '"+configName+"' does not exist. Exiting.")
    }
    if room==CustomMapRoom{
        config_print_load(1,configName)
    }
    exit;
}

global.isVoting=1
global.yesVotes=1
global.noVotes=0
global.votedList=ds_list_create()
ds_list_add(global.votedList,player)
vote=instance_create(0,0,VoteHandler)
vote.type="config"
vote.cfgName=configName

var message;
message = global.chatPrintPrefix+C_WHITE+'Voting to load config: '+C_GREEN+configName+C_WHITE+'...'
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
