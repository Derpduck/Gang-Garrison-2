// Was used to remove unwanted color codes from strings when being printed to chat/console

//argument0 = string to filter for color codes
filterString=argument0
result=string_replace_all(filterString, "/:/", "/;/");

return result;
