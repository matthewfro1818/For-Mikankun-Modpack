function onEvent(name, value1, value2)
if name == 'one' then
	makeLuaSprite('one','stages/exe/majin/one',250,90);
	addLuaSprite('one',true);
	setScrollFactor('one',0,0);
	runTimer('disar',0.3,1);	
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'disar' then
		doTweenAlpha('one','one',0,0.5,'linear')
end
end