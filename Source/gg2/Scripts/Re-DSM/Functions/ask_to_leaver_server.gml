if (show_question("Do you really want to leave this match?"))
{
    if (global.serverPluginsInUse)
    {
        pluginscleanup(true);
        return true; // TODO: Update if plugins cleanup is changed to not force restarts
    }
    else
    {
        return true;
    }
}
else
{
    return false;
}
