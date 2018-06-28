//Bots
var botNum;
botNum=0

if frame == 0{
    switch global.botMode{
        case 0:
            //Mixed VS Mixed; fixed number of bots
            if global.totalBots<global.botNumber{
                botNum=global.botNumber-global.totalBots
            }
            break;
            
        case 1:
            global.botChosenTeam = choose(TEAM_RED, TEAM_BLUE);
            for (a=0; a<global.botNumber; a+=1){
                create_bot(get_bot_team(), get_bot_class());
            }
            break;
            
        case 2:
            global.botChosenTeam = choose(TEAM_RED, TEAM_BLUE);
            break;
            
        case 3:
            while ds_list_size(global.players) < global.playerLimit{
                create_bot(get_bot_team(), get_bot_class());
            }
            break;
    }
}

if global.botMode==0{
    if botNum>0{
        repeat(botNum){
        if(global.run_virtual_ticks){
            create_bot(get_bot_team(), get_bot_class());
            botNum-=1
        }
        }
    }
}

move_all_bullets();
move_all_gore();

if(serverbalance != 0)
    balancecounter += 1;

// Register with Lobby Server every 30 seconds
if((frame mod 900) == 0 and global.run_virtual_ticks)
    sendLobbyRegistration();
    
if(global.run_virtual_ticks)
    frame += 1;

//Bots
//User wants a bot
if global.userCreatedBot[0]{
//    create_bot(get_bot_team(), get_bot_class());// then create one
}

while global.totalBots>global.botNumber{
    with Player{
        if isBot{
            remove_bot(botSocket)
        }
    }
}

// Service all players
var i;
for(i=0; i < ds_list_size(global.players); i+=1)
{
    var player;
    player = ds_list_find_value(global.players, i);
    
    //Bots
    //if global.totalBots>global.botNumber{
    //    if player.isBot{
    //        remove_bot(player.botSocket)
    //    }
    //}
    
    if player.isBot{
        if global.botMode==0{
            if calculate_bot_balance()==TEAM_RED{
                if player.team==TEAM_RED{
                    //player.team=TEAM_BLUE
                    //write_ubyte(player.socket, PLAYER_CHANGETEAM)
                    //write_ubyte(player.socket, TEAM_BLUE)
                }
            }else if calculate_bot_balance()==TEAM_BLUE{
                if player.team==TEAM_BLUE{
                    //player.team=TEAM_RED
                    //write_ubyte(player.socket, PLAYER_CHANGETEAM)
                    //write_ubyte(player.socket, TEAM_RED)
                }
            }
        }

        if player.object != -1{
            with(player){
                get_bot_input()
                with object{
                    event_user(1)
                }
            }
        }
    }
    
    if(socket_has_error(player.socket) or player.kicked or player.banned){
        //Get disconnect reason
        var dcMessage, dcColour;
        dcColour=C_ORNGE
        
        if player.dcReason==DC_REASON_USER{
            dcMessage="Disconnected by user"
        }else if player.dcReason==DC_REASON_LOBBY{
            dcMessage="Disconnected via lobby"
        }else if player.dcReason==KICK_ADMIN_KICK{
            dcMessage="Kicked by admin"
        }else if player.dcReason==KICK_BANNED{
            dcMessage="Banned by admin"
            dcColour=P_RED
        }else if player.dcReason==KICK_TEMP_BANNED{
            dcMessage="Temporarily banned by admin"
            dcColour=P_RED
        }else{ //Assume player crashed/timed out, should be the only other way for them to leave that isn't checked
            dcMessage="User timed out"
        }
        color=getPlayerColor(player, true)
        chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+" has left - "+dcColour+dcMessage+".",global.printLeaves)
        
        ds_list_delete(global.chatBanList,player)
        
        removePlayer(player);
        ServerPlayerLeave(i, global.sendBuffer);
        ServerBalanceTeams();
        i -= 1;
    }else{
        processClientCommands(player, i);
    }
}

if(syncTimer == 1 || ((frame mod 3600)==0) || global.setupTimer == 180 and global.run_virtual_ticks)
{
    serializeState(CAPS_UPDATE, global.sendBuffer);
    syncTimer = 0;
}

if(global.run_virtual_ticks)
{
    if((frame mod 7) == 0)
        serializeState(QUICK_UPDATE, global.sendBuffer);
    else
        serializeState(INPUTSTATE, global.sendBuffer);
}



if(impendingMapChange > 0 and global.run_virtual_ticks)
    impendingMapChange -= 1; // countdown until a map change

