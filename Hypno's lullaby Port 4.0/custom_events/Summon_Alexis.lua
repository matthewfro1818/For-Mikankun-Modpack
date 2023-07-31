local AlexisColor=''
local OppColor=''
function onEvent(tag,v1,v2)
if tag=='Summon_Alexis' then
    callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{125, -150})
    runHaxeCode([[game.iconP1.changeIcon(getVar("Alexis").healthIcon);]])


    setHealthBarColors(OppColor,AlexisColor)
    doTweenAlpha('boyfriend','Alexis', 1,2,'quadOut')
    setHealth(1)
    
end
end
function onSongStart()
    AlexisColor=getColorFromRGB(getProperty('Alexis.healthColorArray[0]'),getProperty('Alexis.healthColorArray[1]'),getProperty('Alexis.healthColorArray[2]'),false)
    OppColor=getColorFromRGB(getProperty('dad.healthColorArray[0]'),getProperty('dad.healthColorArray[1]'),getProperty('dad.healthColorArray[2]'),false)
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end