//argument0=player id of vote starter
player=argument0
picks=argument1
mix=argument2
maps=argument3

if global.pugVoteAllowed==0{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'PUG voting is'+P_RED+' disabled'+C_WHITE+'.')
    exit;
}

if global.isVoting==1{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Cannot start a new vote while one is already in progress.')
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

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Voting to start a '+C_PINK+string(picks)+"v"+string(picks)+C_GREEN+typeString+C_WHITE+'...')
chat_sendmsg(global.chatPrintPrefix+C_WHITE+string(global.voteTimer)+' seconds to vote '+C_GREEN+'!y'+C_WHITE+'/'+P_RED+'!n')

global.pugVotePicks=picks
global.pugVoteMaps=maps
