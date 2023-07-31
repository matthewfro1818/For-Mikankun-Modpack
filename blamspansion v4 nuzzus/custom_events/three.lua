function onEvent(name, value1, value2)
if name == 'three' then
	makeLuaSprite('three','stages/exe/majin/three',250,90);
	addLuaSprite('three',true);
	setScrollFactor('three',0,0);
	runTimer('disar',0.3,1);	
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'disar' then
		doTweenAlpha('three','three',0,0.5,'linear')
end
end