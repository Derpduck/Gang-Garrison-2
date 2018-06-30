//argument0 = message to send
//argument1 = variable bool check, don't send if it's 0
//argument2 = message target if not global
//argument3 = person sending the message
message=string(argument0)
print=real(argument1)
target=argument2
sender=argument3

if print==-1{
    print=1
}

if print==0 exit;

if target==-1{
    target=global.publicChatBuffer
}

write_ubyte(target, CHAT_PUBLIC_MESSAGE);
write_ushort(target, string_length(message));
write_string(target, message);
write_byte(target,sender)
if target==-1 or target==global.myself{
    print_to_chat(message);// For the host
}
