switch(argument0)
{
case CC_DISABLED:
    return "Disabled";
    break;
case CC_HOST:
    return "Host Only";
    break;
case CC_HOST_RCON:
    return "Host + RCON Only";
    break;
case CC_CLIENT:
    return "Client Only";
default:
    return "Unknown"
    break
}
