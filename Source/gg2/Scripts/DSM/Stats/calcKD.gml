var kdTotal, kills, deaths, colon;
kills=global.statsKills
deaths=global.statsDeaths
kdTotal=kills+deaths
colon=':'

global.kdRatioK=string_copy((kdTotal/deaths),0,3)
global.kdRatioD=string_copy((kdTotal/kills),0,3)

global.kdRatioString=global.kdRatioK+colon+global.kdRatioD
//For some reason this only displays the colon
