// Display custom notification message box, to replace show_message
var notification;

if (!instance_exists(NotificationMessage))
{
    notification = instance_create(0, 0, NotificationMessage);
    notification.messageText = argument0;
}
else
{
    // Append messages
    with(NotificationMessage)
    {
        if (string_count(other.argument0, messageText) == 0)
        {
            messageText += "##////////////////////##" + other.argument0;
        }
    }
}
