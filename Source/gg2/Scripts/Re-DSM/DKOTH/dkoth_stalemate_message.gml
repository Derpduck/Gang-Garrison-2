var message;
message = "Timers will count down until one team captures a point!";

switch(global.dkothStalemateMode)
{
case 1:
    message += " Losing team gets a timer advantage";
    break;
case 2:
    message += " Winning team gets a timer advantage";
    break;
}

ServerMessageString(message, global.sendBuffer);
create_notice_message(message);
