//TODO: Add various flags and choose one randomly to print
console_add_command('flag', '
switch(irandom(8))
{
case 0: // Trans
    console_print(COL_FLAG + "5BCEFA################################")
    console_print(COL_FLAG + "5BCEFA################################")
    console_print(COL_FLAG + "F5A9B8################################")
    console_print(COL_FLAG + "F5A9B8################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "F5A9B8################################")
    console_print(COL_FLAG + "F5A9B8################################")
    console_print(COL_FLAG + "5BCEFA################################")
    console_print(COL_FLAG + "5BCEFA################################")
    break;
case 1: // Non-binary
    console_print(COL_FLAG + "FCF434################################")
    console_print(COL_FLAG + "FCF434################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "9C59D1################################")
    console_print(COL_FLAG + "9C59D1################################")
    console_print(COL_FLAG + "2C2C2C################################")
    console_print(COL_FLAG + "2C2C2C################################")
    break;
case 2: // Lesbian
    console_print(COL_FLAG + "D62900################################")
    console_print(COL_FLAG + "D62900################################")
    console_print(COL_FLAG + "FF9B55################################")
    console_print(COL_FLAG + "FF9B55################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "D461A6################################")
    console_print(COL_FLAG + "D461A6################################")
    console_print(COL_FLAG + "A50062################################")
    console_print(COL_FLAG + "A50062################################")
    break;
case 3: // Gay
    console_print(COL_FLAG + "078D70################################")
    console_print(COL_FLAG + "26CEAA################################")
    console_print(COL_FLAG + "98E8C1################################")
    console_print(COL_FLAG + "FFFFFF################################")
    console_print(COL_FLAG + "7BADE2################################")
    console_print(COL_FLAG + "5049CC################################")
    console_print(COL_FLAG + "3D1A78################################")
    break;
case 4: // Bi
    console_print(COL_FLAG + "D60270################################")
    console_print(COL_FLAG + "D60270################################")
    console_print(COL_FLAG + "D60270################################")
    console_print(COL_FLAG + "D60270################################")
    console_print(COL_FLAG + "9B4F96################################")
    console_print(COL_FLAG + "9B4F96################################")
    console_print(COL_FLAG + "0038A8################################")
    console_print(COL_FLAG + "0038A8################################")
    console_print(COL_FLAG + "0038A8################################")
    console_print(COL_FLAG + "0038A8################################")
    break;
case 5: // Pan
    console_print(COL_FLAG + "FF1B8D################################")
    console_print(COL_FLAG + "FF1B8D################################")
    console_print(COL_FLAG + "FF1B8D################################")
    console_print(COL_FLAG + "FFDA00################################")
    console_print(COL_FLAG + "FFDA00################################")
    console_print(COL_FLAG + "FFDA00################################")
    console_print(COL_FLAG + "1BB3FF################################")
    console_print(COL_FLAG + "1BB3FF################################")
    console_print(COL_FLAG + "1BB3FF################################")
    break;
case 6: // Rainbow
    console_print(COL_FLAG + "E40303################################")
    console_print(COL_FLAG + "FF8C00################################")
    console_print(COL_FLAG + "FFED00################################")
    console_print(COL_FLAG + "008026################################")
    console_print(COL_FLAG + "004CFF################################")
    console_print(COL_FLAG + "732982################################")
    break;
case 7: // France
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    console_print(COL_FLAG + "000091###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "E1000F###########")
    break;
case 8: // Ireland
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    console_print(COL_FLAG + "009A44###########" + COL_FLAG + "FFFFFF###########" + COL_FLAG + "FF8200###########")
    break;
}
', '
console_print(COL_ORANGE + "Syntax: flag");
console_print(COL_ORANGE + "Prints a random flag");
', console_init_access_level('flag', CC_CLIENT));
