//argument0 = string to filter for color codes
filterString=argument0
result=string_replace_all(filterString, "/:/", "/;/");

return result;