if(global.winners != -1 and !global.mapchanging){
    if global.adcpStopwatch==1 and global.currentStopwatchRound==2{
        //same number of caps
        if global.adcpRound1Caps==global.adcpRound2Caps{
            //lower time=better score (less time spent on the map, won faster)
            if global.adcpRound1CapTimestamp>global.adcpRound2CapTimestamp{
                global.adcpWinner="Team A"
            }else if global.adcpRound1CapTimestamp<global.adcpRound2CapTimestamp{
                global.adcpWinner="Team B"
            }else{
                global.adcpWinner="Draw"
            }
        }else if global.adcpRound1Caps>global.adcpRound2Caps{
            //team 1 got more caps
            global.adcpWinner="Team A"
        }else if global.adcpRound1Caps<global.adcpRound2Caps{
            //team 2 got more caps
            global.adcpWinner="Team B"
        }
        
        var winCol,winningTeam,msg1,msg2,msg3,timeStr1,timeStr2;
        if global.adcpWinner=="Team A"{
            winCol=P_BLUE
            winningTeam="(BLUE Team)"
        }else if global.adcpWinner=="Team B"{
            winCol=P_RED
            winningTeam="(RED Team)"
        }else{
            winCol=C_GREEN
            winningTeam="(DRAW)"
        }
        
        //Round 1 time stamp
        var time1,minutes1,secondcounter1,seconds1,secstring1,time2,minutes2,secondcounter2,seconds2,secstring2;
        
        secondcounter1 = ceil(global.adcpRound1CapTimestamp/30);
        minutes1 = secondcounter1 div 60;
        seconds1 = secondcounter1 mod 60;
        
        if (seconds1>=10){
            secstring1=max(0,seconds1)
        }else{
            secstring1="0"+string(max(0,seconds1))
        }
        timeStr1=string(max(0,minutes1))+":"+string(secstring1)
        
        //Round 2 timestamp
        secondcounter2 = ceil(global.adcpRound2CapTimestamp/30);
        minutes2 = secondcounter2 div 60;
        seconds2 = secondcounter2 mod 60;
        
        if (seconds2>=10){
            secstring2=max(0,seconds2)
        }else{
            secstring2="0"+string(max(0,seconds2))
        }
        timeStr2=string(max(0,minutes2))+":"+string(secstring2)
        
        //Chat messages
        msg1=global.chatPrintPrefix+C_GREEN+"ADCP Stopwatch: "+winCol+string(global.adcpWinner)+" "+winningTeam+C_WHITE+" wins!"
        msg2=global.chatPrintPrefix+C_GREEN+"Time: "+P_RED+timeStr2+C_WHITE+" : "+P_BLUE+timeStr1
        msg3=global.chatPrintPrefix+C_GREEN+"Caps: "+P_RED+string(global.adcpRound1Caps)+C_WHITE+" : "+P_BLUE+string(global.adcpRound2Caps)
        
        write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
        write_ushort(global.publicChatBuffer, string_length(msg1))
        write_string(global.publicChatBuffer, msg1)
        write_byte(global.publicChatBuffer,-1)
        print_to_chat(msg1);// For the host
        
        write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
        write_ushort(global.publicChatBuffer, string_length(msg2))
        write_string(global.publicChatBuffer, msg2)
        write_byte(global.publicChatBuffer,-1)
        print_to_chat(msg2);// For the host
        
        write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
        write_ushort(global.publicChatBuffer, string_length(msg3))
        write_string(global.publicChatBuffer, msg3)
        write_byte(global.publicChatBuffer,-1)
        print_to_chat(msg3);// For the host
    }
    
    if global.adcpStopwatch==1 and global.currentStopwatchRound!=0{
        if global.adcpRound1CapTimestamp==-1 and global.currentStopwatchRound==1{
            global.adcpRound1CapTimestamp=ControlPointHUD.timer
        }
        if global.adcpRound2CapTimestamp==-1 and global.currentStopwatchRound==2{
            global.adcpRound2CapTimestamp=ControlPointHUD.timer
        }
    }

    if(global.winners == TEAM_RED and global.currentMapArea < global.totalMapAreas){
        if !(global.adcpStopwatch==1 and global.currentStopwatchRound==1){
            global.currentMapArea += 1;
        }
        global.nextMap = global.currentMap;
    }else{
        global.currentMapArea = 1;
        if global.consoleMapChange==0{
            if (global.adcpStopwatch==1 and global.currentStopwatchRound==1){
                global.nextMap = global.currentMap;
            }else{
                global.nextMap = nextMapInRotation();
            }
        }
    }
    
    global.mapchanging = true;
    impendingMapChange = 300; // in 300 ticks (ten seconds), we'll do a map change
    
    if !(global.adcpStopwatch==1 and global.currentStopwatchRound==1){
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+"Next map: "+C_GREEN+global.nextMap+C_WHITE+".",global.printMap)
    }
    
    write_ubyte(global.sendBuffer, MAP_END);
    write_ubyte(global.sendBuffer, string_length(global.nextMap));
    write_string(global.sendBuffer, global.nextMap);
    write_ubyte(global.sendBuffer, global.winners);
    write_ubyte(global.sendBuffer, global.currentMapArea);
    
    if(!instance_exists(ScoreTableController))
        instance_create(0,0,ScoreTableController);
    instance_create(0,0,WinBanner);
    
    if global.pugMode==1{
        if instance_exists(PugController){
            if PugController.stage>=5{
                if !(global.adcpStopwatch==1 and global.currentStopwatchRound==1){
                    if global.winners==0{
                        PugController.redScore+=1
                    }else if global.winners==1{
                        PugController.blueScore+=1
                    }else{
                        PugController.drawScore+=1
                    }
                    PugController.gamesPlayed+=1
                    
                    with(PugController){
                        event_user(6)
                    }
                }
            }
        }
    }
}

