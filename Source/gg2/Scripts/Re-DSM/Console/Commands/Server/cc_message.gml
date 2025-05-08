console_add_command('message', '
if (console_validate_args(1, arg[0], "message <text>") == false) exit;

var message;
message = string_delete(originalInput, 1, string_length("message "));

ServerMessageString(global.sendBuffer, message);
create_notice_message(message);
console_print(COL_ORANGE + "Sent Notice Message: " + message);
', '
console_print("Syntax: message <text>);
console_print("Sends all clients a notification bearing the message");
', CC_HOST_RCON);
