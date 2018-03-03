chat_addCommandLocal("ready", "
global.chatReady=1
global.chatUnready=0
global.chatToggleReady=0
", "
console_print('Syntax: ready')
console_print('RUP.')
")

chat_addCommandLocal("r", "
global.chatReady=1
global.chatUnready=0
global.chatToggleReady=0
", "
console_print('Syntax: r')
console_print('RUP.')
")
