//argument0=success/failed
//argument1=configName
failed=real(argument0)
if failed==0{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Successfully loaded config: '+C_GREEN+argument1+C_WHITE+'!')
}else if failed==1{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Failed to load config: '+C_GREEN+argument1+C_WHITE+', config does not exist.')
}
