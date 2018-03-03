//argument0=specific case where this is used, but dont want to show chat (no message sent but chat opened)
with(ChatBox){
    if argument0!=1{
        idle=false
    }
    alarm[1]=idleTime/global.delta_factor
}
