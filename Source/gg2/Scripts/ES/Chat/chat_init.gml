global.isChatting=0
global.chatPrintPrefix=C_CYAN2+"> "
global.chatCommandMapLocal = ds_map_create() //All chat commands are here, with the name being the key to the to-be executed string. Uses same format as console.
global.chatDocumentationMapLocal = ds_map_create()//See above, only this gets called when a user enters "help something".
global.chatCommandMapSent = ds_map_create() //All chat commands are here, with the name being the key to the to-be executed string. Uses same format as console.
global.chatDocumentationMapSent = ds_map_create()//See above, only this gets called when a user enters "help something".
global.chatCommandPlayerID=-1 //yes this is dumb
chat_defineCommands()
