console_addCommand("cast", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if global.isCasting==0{
    global.isCasting=1
    castHUD=instance_create(0,0,CasterHUD)
    console_print('Caster HUD enabled.')
    exit;
}else{
    global.isCasting=0
    console_print('Caster HUD disabled.')
    exit;
}
", "
console_print('Syntax: cast')
console_print('Toggles caster mode (gives the caster HUD).')
");
