console_add_command('colcodes', '
console_print(COL_WHITE + "################ COL_WHITE");
console_print(COL_BLACK + "################ COL_BLACK");
console_print(COL_GRAY + "################ COL_GRAY");
console_print(COL_RED + "################ COL_RED");
console_print(COL_RED_LT + "################ COL_RED_LT");
console_print(COL_RED_DK + "################ COL_RED_DK");
console_print(COL_ORANGE + "################ COL_ORANGE");
console_print(COL_YELLOW + "################ COL_YELLOW");
console_print(COL_GOLD + "################ COL_GOLD");
console_print(COL_GREEN + "################ COL_GREEN");
console_print(COL_GREEN_LT + "################ COL_GREEN_LT");
console_print(COL_GREEN_DK + "################ COL_GREEN_DK");
console_print(COL_CYAN + "################ COL_CYAN");
console_print(COL_TEAL + "################ COL_TEAL");
console_print(COL_BLUE + "################ COL_BLUE");
console_print(COL_BLUE_LT + "################ COL_BLUE_LT");
console_print(COL_BLUE_DK + "################ COL_BLUE_DK");
console_print(COL_PINK + "################ COL_PINK");
console_print(COL_PINK_LT + "################ COL_PINK_LT");
console_print(COL_PINK_DK + "################ COL_PINK_DK");
console_print(COL_PURPLE + "################ COL_PURPLE");
console_print(COL_PURPLE_LT + "################ COL_PURPLE_LT");
', '
console_print(COL_ORANGE + "Syntax: colcodes");
console_print(COL_ORANGE + "Prints all color codes");
', console_init_access_level('colcodes', CC_CLIENT));
