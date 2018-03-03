//Kick/Ban/TBan/RCON/Kill/Mute
with(ModController){
    event_user(0)
}
if global.chatPBF_16==1 and global.isHost{
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
    write_ushort(global.publicChatBuffer, string_length(global.srvMsgChatPrint));
    write_string(global.publicChatBuffer, global.srvMsgChatPrint);
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(global.srvMsgChatPrint);// For the host
    
    //ModController.alarm[1]=3/global.delta_factor
}

ModController.alarm[1]=3/global.delta_factor
