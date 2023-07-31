function onEvent(name, value1, value2)
if name == 'two' then
	makeLuaSprite('two','stages/exe/majin/two',250,90);
	addLuaSprite('two',true);
	setScrollFactor('two',0,0);
	runTimer('disar',0.3,1);	
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'disar' then
		doTweenAlpha('two','two',0,0.5,'linear')
end
end