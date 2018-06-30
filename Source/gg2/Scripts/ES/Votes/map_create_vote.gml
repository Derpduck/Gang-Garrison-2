//argument0=player id of vote starter
//argument1=name of new map
player=argument0
newMap=argument1

if global.isVoting==1{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Cannot start a new vote while one is already in progress.')
    exit;
}

//Invalid map check
if(!file_exists('Maps/' + newMap + '.png')){
    chat_sendmsg(global.chatPrintPrefix+C_GREEN+string(newMap)+C_WHITE+" is not a valid map name; pick another map or ensure you have typed it correctly.")
    break;
}

global.isVoting=1
global.yesVotes=1
global.noVotes=0
global.votedList=ds_list_create()
ds_list_add(global.votedList,player)
vote=instance_create(0,0,VoteHandler)
vote.type="map"
vote.mapName=string(newMap)

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Voting for the '+C_GREEN+'next map'+C_WHITE+' to be: '+C_PINK+string(newMap)+C_WHITE+'...')
chat_sendmsg(global.chatPrintPrefix+C_WHITE+string(global.voteTimer)+' seconds to vote '+C_GREEN+'!y'+C_WHITE+'/'+P_RED+'!n')
