//argument0=success/failed
//argument1=configName
failed=real(argument0)
if failed==0{
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Successfully loaded config: '+C_GREEN+argument1+C_WHITE+'!'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
}else if failed==1{
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Failed to load config: '+C_GREEN+argument1+C_WHITE+', config does not exist.'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
}
