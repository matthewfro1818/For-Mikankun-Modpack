local allowCountdown = false

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		runTimer('bruj', 1, 1)
		cameraSetTarget('dad')
		function onTimerCompleted(bruj)
			SlopgerIntro()
		end
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function SlopgerIntro()
	playSound('NoobBurp', 1,'wowburpo')
	characterPlayAnim('dad', 'burp', true)
	runTimer('woahsewreg', 2.5, 1)
	function onTimerCompleted(woahsewreg)
		startCountdown()
	end
	--setProperty('inCutscene', true)
end