var i;

commandBytesInvalidCommand = -1; // No such command
commandBytesPrefixLength1 = -2; // The length of the command is indicated by the first byte
commandBytesPrefixLength2 = -3; // The length of the command is indicated by the first two bytes

for(i=0; i<256; i+=1) {
    // -1 indicates an invalid command byte
    commandBytes[i] = commandBytesInvalidCommand;
}

commandBytes[PLAYER_LEAVE] = 0;
commandBytes[PLAYER_CHANGECLASS] = 1;
commandBytes[PLAYER_CHANGETEAM] = 1;
commandBytes[CHAT_BUBBLE] = 1;
commandBytes[BUILD_SENTRY] = 0;
commandBytes[DESTROY_SENTRY] = 0;
commandBytes[DROP_INTEL] = 0;
commandBytes[OMNOMNOMNOM] = 0;
commandBytes[TOGGLE_ZOOM] = 0;
commandBytes[PLAYER_CHANGENAME] = commandBytesPrefixLength1;
commandBytes[INPUTSTATE] = 4//6//4;
commandBytes[REWARD_REQUEST] = commandBytesPrefixLength1;
commandBytes[REWARD_CHALLENGE_RESPONSE] = 16;
commandBytes[PLUGIN_PACKET] = commandBytesPrefixLength2;
commandBytes[CLIENT_SETTINGS] = 1;
commandBytes[RCON_LOGIN]=commandBytesPrefixLength1
commandBytes[RCON_COMMAND]=commandBytesPrefixLength1
commandBytes[CHAT_PUBLIC_MESSAGE]=commandBytesPrefixLength1
commandBytes[CHAT_PRIV_MESSAGE]=commandBytesPrefixLength1
commandBytes[RUP_READY]=0
commandBytes[RUP_UNREADY]=0
commandBytes[DC_REASON_USER]=0
commandBytes[PLAYER_PING]=2
commandBytes[MGE_CHANGE_ARENA]=1
commandBytes[PUG_CAPTAIN]=0
commandBytes[PUG_PICK]=1
commandBytes[PUG_MAP]=commandBytesPrefixLength1
