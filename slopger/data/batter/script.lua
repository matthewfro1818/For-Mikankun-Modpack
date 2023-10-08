local allowCountdown = false

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		SlopgerIntro()
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function SlopgerIntro()
	setProperty('dad.visible', false)
	makeLuaSprite('summoning','summoning_text', -1280, 0)
	playSound('slopgerAppear', 1)
	addLuaSprite('summoning',true)
	doTweenX('summoningThing', 'summoning', 0, 3.25, 'quartOut')
	function onTweenCompleted(summoningThing)
		setProperty('dad.visible', true)
		doTweenX('wow', 'summoning', 1280, 3.25, 'quartIn')
		runTimer('woahsewreg', 2, 1)
		function onTimerCompleted(woahsewreg)
			startCountdown()
		end
	end
	setProperty('inCutscene', true)
end