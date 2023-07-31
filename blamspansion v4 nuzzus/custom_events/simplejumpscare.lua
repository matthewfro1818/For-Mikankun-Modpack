function onEvent(name, value1, value2)
	if name == 'simplejumpscare' then
	makeLuaSprite('jump',value1,-100,-100);
	addLuaSprite('jump',true);
	setScrollFactor('jump',0,0);
	playSound('sppok',1);
	runTimer('disappear',0.2,1);
	scaleObject("jump",0.8,0.8)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'disappear' then
		removeLuaSprite('jump',true);
	end
end