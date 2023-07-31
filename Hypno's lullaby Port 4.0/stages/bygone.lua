local Path='stage/Bygone/'
function onCreate()
	for i=1,5 do
		precacheSound('Electric_miss'..i)
	end
	
	setProperty('skipCountdown',true)
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	addLuaScript('scripts/Stuff/Character.lua')

	local consistentPosition={x=-300,y=-300}
	callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{-100, 200})
	-- Clouds
	makeLuaSprite('BG1Clouds',Path..'BG1 Clouds',consistentPosition.x,consistentPosition.y);
	setScrollFactor('BG1Clouds', 0.6, 0.6);
	scaleObject('BG1Clouds',1.25,1.25)
	
	makeLuaSprite('BG2Clouds',Path..'BG2 Sky',consistentPosition.x,consistentPosition.y);
	setScrollFactor('BG2Clouds', 0.6, 0.6);
	setGraphicSize('BG2Clouds', getProperty('BG2Clouds.width')*1.25,getProperty('BG2Clouds.height'))
	setProperty('BG2Clouds.alpha',0)
--Moon
	makeLuaSprite('Moon',Path..'BG1 Moon',consistentPosition.x,consistentPosition.y);
	setScrollFactor('Moon', 0.7, 0.7);
	setGraphicSize('Moon', getProperty('Moon.width')*0.75,getProperty('Moon.height'))
--Buildings
	makeLuaSprite('BG1Buildings',Path..'BG1 Buildings', -160, -232)
	setScrollFactor('BG1Buildings', 0.75, 0.75)
	scaleObject('BG1Buildings',1.15,1.15)
	
	makeLuaSprite('BG2Buildings',Path..'BG2 Buildings', -160, -280)
	setScrollFactor('BG2Buildings', 0.75, 0.75)
	scaleObject('BG2Buildings',1.15,1.15)
	setProperty('BG2Buildings.alpha',0)
--BigHypnos
	makeLuaSprite('BigHypno',Path..'BigHypno', 750, 122)
	setScrollFactor('BigHypno', 0.9, 0.9);
	setProperty('BigHypno.alpha',0)
	
--Ropes
	makeLuaSprite('Ropes',Path..'BridgeRope', 1024 / 2.25, -64)
	setScrollFactor('Ropes', 0.9, 0.9);

	
	makeLuaSprite('Ropes2',Path..'BridgeRope2',1024 / 2.25, -64)
	setScrollFactor('Ropes2', 0.9, 0.9)
	setProperty('Ropes2.alpha',0)
--Bridge
    makeLuaSprite('Bridge',Path..'Bridge',0, 0)
	setScrollFactor('Bridge', 0.9, 0.9)

	
	makeLuaSprite('Bridge2',Path..'Bridge2',0, 0)
	setScrollFactor('Bridge2', 0.9, 0.9)
	setProperty('Bridge2.alpha',0)
	
	addLuaSprite('BG1Clouds', false)
	addLuaSprite('BG2Clouds', false)
	addLuaSprite('Moon', false)
	addLuaSprite('BG1Buildings', false)
	addLuaSprite('BG2Buildings', false)
	
	callScript('scripts/Stuff/Character.lua','CreateCharacter',{'Alexis','BF',1205, 140,'Alexis'})
	setProperty('Alexis.alpha',0)

	addLuaSprite('Ropes', false)
	addLuaSprite('Ropes2', false)
	addLuaSprite('BigHypno',true)
	addLuaSprite('Bridge', true)
	addLuaSprite('Bridge2', true)

    makeAnimatedLuaSprite('icon-HypnoSmall','icons/SmallHypnoIcons',0,0)
    addAnimationByIndicesLoop('icon-HypnoSmall','Good','SmallHypnoIcons instance 1','0',24)
    addAnimationByIndicesLoop('icon-HypnoSmall','Bad','SmallHypnoIcons instance 1','1,2,3,4,5,6,7,8',24)
    setObjectCamera('icon-HypnoSmall','hud')
	
    setProperty('icon-HypnoSmall.flipX',true)
    setProperty('icon-HypnoSmall.y',20)
	addLuaSprite('icon-HypnoSmall',true)

end
local SUSSY=true
function onGameOver()
	setProperty('paused',true)
	runHaxeCode([[
		FlxG.sound.music.pause();
		game.vocals.pause();
		game.KillNotes()
	]])
    if SUSSY then
		SUSSY=false
		openCustomSubstate('BygoneGameOver',true)
	end
	return Function_Stop
end
function addLuaSpriteSubstate(tag)
	runHaxeCode([[
		CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
    ]])
