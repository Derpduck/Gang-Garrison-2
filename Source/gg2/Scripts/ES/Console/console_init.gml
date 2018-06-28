//Thanks to Orpheon for all of the console code, and Vindicator for making the original console.

//global.consoleIsOpen = 0;//Console is disabled by default, open it by clicking in the in-game menu.
global.consoleLog = ds_list_create()//All text in the console is saved here.
global.commandLog = ds_list_create()//All commands the user gave in are logged here.
global.consoleCommandMap = ds_map_create()//All console commands are here, with the name being the key to the to-be executed string.
global.documentationMap = ds_map_create()//See above, only this gets called when a user enters "help something".
global.consoleMaxLines = 14 //32
global.cMaxLength=110
global.RCONList=ds_list_create()
global.RCONSentCommand=0
global.RCONSentCommand_PlayerName=""
global.RCONCommand_out=""
global.RCONCustomMessage=""
global.RCONUseCustomMessage=0
global.binds=ds_list_create()
global.bindCommands=ds_list_create()
read_binds_from_file()
global.bindsCtrl=ds_list_create()
global.bindCommandsCtrl=ds_list_create()
read_binds_from_file_special()
define_special_binds()
global.isRCON=0
global.consoleMapChange=0
global.commandLogged=0
global.lockedTeams=0

for(i=0; i<global.consoleMaxLines; i+=1){
    ds_list_add(global.consoleLog, "")
}

console_defineCommands()

console_print(C_YELLW+"E-Sports Mod Console: "+string(GAME_VERSION_STRING))
console_print("---------------------")
