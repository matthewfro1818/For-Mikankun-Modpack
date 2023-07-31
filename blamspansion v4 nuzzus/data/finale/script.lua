
function onSongStart()
	noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)
end

function onStepHit()
	if curStep == 64 then
		makeLuaSprite('flashback', 'finale/MOOGU_bg', 0, 150); 
		screenCenter('flashback', 'x');
		scaleObject('flashback', 1.25, 1.25); 
		setProperty('flashback.alpha',0.5)
		addLuaSprite('flashback',true)

	end
	if curStep == 80 then
		makeLuaSprite('flashback', 'finale/TOOGU_bg', 0, 150);
		screenCenter('flashback', 'x');
		scaleObject('flashback', 1.25, 1.25); 
		setProperty('flashback.alpha',0.5)
		addLuaSprite('flashback',true)

	end
	if curStep == 95 then
		makeLuaSprite('flashback', 'finale/DLOW_bg', 0, 150); 
		screenCenter('flashback', 'x');
		scaleObject('flashback', 1.25, 1.25); 
		setProperty('flashback.alpha',0.5)
		addLuaSprite('flashback',true)
	end
	if curStep == 112 then
		cameraFlash('camGame', 'ffffff', 3.6)
	end
	if curStep == 128 then
		removeLuaSprite('flashback')
	end
	if curStep == 1983 then
		cameraFlash('camGame', 'ff0c82', 6)
		cameraFade('camGame', '000000', 0.1)
	end
end