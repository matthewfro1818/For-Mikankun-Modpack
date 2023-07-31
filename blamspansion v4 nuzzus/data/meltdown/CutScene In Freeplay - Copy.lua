local allowCountdown = false
function onEndSong()
	if not allowCountdown and not seenCutscene then --Block the first countdown
		startVideo('meltdown_afterscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end