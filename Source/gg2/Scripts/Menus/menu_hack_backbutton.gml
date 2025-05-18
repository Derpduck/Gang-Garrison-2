// This is a bad hack and I should feel bad.
// Sets the item after the last item added by the menu_add* functions to the back button.

// If tabs exist, add back button to tabs
if (tabs > 0)
{
    tab_name[tabs] = menu_text_back;
    tab_script[tabs] = menu_script_back;
}
else
{
    item_type[items] = "script";
    item_name[items] = menu_text_back;
    item_script[items] = menu_script_back;
}
