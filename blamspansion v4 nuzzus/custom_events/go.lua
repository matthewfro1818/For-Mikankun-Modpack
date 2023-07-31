function onEvent(name, value1, value2)
if name == 'go' then
	makeLuaSprite('go','stages/exe/majin/go',250,90);
	addLuaSprite('go',true);
	setScrollFactor('go',0,0);
	runTimer('disar',0.3,1);	
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'disar' then
		doTweenAlpha('go','go',0,0.5,'linear')
	end
end