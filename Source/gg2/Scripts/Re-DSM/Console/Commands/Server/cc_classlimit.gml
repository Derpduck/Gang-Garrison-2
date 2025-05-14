console_add_command('classlimit', '
if (console_validate_args(2, arg[0], "classlimit <class> <new limit>") == false) exit;

// Check if new limit given is actually a number
if (!string_is_real(arg[2]))
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[2] + COL_RED + " is not a valid number");
    break;
}

var class, newLimit;
class = string_lower(arg[1]);
newLimit = real(arg[2])

if (real_is_int(newLimit))
{
    // Limit classlimits to valid values
    newLimit = min(255, max(0, newLimit))
    
    switch(class)
    {
    case "scout":
    case "runner":
    case "1":
        class = CLASS_SCOUT;
        break;
    case "pyro":
    case "firebug":
    case "2":
        class = CLASS_PYRO;
        break;
    case "soldier":
    case "rocketman":
    case "3":
        class = CLASS_SOLDIER;
        break;
    case "heavy":
    case "overweight":
    case "4":
        class = CLASS_HEAVY;
        break;
    case "demoman":
    case "detonator":
    case "demo":
    case "deto":
    case "5":
        class = CLASS_DEMOMAN;
        break;
    case "medic":
    case "healer":
    case "6":
        class = CLASS_MEDIC;
        break;
    case "engineer":
    case "constructor":
    case "engie":
    case "7":
        class = CLASS_ENGINEER;
        break;
    case "spy":
    case "infiltrator":
    case "8":
        class = CLASS_SPY;
        break;
    case "sniper":
    case "rifleman":
    case "9":
        class = CLASS_SNIPER;
        break;
    case "quote":
    case "curly":
    case "querly":
    case "qc":
    case "q/c":
    case "q":
        class = CLASS_QUOTE;
        break;
    case "all":
        for (i=0; i<10; i+=1)
        {
            global.classlimits[i] = newLimit;
        }
        console_print(COL_YELLOW + "All" + COL_ORANGE + " classlimits changed to: " + COL_YELLOW + string(newLimit));
        exit;
    default:
        console_print(COL_RED + "[ERROR] " + COL_YELLOW + class + COL_RED + " is not a valid class");
        exit;
    }
    
    global.classlimits[class] = newLimit;
    console_print(COL_YELLOW + classname(class) + COL_ORANGE + " classlimit changed to: " + COL_YELLOW + string(newLimit));
}
else
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[2] + COL_RED + " is not a valid classlimit number");
}
', '
console_print(COL_ORANGE + "Syntax: classlimit <class> <new limit>");
console_print(COL_ORANGE + "Changes the classlimit for the given class");
console_print(COL_ORANGE + SINGLE_QUOTE + "All" + SINGLE_QUOTE + " changes all classlimits at once");
', CC_HOST_RCON);
