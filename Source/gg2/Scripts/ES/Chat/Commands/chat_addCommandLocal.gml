//Adds a command for the chat, built for plugins.
//Means to be a standing convention.

//argument0 = command name; argument1 = command itself; argument2 = documentation.

ds_map_add(global.chatCommandMapLocal, argument0, argument1)

if argument2 != ""{
    ds_map_add(global.chatDocumentationMapLocal, argument0, argument2)
}else{
    ds_map_add(global.chatDocumentationMapLocal, argument0, "This command does not have a valid documentation.")
}
