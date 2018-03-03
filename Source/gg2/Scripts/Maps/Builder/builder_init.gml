global.entities = ds_list_create();
global.entityData = ds_list_create();
global.properties = ds_map_create();
global.gamemodes = ds_list_create();
global.buttons = ds_list_create();
global.resources = ds_map_create();

global.placeEntityFunction = "";
global.metadataFunction = "";

// Add buttons
addButton("Load map", '
    var map;
    map = get_open_filename("PNG|*.png","");
    if (map == "") break;
    
    with(LevelEntity) instance_destroy();
    unloadResources();
    ds_map_clear(Builder.metadata);
    ds_map_add(Builder.metadata, "type", "meta");
    ds_map_add(Builder.metadata, "background", "ffffff");
    
    CustomMapInit(map)
    Builder.mapBG = map;  
    Builder.mapWM = " ";
    Builder.wmString = compressWalkmask();
    loadMetadata(Builder.metadata, true);
');
addButton("Load BG", '
    var bg;
    bg = get_open_filename("PNG|*.png","");
    if(bg == "") break;
    Builder.mapBG = bg;
    background_replace(BuilderBGB, bg, false, false);
    background_xscale[7] = 6;
    background_yscale[7] = 6;
'); 
addButton("Load WM", '
    var wm;
    wm = get_open_filename("Walkmask Image (PNG or BMP)|*.png; *.bmp","");
    if(wm == "") break;
    Builder.mapWM = wm;
    background_replace(BuilderWMB, wm, true, false);
    Builder.wmString = compressWalkmask();
'); 
addButton("Show BG", 'background_visible[7] = argument0;', 1, 1); 
addButton("Show WM", 'Builder.showWM = argument0;', 1); 
addButton("Show grid", 'Builder.showGrid = argument0;', 1);
addButton("Show FG",'ParallaxController.visible = argument0;', 1, 1); 
addButton("Save & test", '
    if (Builder.mapWM == "") show_message("Select a walkmask first.");
    else if (Builder.mapBG == "") show_message("Select a background first");
    else if (validateMap(log2(gamemode))) {    
        var leveldata;
        leveldata = compressEntities() + chr(10) + Builder.wmString;
        GG2DLL_embed_PNG_leveldata(Builder.mapBG, leveldata);
        
        // Place a copy in the maps folder
        if (file_exists("Maps\ggb2_tmp_map.png")) file_delete("Maps\ggb2_tmp_map.png");
        file_copy(Builder.mapBG, "Maps\ggb2_tmp_map.png");
        
        switch(show_message_ext("Compilation completed. The map is saved to " + string(Builder.mapBG) + ".", "Ok", "Test separately", "Test here")) {
            case 2:             
                startGG2("-map ggb2_tmp_map");
            break;       
            case 3:
                Builder.selected = -1;
                Builder.visible = false;
                global.launchMap = "ggb2_tmp_map";
                global.isHost = true;
                global.gameServer = instance_create(0,0,GameServer); 
            break; 
        }
    }
'); 
addButton("Test w/o save", '
    if (Builder.mapWM == "") show_message("Select a walkmask first.");
    else if (Builder.mapBG == "") show_message("Select a background first");
    else if (validateMap(log2(gamemode))) {
        // Save to a temporary file
        if (file_exists("Maps\ggb2_tmp_map.png")) file_delete("Maps\ggb2_tmp_map.png");
        file_copy(Builder.mapBG, "Maps\ggb2_tmp_map.png");
        
        var leveldata;
        leveldata = compressEntities() + chr(10) + Builder.wmString;
        GG2DLL_embed_PNG_leveldata("Maps/ggb2_tmp_map.png", leveldata);               
        
        switch(show_message_ext("Where do you want to playtest?", "Test separately", "Test here", "Cancel")) {
            case 1:             
                startGG2("-map ggb2_tmp_map");
            break;       
            case 2:
                Builder.selected = -1;
                Builder.visible = false;
                global.launchMap = "ggb2_tmp_map";
                global.isHost = true;
                global.gameServer = instance_create(0,0,GameServer); 
            break; 
        }          
    }
');
addButton("Symmetry mode", '
    Builder.symmetry = argument0;
    return argument0;
', 1); 
addButton("Scale mode", '
    Builder.scale = argument0;
    return argument0;
', 1, 1);
addButton("Fast scrolling",'
    Builder.moveSpeed = 32 + 32*argument0;
    return argument0;
', 1);
addButton("Edit metadata", '
    showPropertyMenu(Builder.metadata, Builder.metadata, true);
    loadMetadata(Builder.metadata, true);   // Reload
');
addButton("Add resource", '
    var prop;
    prop = get_string("Resource name:", "");
    if (prop != "")
    {
        resource = get_open_filename("Resource (PNG, GIF)|*.png;*.gif;","");
        if (resource == "")
            break;
        ds_map_add(Builder.metadata, prop, resourceToString(resource));
        loadMetadata(Builder.metadata, true);
    }
');

addButton("Get resources", '
    if (Builder.mapBG == "")
        show_message("Load a map first");
    else
    {
        if (!directory_exists(working_directory + "/Maps/Decompiled"))
            directory_create(working_directory + "/Maps/Decompiled");
        
        // Walkmask
        if (file_exists(temp_directory+"\custommap_walkmask.png"))
            file_copy(temp_directory+"\custommap_walkmask.png", working_directory + "/Maps/Decompiled/walkmask.png");    
       
        // External sprites     
        var resource;
        for(resource=ds_map_find_first(Builder.metadata); is_string(resource); resource = ds_map_find_next(Builder.metadata, resource))
        {   
            var bg;
            if (string_copy(resource,1, 3) == "bg_")
                bg = true;
            else
                bg = false;
                
            stringToResource(ds_map_find_value(Builder.metadata, resource), bg, working_directory + "/Maps/Decompiled/" + resource);
        }  
        show_message("The map has been decompiled to " + working_directory + "/Maps/Decompiled/ .");
    }
');
addButton("Load entities", '
    unloadResources();
    ds_map_clear(Builder.metadata);
    loadEntities();
'); 
addButton("Save entities", 'saveEntities();');
addButton("Clear entities", '
    if (show_question("Are you sure you want to scrap your entities?")) {
        unloadResources();
        ds_map_clear(Builder.metadata);
        ds_map_add(Builder.metadata, "type", "meta");
        ds_map_add(Builder.metadata, "background", "ffffff");
        ds_map_add(Builder.metadata, "void", "000000");
        with (LevelEntity) instance_destroy();
    }
');

builder_init_ents()
