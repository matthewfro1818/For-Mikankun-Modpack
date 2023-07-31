function onCreate()
	initSaveData('HypnosPref')
	setProperty('skipCountdown',true)
    addLuaScript('scripts/Stuff/PlayStuff.lua')
	
	makeAnimatedLuaSprite('GoldIcon','icons/Gold Health Icon',0,0)
	addAnimationByPrefix('GoldIcon','idle','Gold Icon',24,true)
	setObjectCamera('GoldIcon','hud')
	setProperty('GoldIcon.offset.x',-12)
	Started=false
	ImDeadFinish=false
	Open=true
	StopPause=false
end
function onSongStart()
	setProperty('dad.visible',true)
	CharPlayAnim('dad','fadeIn',true)
end
function onCreatePost()
	if getDataFromSave('HypnosPref','Hell mode',false) then
		CreatePendelum(false)
	end
	
	callScript('scripts/Stuff/CameraMove.lua','fpSong',{})
	addLuaSprite('GoldIcon',true)
	setProperty('iconP2.visible',false)
	setProperty('dad.visible',false)
	
end
local StarterPendelum=false
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not StarterPendelum and getDataFromSave('HypnosPref','Hell mode',false) then
		StartPendelum()
		StarterPendelum=true
	end
end
function onUpdate(elapsed)
	setProperty('camZooming',false)
    for i=0,3 do
        setPropertyFromGroup('opponentStrums',i,'alpha',0)
	end
	setProperty('GoldIcon.x',getProperty('iconP2.x'))
	setProperty('GoldIcon.y',getProperty('iconP2.y'))
	scaleObject('GoldIcon',0.8*getProperty('iconP2.scale.x'),0.8*getProperty('iconP2.scale.y'))
end
function onStartCountdown()
	initSaveData('ImportantData')
	if Started then
		if ImDeadFinish then
			return Function_Continue
		end
		playSound('ImDead'..getRandomInt(1,7),1)
		runTimer('ImDead',2)
		return Function_Stop
	else
		
		if not getDataFromSave('ImportantData','isFreeplay') then
            startVideo('monochrome_cutscene')
			Started=true
			return Function_Stop
		else
			return Function_Continue
		end
		
	end
end
function CharPlayAnim(Char,anim,force)
	playAnim(Char,anim,force)
	setProperty(Char..'.specialAnim',true)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='ImDead' then
		ImDeadFinish=true
		startCountdown()
	end
end
function onGameOver()
	setProperty('paused',true)
	runHaxeCode([[
		FlxG.sound.music.pause();
		game.vocals.pause();
		game.KillNotes();
	]])
	if Open then
		Open=false
	openCustomSubstate('GameOverMo',true)
	end
    return Function_Stop
end
function onCustomSubstateCreate(name)
    if name=='GameOverMo' then
		StopPause=true
		doTweenAlpha('GameOverMoHud','camHUD',0,5*(stepCrochet/1000),'linear')
		setProperty('persistentUpdate',true)
		CharPlayAnim('dad','fadeOut',true)
	end
end
function onCustomSubstateUpdate(name, elapsed)
    if name=='GameOverMo' then
        if getProperty('dad.animation.curAnim.finished') then
            setProperty('dad.visible',false)
		end
		if not getProperty('dad.visible') then
			if keyJustPressed('accept') then
				restartSong()
			end
			if keyJustPressed('back') then
				callScript('scripts/Stuff/PlayStuff.lua','toMenu')
			end
		end
	end
end
function onPause()
    if StopPause then
        return Function_Stop
	end
end