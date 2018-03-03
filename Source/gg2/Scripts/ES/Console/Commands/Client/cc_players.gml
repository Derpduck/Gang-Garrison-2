console_addCommand("players", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

var redteam, blueteam, specteam, player, nameLength, spacesNumber, spacesUsed;
redteam = ds_list_create();
blueteam = ds_list_create();
specteam = ds_list_create();
nameLength=0
spacesNumber=20
spacesUsed=''

with Player{
    if team == TEAM_RED{
        ds_list_add(redteam, id);
    }else if team == TEAM_BLUE{
        ds_list_add(blueteam, id);
    }else{
        ds_list_add(specteam, id);
    }
}

console_print('Current Player list:')

for (i=0; i<ds_list_size(redteam); i+=1){
    player = ds_list_find_value(redteam, i);
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    
    spacesUsed=''
    nameLength=string_length(player.name)
    spacesNumber=20-nameLength
    repeat(spacesNumber){
        spacesUsed=string_insert(' ',spacesUsed,0)
    }
    
    if player==RCONPlayer{
        console_print(C_LRED+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id))+' | RCON');
    }else{
        console_print(C_LRED+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id)));
    }
}
for (i=0; i<ds_list_size(blueteam); i+=1){
    player = ds_list_find_value(blueteam, i);
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    
    spacesUsed=''
    nameLength=string_length(player.name)
    spacesNumber=20-nameLength
    repeat(spacesNumber){
        spacesUsed=string_insert(' ',spacesUsed,0)
    }
    
    if player==RCONPlayer{
        console_print(C_LBLUE+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id))+' | RCON');
    }else{
        console_print(C_LBLUE+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id)));
    }
}
for (i=0; i<ds_list_size(specteam); i+=1){
    player = ds_list_find_value(specteam, i);
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    
    spacesUsed=''
    nameLength=string_length(player.name)
    spacesNumber=20-nameLength
    repeat(spacesNumber){
        spacesUsed=string_insert(' ',spacesUsed,0)
    }
    
    if player==RCONPlayer{
        console_print(C_GREEN+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id))+' | RCON');
    }else{
        console_print(C_GREEN+c_filter(player.name)+': '+spacesUsed+'ID: '+string(ds_list_find_index(global.players, player.id)));
    }
}
ds_list_destroy(redteam)
ds_list_destroy(blueteam)
ds_list_destroy(specteam)
", "
console_print('Syntax: players')
console_print('Prints a color-coded list of the IDs of all the players in the server, which are necessary for anything requiring a specific player.')
");
