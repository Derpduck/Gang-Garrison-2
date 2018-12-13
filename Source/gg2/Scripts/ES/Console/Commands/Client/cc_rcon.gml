console_addCommand("rcon","
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

//Login as a RCON
if input[1]='login'{
    if global.isHost or global.isRCON{
        console_print('Only non-RCON clients can use this command.')
        exit;
    }
    
    var password;
    password=string(input[2])
    write_ubyte(global.serverSocket,RCON_LOGIN)
    write_ubyte(global.serverSocket,string_length(password))
    write_string(global.serverSocket,password)
    socket_send(global.serverSocket)
    
    exit;
}

//Add a player as RCON
if input[1]='add'{
    if !global.isHost{
        console_print('Only the host can use this command.')
        exit;
    }
    
    
    trueID=floor(real(string_digits(input[2])))
    var name_str;
    name_str=string_copy(input[3],0,20)
    
    //Check ID
    var player;
    if string_letters(input[2])==''{
        if (trueID<ds_list_size(global.players) and trueID>0){
            player=ds_list_find_value(global.players,trueID)
            write_ubyte(player.socket,RCON_LOGIN)
            write_ubyte(player.socket,RCON_LOGIN_SUCCESSFUL)
            ds_list_add(global.RCONList,player)
            if name_str=''{
                name_str=string_copy(player.name,0,20)
            }
            
            //Write to file
            if ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket))==-1{
                ds_list_add(global.rcon_ips,socket_remote_ip(player.socket))
                ds_list_add(global.rcon_names,name_str)
                
                var rcon_text, rcon_str, i;
                rcon_str=''
                for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
                    rcon_str+=ds_list_find_value(global.rcon_ips,i)+'@'+ds_list_find_value(global.rcon_names,i)+chr(10)
                }
                rcon_text=file_text_open_write('RCON_IPs.txt')
                file_text_write_string(rcon_text,rcon_str)
                file_text_close(rcon_text)
            }
            
            console_print(C_PINK+'RCON: '+player.name+' given RCON access.')
            var color;
            color=getPlayerColor(player, true);
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' given '+C_PINK+'RCON'+C_WHITE+' access.',global.printRCONStatus)
            exit;
        }else if trueID==0{
            console_print('The host cannot be made a RCON.')
            exit;
        }
    }

    //ID failed, check names
    with Player{
        if name == other.input[2]{
            if id==global.myself{
                console_print('The host cannot be made a RCON.')
                exit;
            }
            
            write_ubyte(socket,RCON_LOGIN)
            write_ubyte(socket,RCON_LOGIN_SUCCESSFUL)
            ds_list_add(global.RCONList,Player)
            if name_str=''{
                name_str=string_copy(player.name,0,20)
            }
            
            //Write to file
            if ds_list_find_index(global.rcon_ips,socket_remote_ip(socket))==-1{
                ds_list_add(global.rcon_ips,socket_remote_ip(socket))
                ds_list_add(global.rcon_names,name_str)
                
                var rcon_text, rcon_str, i;
                rcon_str=''
                for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
                    rcon_str+=ds_list_find_value(global.rcon_ips,i)+'@'+ds_list_find_value(global.rcon_names,i)+chr(10)
                }
                rcon_text=file_text_open_write('RCON_IPs.txt')
                file_text_write_string(rcon_text,rcon_str)
                file_text_close(rcon_text)
            }
            
            console_print(C_PINK+'RCON: '+name+' given RCON access.')
            var color;
            color=getPlayerColor(self, true);
            chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+' given '+C_PINK+'RCON'+C_WHITE+' access.',global.printRCONStatus)
            exit;
        }
    }
    
    //Could not find a player from info given
    console_print('Could not find a player with that ID or name.')
}

