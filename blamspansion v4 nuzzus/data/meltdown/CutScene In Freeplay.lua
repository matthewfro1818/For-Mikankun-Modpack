local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene then --Block the first countdown
		startVideo('polus3');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end