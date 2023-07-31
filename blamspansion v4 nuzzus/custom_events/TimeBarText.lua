function onEvent(name,value1,value2)
	
		StartStop = tonumber(value1)
		local var string = (value2)

	if name == 'TimeBarText' and StartStop == 1 then
	
	makeLuaText('words', 'TextName', 1000, 130, 18)
	setTextAlignment('words', 'center')
	setTextString('words',  '' .. string)
	setTextSize('words', 35)
	setObjectCamera('words', 'hud')
	addLuaText('words')
	setProperty('timeTxt.visible', false)
	
	end

	if name == 'TimeBarText' and StartStop == 1 and downscroll then
	
	makeLuaText('words', 'TextName', 1000, 130, 673)
	setTextAlignment('words', 'center')
	setTextString('words',  '' .. string)
	setTextSize('words', 35)
	setObjectCamera('words', 'hud')
	addLuaText('words')
	setProperty('timeTxt.visible', false)
	
	end
	
	if name == 'TimeBarText' and StartStop == 2 then

	removeLuaText('words', true)
	setProperty('timeTxt.visible',true)
	
	end
end

