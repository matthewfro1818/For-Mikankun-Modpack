function onCreate()
    makeLuaSprite('FogA', 'fog', 0, 0);
	setObjectCamera('FogA', 'hud')
	setObjectOrder('FogA', 30)
    makeGraphic('FogA', 15, 1, 'F0E9FB')
	setGraphicSize('FogA', screenWidth, screenHeight);
    addLuaSprite('FogA',true)

end
function onEvent(tag,v1,v2)
if tag=='HideFog'then
    doTweenAlpha('Fag', 'FogA', 0, 5, 'quadIn')
end
end
