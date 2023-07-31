-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'card-TT' then
		makeLuaSprite('credit', 'songlogo/Triple Trouble', -6000, 30)
		setObjectCamera('credit', 'hud');
		addLuaSprite('credit', true)
		
		doTweenX('scrollIn', 'credit', 100, 0.7, 'circOut')
		runTimer('scrolled', 2)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'scrolled' then
		doTweenX('scrollOut', 'credit', 6000, 0.7, 'circIn')
	end
end

function onTweenCompleted(tag)
	if tag == 'scrollOut' then
		removeLuaSprite('credit')
	end
end