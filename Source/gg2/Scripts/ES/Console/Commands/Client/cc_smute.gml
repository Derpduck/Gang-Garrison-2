console_addCommand("smute", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

trueID=floor(real(string_digits(input[1])))

//Check ID
var player;
if string_letters(input[1])==''{
    if (trueID<ds_list_size(global.players)){ // and trueID>0){
        player=ds_list_find_value(global.players,trueID)
        
        if player.id==global.myself{
            console_print('You cannot mute yourself.')
            exit;
        }

        ds_list_add(global.clientChatBanList,player.permID)
        
        console_print(c_filter(player.name)+' has been self muted.')
        var color;
        color=getPlayerColor(player, true);
        global.clientMsgChatPrint=global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has been self muted.'
        console_localmsg()
        exit;
    }//else if trueID==0{
     //   console_print('The host cannot be muted.')
     //   exit;
    //}
}

//ID failed, check names
with Player{
    if name == other.input[1]{
        if id==global.myself{
            console_print('You cannot mute yourself.')
            exit;
        }
        
        ds_list_add(global.clientChatBanList,permID)
        
        console_print(c_filter(name)+' has been self muted.')
        var color;
        color=getPlayerColor(player, true)
        global.clientMsgChatPrint=global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' has been self muted.'
        console_localmsg()
        exit;
    }
}

//Could not find a player from info given
console_print('Could not find a player with that ID or name.')
", "
console_print('Syntax: smute <Player ID/Player Name>')
console_print('Locally ignores all messages from the selected player in the chat. IDs are considered before names.')
");