end
local StopPause=false
function onCustomSubstateCreate(name)
    if name=='BygoneGameOver' then
		
        StopPause=true

		makeAnimatedLuaSprite('Retry','characters/Death/Retry',280, 200)
		addAnimationByPrefix('Retry','idle', "Retry instance 1", 24, false)
		addLuaSpriteSubstate('Retry')
		playAnim('Retry','idle')
        scaleObject('Retry',0.65, 0.65,false)
		setProperty('Retry.alpha',0)
		if getProperty('iconP1.char')=='alexis' then
			setProperty('camHUD.visible',false)
		    setProperty('camGame.visible',false)
			makeAnimatedLuaSprite('alexisdies','characters/Death/GGirl_Poof',850, 100)
			addAnimationByPrefix('alexisdies','idle', "GGirlPoof", 12, false)
			addLuaSpriteSubstate('alexisdies')
			playAnim('alexisdies','idle',true)
			scaleObject('alexisdies',1.15, 1.15,false)
            playSound('bygonedeathNoise')
			
			runTimer('GameBygone',1.7)
		else
			setProperty('camHUD.visible',false)
		    setProperty('camGame.visible',false)
			runHaxeCode([[
				var Volume=FlxG.save.data.volume;
				var SubState=FlxG.cameras.list[FlxG.cameras.list.length - 1];
			    SubState.bgColor=0xFF;
			    SubState.flash(]]..getColorFromHex('FF0000')..[[, 0.5);	
			    setVar("camGameOverDT",SubState);
			]])
			playMusic('bygonedeathmusic',0.15,true)	
			soundFadeOut('',1.5,1)
			doTweenAlpha('RetryAlpha','Retry',1,1,'circIn')					
		end
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='GameBygone' then
		playMusic('bygonedeathmusic',0,true)	
			soundFadeOut('',2,1)
			doTweenAlpha('RetryAlpha','Retry',1,1.5,'circIn')	
	end
end
function onCustomSubstateUpdate(name, elapsed)
	if name=='BygoneGameOver' then

		if keyJustPressed('accept') then
			setSoundVolume('',0)
			setProperty('Retry.visible',false)
			playSound('bygoneConfirm')
            makeAnimatedLuaSprite('Confirm','characters/Death/Confirm',420, 0)
		    addAnimationByPrefix('Confirm','idle', "Confirm instance 1", 24, false)
		    addLuaSpriteSubstate('Confirm')
		    playAnim('Confirm','idle')
			
		end
		if keyJustPressed('back') then
			callScript('scripts/Stuff/PlayStuff.lua','toMenu')
		end
		if getProperty('Retry.animation.curAnim.finished') then
            playAnim('Retry','idle')
		end
		if getProperty('alexisdies.animation.curAnim.finished') then
            doTweenAlpha('Dispawn','alexisdies',0,0.3,'circOut')
		end
		if luaSpriteExists('Confirm') then
			if getProperty('Confirm.animation.curAnim.finished') then
				restartSong()
			end
		end
	end
end
function onPause()
    if StopPause then
        return Function_Stop
	end
end
function noteMiss(id, direction, noteType, isSustainNote)
	if getProperty('iconP1.char')=='alexis' then
        playSound('Electric_miss'..tostring(getRandomInt(1,5)),1)
    end
end
function onCountdownStarted()
    for i=0,3 do 
		if not middlescroll then
            setPropertyFromGroup('playerStrums',i,'x',getPropertyFromGroup('strumLineNotes',i,'x'))
		end
        setPropertyFromGroup('strumLineNotes',i,'alpha',0)
    end
end
function onUpdate(elapsed)
	if runHaxeCode([[return game.iconP2!=null;]]) then
		setProperty('iconP2.visible',false)
	end
	if getProperty('iconP1.char')~='alexis' then

		setObjectOrder('icon-HypnoSmall',getObjectOrder('iconP1'))
		setProperty('icon-HypnoSmall.x',getProperty('iconP1.x'))
		scaleObject('icon-HypnoSmall',getProperty('iconP1.scale.x'),getProperty('iconP1.scale.y'),false)
		setProperty('iconP1.visible',false)
		
		if getHealth()<0.4 then
			if getProperty('icon-HypnoSmall.animation.curAnim.name')=='Good' then
		  playAnim('icon-HypnoSmall','Bad',true)
			end
		else
			if getProperty('icon-HypnoSmall.animation.curAnim.name')=='Bad' then
			playAnim('icon-HypnoSmall','Good',true)
			end
		end
	else
		setProperty('iconP1.visible',true)
		setProperty('icon-HypnoSmall.visible',false)
	end
end