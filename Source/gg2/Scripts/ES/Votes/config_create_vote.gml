//argument0=config name
//argument1=player id of vote starter
player=argument0
configName=argument1

if global.configVoteAllowed==0{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Config voting is'+P_RED+' disabled'+C_WHITE+'.')
    exit;
}

if global.isVoting==1{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Cannot start a new vote while one is already in progress.')
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

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Voting to load config: '+C_GREEN+configName+C_WHITE+'...')
chat_sendmsg(global.chatPrintPrefix+C_WHITE+string(global.voteTimer)+' seconds to vote '+C_GREEN+'!y'+C_WHITE+'/'+P_RED+'!n')
