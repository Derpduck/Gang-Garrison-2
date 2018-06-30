//argument0=player id of vote starter
player=argument0

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
vote.type="skip"

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Voting to '+C_GREEN+'skip this map'+C_WHITE+'...')

chat_sendmsg(global.chatPrintPrefix+C_WHITE+string(global.voteTimer)+' seconds to vote '+C_GREEN+'!y'+C_WHITE+'/'+P_RED+'!n')
