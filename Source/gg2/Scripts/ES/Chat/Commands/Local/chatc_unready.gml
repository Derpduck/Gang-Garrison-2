chat_addCommandLocal("unready", "
global.chatReady=0
global.chatUnready=1
global.chatToggleReady=0
", "
console_print('Syntax: unready')
console_print('Un-RUP.')
")

chat_addCommandLocal("ur", "
global.chatReady=0
global.chatUnready=1
global.chatToggleReady=0
", "
console_print('Syntax: ur')
console_print('Un-RUP.')
")
