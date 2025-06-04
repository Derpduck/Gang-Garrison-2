var settingSection, settingName, newDefaultValue, question, currentSetting;
settingSection = argument0;
settingName = argument1;
newDefaultValue = argument2;
question = argument3;
currentSetting = ini_read_real(settingSection, settingName, newDefaultValue);

if (ini_read_real("Ini-Notifications", settingSection + " - " + settingName, 1) == 0 and currentSetting != newDefaultValue)
{
    if (show_question(question
                      + "#Do you wish to reset this setting to the new default?"
                      + "#Current Setting: " + string(currentSetting) + ", New Value: " + string(newDefaultValue)))
    {
        ini_write_real(settingSection, settingName, newDefaultValue);
    }
}
ini_write_real("Ini-Notifications", settingSection + " - " + settingName, 1);
