var file,bindListSize,index;
if (file_exists("BindsSpecial.txt")){
    file_delete("BindsSpecial.txt")
}

file=file_text_open_write("BindsSpecial.txt")

file_text_write_string(file,"{BINDS}") //Header
bindListSize=ds_list_size(global.bindsCtrl)
index=0
while(index<bindListSize){
    file_text_write_string(file,string(ds_list_find_value(global.bindsCtrl,index))+"#")
    index+=1
}

file_text_write_string(file,"{COMMANDS}") //Header
index=0
while(index<bindListSize){
    file_text_write_string(file,string(ds_list_find_value(global.bindCommandsCtrl,index))+"#")
    index+=1
}

file_text_close(file)
