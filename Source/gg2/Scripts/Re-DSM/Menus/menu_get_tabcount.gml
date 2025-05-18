// Returns the number of tabs that should actually be drawn by a menu
// This is different from tabs because we programmatically add the back button.

if(menu_text_back == "" or tabs == 0)
    return tabs;
else
    return tabs + 1;
