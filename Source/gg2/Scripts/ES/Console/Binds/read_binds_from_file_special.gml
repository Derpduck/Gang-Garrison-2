if (file_exists("BindsSpecial.txt")){
    var file,fileString;
    file=file_text_open_read("BindsSpecial.txt")
    fileString=file_text_read_string(file)
    
    //Parse file
    var tempString_Binds,tempString_BindCommands,oldBindsSize;
    
    //Binds
    tempString_Binds=fileString
    
    //Prevent crashes from bad binds
    if string_count("##",tempString_Binds)>0{
        show_message("Bad bind found, check 'BindsSpecial.txt'.")
        file_text_close(file)
        exit;
    }
    
    //No bad binds; continue
    tempString_Binds=string_delete(fileString,string_pos("{COMMANDS}",fileString),string_length(fileString))
    oldBindsSize=string_length(tempString_Binds)

    var str;
    while(string_length(tempString_Binds)>8){
        str=string_char_at(tempString_Binds,8)
        if string_char_at(tempString_Binds,9)!="#"{
            str+=string_char_at(tempString_Binds,9)
        }
        if string_char_at(tempString_Binds,10)!="#"{
            str+=string_char_at(tempString_Binds,10)
        }
        ds_list_add(global.bindsCtrl,str)
        tempString_Binds=string_delete(tempString_Binds,8,string_length(str)+1)
    }

    //Bind Commands
    tempString_BindCommands=fileString
    tempString_BindCommands=string_copy(fileString,oldBindsSize+1,string_length(fileString)-oldBindsSize)

    var str;
    while(string_length(tempString_BindCommands)>11){
        str=string_char_at(tempString_BindCommands,11)
        
        var index;
        index=12
        while(index!=string_pos("#",tempString_BindCommands)){
            str+=string_char_at(tempString_BindCommands,index)
            index+=1
        }
        ds_list_add(global.bindCommandsCtrl,str)
        tempString_BindCommands=string_delete(tempString_BindCommands,11,string_length(str)+1)
    }
    file_text_close(file)
}
