chat_addCommandLocal("toggleready", "
global.chatReady=0
global.chatUnready=0
global.chatToggleReady=1
", "
console_print('Syntax: toggleready')
console_print('Toggle RUP.')
")

chat_addCommandLocal("tr", "
global.chatReady=0
global.chatUnready=0
global.chatToggleReady=1
", "
console_print('Syntax: tr')
console_print('Toggle RUP.')
")
