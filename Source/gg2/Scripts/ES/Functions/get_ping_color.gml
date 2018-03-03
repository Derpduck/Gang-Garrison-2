//argument0 = ping
var pingNumber, pingcol;

if string(argument0)==string_letters(argument0){
    pingNumber=string(argument0)
    if pingNumber=="BOT" pingcol=c_gray
    return(pingcol)
    exit;
}else{
    pingNumber=real(argument0)
    
    pingcol=c_gray
    if pingNumber<240 pingcol=c_yellow
    if pingNumber<135 pingcol=c_green
    if pingNumber<75 pingcol=c_aqua
    if pingNumber>=240 pingcol=c_red
    if pingNumber==-1 pingcol=c_gray
    
    return(pingcol)
}
