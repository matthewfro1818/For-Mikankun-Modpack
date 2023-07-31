function onEvent(name, value1, value2)
    if name == 'add animated sprite' and flashingLights == true then
		makeAnimatedLuaSprite(value2, value2, value1)
		addAnimationByPrefix(value2, value2, value2, 24, true)
		addLuaSprite(value2, false)
    end
end
