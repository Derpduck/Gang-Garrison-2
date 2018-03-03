chat_addCommandLocal("arena", "
if !instance_exists(MGE_HUD) exit;
if string(input[1])=='' exit;
newArena=real(input[1])
newArenaSend=newArena-1

if newArena<0 exit;
if newArena>5 exit;

write_ubyte(global.serverSocket, MGE_CHANGE_ARENA)
write_byte(global.serverSocket, newArenaSend)
socket_send(global.serverSocket)

with(TeamSelectController) done=1
with(ClassSelectController) done=1
with(SmallTeamSelect) done=1
with(SmallClassSelect) done=1
", "
console_print('Syntax: arena')
console_print('Select an arena for MGE mode. 0 for no arena.')
")
