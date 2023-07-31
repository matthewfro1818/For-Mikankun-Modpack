function onCreate()
    makeLuaSprite('FogA', 'fog', -1000, -1000);
	setObjectOrder('FogA', 30)
    makeGraphic('FogA', 15, 1, 'F0E9FB')
	setGraphicSize('FogA', screenWidth*5, screenHeight*5);
    addLuaSprite('FogA',true)

end
function onEvent(tag,v1,v2)
if tag=='HideFog'then
    doTweenAlpha('Fag', 'FogA', 0, 5, 'quadIn')
end
end