//Remove RCON from player
if input[1]='remove'{
    if !global.isHost{
        console_print('Only the host can use this command.')
        exit;
    }
    
    trueID=floor(real(string_digits(input[2])))
    
    //Check ID
    var player;
    if string_letters(input[2])==''{
        if (trueID<ds_list_size(global.players) and trueID>0){
            player=ds_list_find_value(global.players,trueID)
            if ds_list_find_value(global.RCONList, trueID)!=-1{
                write_ubyte(player.socket,RCON_LOGIN)
                write_ubyte(player.socket,RCON_LOGIN_FAILED)
                ds_list_delete(global.RCONList,ds_list_find_index(global.RCONList,player))
                
                //Write to file
                if ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket))!=-1{
                    ds_list_delete(global.rcon_names,ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket)))
                    ds_list_delete(global.rcon_ips,ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket)))
                    
                    var rcon_text, rcon_str, i;
                    rcon_str=''
                    for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
                        rcon_str+=ds_list_find_value(global.rcon_ips,i)+'@'+ds_list_find_value(global.rcon_names,i)+chr(10)
                    }
                    rcon_text=file_text_open_write('RCON_IPs.txt')
                    file_text_write_string(rcon_text,rcon_str)
                    file_text_close(rcon_text)
                }
                
                console_print(C_PINK+'RCON: '+player.name+chr(39)+'s RCON access removed.')
                var color;
                color=getPlayerColor(player, true);
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+chr(39)+'s '+C_PINK+'RCON'+C_WHITE+' access'+P_RED+' removed'+C_WHITE+'.',global.printRCONStatus)
                exit;
            }else{
                console_print('This player is not a RCON.')
                exit;
            }
        }
    }else if trueID==0{
        console_print('This player is the host.')
        exit;
    }

    //ID failed, check names
    with Player{
        if name == other.input[2]{
            if id==global.myself{
                console_print('The host cannot be made a RCON.')
                exit;
            }
            
            if ds_list_find_value(global.RCONList, trueID)!=-1{
                write_ubyte(socket,RCON_LOGIN)
                write_ubyte(socket,RCON_LOGIN_FAILED)
                ds_list_delete(global.RCONList,ds_list_find_index(global.RCONList,Player))
                
                //Write to file
                if ds_list_find_index(global.rcon_ips,socket_remote_ip(socket))!=-1{
                    ds_list_delete(global.rcon_names,ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket)))
                    ds_list_delete(global.rcon_ips,ds_list_find_index(global.rcon_ips,socket_remote_ip(socket)))
                    
                    var rcon_text, rcon_str, i;
                    rcon_str=''
                    for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
                        rcon_str+=ds_list_find_value(global.rcon_ips,i)+'@'+ds_list_find_value(global.rcon_names,i)+chr(10)
                    }
                    rcon_text=file_text_open_write('RCON_IPs.txt')
                    file_text_write_string(rcon_text,rcon_str)
                    file_text_close(rcon_text)
                }
                
                console_print(C_PINK+'RCON: '+name+chr(39)+'s RCON access removed.')
                var color;
                color=getPlayerColor(self, true);
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(name)+C_WHITE+chr(39)+'s '+C_PINK+'RCON'+C_WHITE+' access'+P_RED+' removed'+C_WHITE+'.',global.printRCONStatus)
                exit;
            }else{
                console_print('This player is not a RCON.')
                exit;
            }
        }
    }
    //Could not find a player from info given
    console_print('Could not find a player with that ID or name.')
}

if input[1]='password'{
    if !global.isHost{
        console_print('Only the host can use this command.');
        exit;
    }
    var newPass,oldPass;
    newPass=input[2]
    
    oldPass=global.RCONPassword
    if oldPass==''{
        oldPass='<NULL>'
    }
    global.RCONPassword=newPass
    console_print(C_PINK+'RCON password changed from: '+string(oldPass)+', to: '+string(newPass)+'.')
    
    exit;
}

if input[1]='toggle'{
    if !global.isHost{
        console_print('Only the host can use this command.');
        exit;
    }
    if global.RCONAllowed==0{
        global.RCONAllowed=1
        console_print(C_PINK+'RCON enabled.')
    }else if global.RCONAllowed==1{
        global.RCONAllowed=0
        console_print(C_PINK+'RCON disabled.')
    }
    
    exit;
}

if input[1]='list'{
    if !global.isHost{
        console_print('Only the host can use this command.');
        exit;
    }
    
    var nameLength, spacesNumber, spacesUsed;
    nameLength=0
    spacesNumber=20
    spacesUsed=''
    
    for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
        spacesUsed=''
        nameLength=string_length(ds_list_find_value(global.rcon_names,i))
        spacesNumber=20-nameLength
        repeat(spacesNumber){
            spacesUsed=string_insert(' ',spacesUsed,0)
        }
        console_print(C_PINK+c_filter(ds_list_find_value(global.rcon_names,i))+spacesUsed+' | IP: '+string(ds_list_find_value(global.rcon_ips,i)))
    }
    exit;
}

console_print('Invalid input; type <help rcon> for info.')
", "
console_print('Syntax: rcon login <password>')
console_print(C_GREEN+'Request to be made a RCON on the server by sending the correct password. (Clients only)')
console_print('Syntax: rcon <add/remove> <Player ID/Player Name>')
console_print(C_GREEN+'Add or remove RCONs. (Host only)')
console_print('Syntax: rcon password <new password>')
console_print(C_GREEN+'Change the RCON password. (Host only)')
console_print('Syntax: rcon toggle')
console_print(C_GREEN+'Enables/disables functionality of RCON. (Host only)')
");
