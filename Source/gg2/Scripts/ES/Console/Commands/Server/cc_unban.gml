console_addCommand("unban", "
/*
//HOST ONLY
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if !global.isHost{
    console_print('Only the host can use this command.')
    exit;
}

checkIP=input[1]

if ds_list_find_index(global.banned_ips,checkIP)!=-1{
    ds_list_delete(global.banned_ips,ds_list_find_index(global.banned_ips,checkIP))

    var text, str, newbanlist;
    if file_exists('Banned_IPs.txt'){
        text = file_text_open_read('Banned_IPs.txt')
        newbanlist=''
        while not file_text_eof(text){
            str = file_text_read_string(text)
            if string_pos(checkIP,str){
                str=''
            }
            newbanlist+=str+chr(10)
            file_text_readln(text)
        }
        file_text_close(text)
        file_delete('Banned_IPs.txt')
        text=file_text_open_write('Banned_IPs.txt')
        file_text_write_string(text,newbanlist)
        file_text_close(text)
    }
    
    console_print('Removed ban on: '+checkIP)
    exit;
}

console_print('IP not found in ban list.')
", "
console_print('Syntax: unban <IP>')
console_print('Removed the banned IP from the ban list. Type <bans> to list all banned IPs.')
");
