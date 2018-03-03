{
    if global.botMode == 3 and !argument0.isBot// Mixed VS Mixed: Fill Server
    {
        // Create a bot to replace the leaving player.
        create_bot(get_bot_team(), get_bot_class());
    }

    with(argument0) {
        instance_destroy();
    }
    
    ds_list_delete(global.players, ds_list_find_index(global.players, argument0));
}