//VIP password
if global.isHost{
    if global.vipThreshold!=0{
        if ds_list_size(global.players)>global.vipThreshold{
            if global.serverPassword=""{
                global.serverPassword=global.vipPassword
            }
        }else{
        if global.serverPassword==global.vipPassword{
            global.serverPassword=""
        }
    }
    }
}

// if map change timer hits 0, do a map change
if(impendingMapChange == 0){
    global.mapchanging = false;
    if (global.adcpStopwatch==1 and global.currentStopwatchRound==2){
        global.currentStopwatchRound=0
        global.adcpWinner=""
        global.myAdcpTeam=""
    }
    if !(global.adcpStopwatch==1 and global.currentStopwatchRound==1){
        serverGotoMap(global.nextMap);
        ServerChangeMap(global.currentMap, global.currentMapMD5, global.sendBuffer);
    }
    impendingMapChange = -1;
    global.consoleMapChange=0
    
    global.jumpMode=0
    if global.jumpMapMode==1{
        global.jumpMode=1
    }else if global.jumpMapMode==2{
        prefixIndex[0]="rj"
        prefixIndex[1]="dj"
        prefixIndex[2]="rr"
        prefixIndex[3]="sj"
        prefixIndex[4]="ej"
        prefixIndex[5]="qr"
        prefixIndex[6]="pj"
        prefixIndex[7]="jt"
        prefixIndex[8]="surf"
        prefixIndex[9]="jump"
        for (i=0; i<10; i+=1){
            if string_pos(prefixIndex[i],string_lower(global.nextMap))==1{
                global.jumpMode=1
            }
        }
    }
    
    with(ReadyUpController){
        event_user(1)
    }
    
    if !(global.adcpStopwatch==1 and global.currentStopwatchRound==1){
        with(Player){
            if(global.currentMapArea == 1){
                stats[KILLS] = 0;
                stats[DEATHS] = 0;
                stats[CAPS] = 0;
                stats[ASSISTS] = 0;
                stats[DESTRUCTION] = 0;
                stats[STABS] = 0;
                stats[HEALING] = 0;
                stats[DEFENSES] = 0;
                stats[INVULNS] = 0;
                stats[BONUS] = 0;
                stats[DOMINATIONS] = 0;
                stats[REVENGE] = 0;
                stats[POINTS] = 0;
                stats[DAMAGE] = 0;
                roundStats[KILLS] = 0;
                roundStats[DEATHS] = 0;
                roundStats[CAPS] = 0;
                roundStats[ASSISTS] = 0;
                roundStats[DESTRUCTION] = 0;
                roundStats[STABS] = 0;
                roundStats[HEALING] = 0;
                roundStats[DEFENSES] = 0;
                roundStats[INVULNS] = 0;
                roundStats[BONUS] = 0;
                roundStats[DOMINATIONS] = 0;
                roundStats[REVENGE] = 0;
                roundStats[POINTS] = 0;
                roundStats[DAMAGE] = 0;
                team = TEAM_SPECTATOR;
            }
            timesChangedCapLimit = 0;
            alarm[5] = 1;
        }
    }
    
    if (global.adcpStopwatch==1 and global.currentStopwatchRound==1){
        if global.adcpWinner==""{
            sendEventMapReset()
            doEventMapReset()
        }
    }
    // message lobby to update map name
    sendLobbyRegistration();
}

var i;
for(i=1; i<ds_list_size(global.players); i+=1){
    var player;
    player = ds_list_find_value(global.players, i);
    
    //Bots
    if player.isBot{
        continue;
    }
    
    write_buffer(player.socket, global.sendBuffer);
    write_buffer(player.socket, global.publicChatBuffer);
    
    if player.team == TEAM_RED{
        write_buffer(player.socket, global.privChatRedBuffer);
    }else if player.team == TEAM_BLUE{
        write_buffer(player.socket, global.privChatBlueBuffer);
    }else if player.team == TEAM_SPECTATOR and global.specReadChat==1{
        write_buffer(player.socket, global.privChatRedBuffer);
        write_buffer(player.socket, global.privChatBlueBuffer);
        write_buffer(player.socket, global.privChatSpecBuffer);
    }else{
        write_buffer(player.socket, global.privChatSpecBuffer);
    }
}
buffer_clear(global.sendBuffer);
buffer_clear(global.privChatRedBuffer);
buffer_clear(global.privChatBlueBuffer);
buffer_clear(global.privChatSpecBuffer);
buffer_clear(global.publicChatBuffer);
