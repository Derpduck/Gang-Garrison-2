//argument0 = message to send
//argument1 = variable bool check, don't send if it's 0
message=string(argument0)
print=real(argument1)

if print==-1{
    print=1
}

if print==0 exit;

write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
write_ushort(global.publicChatBuffer, string_length(message));
write_string(global.publicChatBuffer, message);
write_byte(global.publicChatBuffer,-1)
print_to_chat(message);// For the host
