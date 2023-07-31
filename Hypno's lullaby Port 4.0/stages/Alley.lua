local Path='stage/Alley/'
function onCreate()
	dialogueComplete=false
	initSaveData('ImportantData')
	initSaveData('UnlockData')
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',0.05)
	precacheSound('gameOverEnd')
	precacheImage('stage/Alley/White_Hand')

	consistentPosition = {-800, -300}
	resizeBG = 0.7
	makeLuaSprite('Background',Path..'BACKGROUND', consistentPosition[1], consistentPosition[2]);
	setScrollFactor('Background', 0.6, 0.6);
	scaleObject('Background', resizeBG, resizeBG);
	
	
	makeLuaSprite('grass', Path..'Behind the clouds and fence', consistentPosition[1], consistentPosition[2]);
	setScrollFactor('grass', 0.7, 0.7);
	scaleObject('grass', resizeBG, resizeBG);

	makeLuaSprite('fog', Path..'Behind the Fence', consistentPosition[1], consistentPosition[2]);
	setScrollFactor('fog', 0.8, 0.8);
	scaleObject('fog', resizeBG, resizeBG);
	name='MIDGROUND'
	if songName=='left-unchecked' or songName=='Left Unchecked' then
		name='MIDGROUND BLOOD'
	end
	makeLuaSprite('midground', Path..name, consistentPosition[1], consistentPosition[2]);
	scaleObject('midground', resizeBG, resizeBG);

	makeLuaSprite('stageForeground', Path..'FOREGROUND TREE', consistentPosition[1]- 100, consistentPosition[2]);
	scaleObject('stageForeground', resizeBG, resizeBG);
	setScrollFactor('stageForeground', 1.2, 1.2);



	addLuaSprite('Background', false);
	addLuaSprite('grass', false);
	addLuaSprite('fog', false);
	addLuaSprite('midground', false);
	addLuaSprite('stageForeground', true);

    if getDataFromSave('UnlockData','CanPurin',false) then
		makeLuaSprite('purinHitbox',nil, consistentPosition[1]+ 100, consistentPosition[2]+ 200)
		makeGraphic('purinHitbox',1000, 700,'FFFFFF')
		setProperty('purinHitbox.visible',false)
		addLuaSprite('purinHitbox', true)
		setPropertyFromClass('flixel.FlxG','mouse.visible',true)
	end


	if songName=='safety-lullaby' or  songName=='Safety Lullaby' then
        makeAnimatedLuaSprite('Guide','Mechanics/Extras',530, 370)
		addAnimationByPrefix('Guide','Press','Spacebar', 24, false)
		setObjectCamera('Guide','hud')
		setProperty('Guide.alpha',0)
		addLuaSprite('Guide')
    end
	if songName=='left-unchecked' or songName=='Left Unchecked' then
	makeAnimatedLuaSprite('HypnoIcon','icons/Hypno2 Health Icon',0,0)
	addAnimationByPrefix('HypnoIcon','idle','Hypno2 Icon',24,true)
	setObjectCamera('HypnoIcon','hud')
	addLuaSprite('HypnoIcon',true)
	end

end
function onDestroy()
	setPropertyFromClass('flixel.FlxG','mouse.visible',false)
end
function onStartCountdown()
	setProperty('camFollowPos.x',getMidpointX('dad')+ 150+getProperty('dad.cameraPosition[0]'))
    setProperty('camFollowPos.y',getMidpointY('dad')- 100+getProperty('dad.cameraPosition[1]'))
if dialogueComplete then
	return Function_Continue;
elseif (songName=='safety-lullaby' or  songName=='Safety Lullaby') and not getDataFromSave('ImportantData','isFreeplay',false) then
	startDialogue('dialogue','safety-lullaby')
    return Function_Stop;
end
end
function onSongStart()
	StartPendelum()
end
function onNextDialogue(dialogueCount)

if dialogueCount>=4 then
   dialogueComplete=true
end
end
function onSkipDialogue(dialogueCount)
	dialogueComplete=true
end
function onUpdate(elapsed)
	if songName=='left-unchecked' or songName=='Left Unchecked' then
		setProperty('iconP2.alpha',0)
        setObjectOrder('HypnoIcon',getObjectOrder('iconP2'))
         setProperty('HypnoIcon.x',getProperty('iconP2.x'))
		 setProperty('HypnoIcon.y',getProperty('iconP2.y'))
		 setProperty('HypnoIcon.scale.x',getProperty('iconP2.scale.x'))
		 setProperty('HypnoIcon.scale.y',getProperty('iconP2.scale.y'))
	end
	for i=0,3 do 
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end
	
	local PurinHitbox={
		X=getProperty('purinHitbox.x')<getPropertyFromClass('flixel.FlxG','mouse.x') and getPropertyFromClass('flixel.FlxG','mouse.x')<getProperty('purinHitbox.x')+getProperty('purinHitbox.width'),
	    Y=getProperty('purinHitbox.y')<getPropertyFromClass('flixel.FlxG','mouse.y') and getPropertyFromClass('flixel.FlxG','mouse.y')<getProperty('purinHitbox.y')+getProperty('purinHitbox.height')
	}
if mouseClicked('left') and PurinHitbox.X and PurinHitbox.Y and getDataFromSave('UnlockData','CanPurin',false) then
	setDataFromSave('UnlockData',"purinUnlock",true)
    flushSaveData('UnlockData')
	loadSong('purin')
end
end
local AA=true
function onGameOver()
	setProperty('paused',true)
	runHaxeCode([[
		FlxG.sound.music.pause();
		game.vocals.pause();
		game.KillNotes()
	]])
	if AA then
		AA=false
		openCustomSubstate('HypnoGameover',true)
	end
   

    return Function_Stop
end
function addLuaSpriteSubstate(tag)
	runHaxeCode([[
		CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
    ]])
end
function onCustomSubstateCreate(name)
    if name=='HypnoGameover' then
		cameraFlash('other','FF0000',0.5)
		for i=1,#GameOverAssets do
			addLuaSpriteSubstate(GameOverAssets[i])
		end
		playAnim('GFDead','deathLoopStart')
		playAnim('Retry','deathLoopStart')
	end
end
function onCustomSubstateUpdate(name, elapsed)
	if name=='HypnoGameover' then
		if getProperty('GFDead.animation.curAnim.name')=='deathLoopStart' and getProperty('GFDead.animation.curAnim.finished') then
			playAnim('GFDead','deathLoop')
		end
		if getProperty('Retry.animation.curAnim.name')=='deathLoopStart' and getProperty('Retry.animation.curAnim.finished') then
			playAnim('Retry','deathLoop')
		end
		if getProperty('GFDead.animation.curAnim.name')=='deathConfirm' and getProperty('GFDead.animation.curAnim.finished') then
			restartSong()
		end
		if getProperty('Retry.animation.curAnim.name')=='deathConfirm' and getProperty('Retry.animation.curAnim.finished') then
			doTweenAlpha('Retry','Retry',0,1)
		end
		if getProperty('WhiteHand.animation.curAnim.name')=='idle' and getProperty('WhiteHand.animation.curAnim.finished') then
			setProperty('WhiteHand.alpha',0)
		end
	
		if keyJustPressed('accept') then
			playSound('gameOverEnd',1)
			playAnim('GFDead','deathConfirm')
			setProperty('GFDead.x',getProperty('GFDead.x')-50)
			playAnim('Retry','deathConfirm')
		end
		if keyJustPressed('back') then
			callScript('scripts/Stuff/PlayStuff.lua','toMenu')
		end
	end
end
function onCreatePost()
    CreatePendelum(false)
   Path='GameOver/'
   GameOverAssets={}
   NumAssets=0
   StartGameOver=false
   makeLuaSprite('Sky',Path..'sky',0,0)
   scaleObject('Sky',1.5,1.5)
   Set('Sky',-getProperty('Sky.width')* 0.15,-getProperty('Sky.height')* 0.15)
   GameOverStuff('Sky')

   makeLuaSprite('Trees',Path..'trees',0,0)
   scaleObject('Trees',2,2)
   Set('Trees',-getProperty('Trees.width')* 0.5 + 5,getProperty('Trees.height')* 0.15-1)
   GameOverStuff('Trees')

   makeLuaSprite('Trunk',Path..'trunk',0,0)
   scaleObject('Trunk',1.5,1.5)
   Set('Trunk',getProperty('Trunk.width')* 0.75 + 5,-getProperty('Trunk.height')* 0.15-1)
   GameOverStuff('Trunk')

   makeAnimatedLuaSprite('GFDead',Path..'gf',screenWidth/2,screenHeight/2)
   addAnimationByPrefix('GFDead','deathLoopStart', 'GF_DIZZLE_OPENING instance 1', 24, false)
   addAnimationByPrefix('GFDead','deathLoop', 'GF_DIZZLE_LOOP instance 1', 24, true)
   addAnimationByPrefix('GFDead','deathConfirm', 'GF_WAKEUP instance 1', 24, false)
   scaleObject('GFDead',1.25,1.25)
   setProperty('GFDead.y',getProperty('GFDead.y')-getProperty('GFDead.height')* 0.35)
   GameOverStuff('GFDead')

   makeAnimatedLuaSprite('Claw',Path..'claw',0,0)
   addAnimationByPrefix('Claw','claw', 'claw', 24, true)
   scaleObject('Claw',0.75,0.75)
   Set('Claw',-getProperty('Claw.width')* 0.25,getProperty('Claw.height')* 0.25)
   GameOverStuff('Claw')

   makeAnimatedLuaSprite('Retry',Path..'gf_gameover',75, 300)
   addAnimationByPrefix('Retry','deathLoopStart', "gameover_start' instance 1", 24, false)
   addAnimationByPrefix('Retry','deathLoop', "gameover_concept instance 1", 24, true)
   addAnimationByPrefix('Retry','deathConfirm', "gameover_over instance 1", 24, false)
   addOffset('Retry','deathConfirm',130, 50)
   addOffset('Retry','deathLoopStart', 40, 45)
   GameOverStuff('Retry')
end
function GameOverStuff(Sprite)
   NumAssets=NumAssets+1
   GameOverAssets[NumAssets]=Sprite
end
function Set(Var,x,y)
    setProperty(Var..'.x',x)
	setProperty(Var..'.y',y)
end
function onBeatHit()
    if (songName=='safety-lullaby' or  songName=='Safety Lullaby') and luaSpriteExists('Pendelum') then
        if curBeat==2 then
            doTweenAlpha('Guide','Guide',1,0.5,'cubeInOut')
		elseif curBeat== 14 then
            doTweenAlpha('Guide','Guide',0,0.5,'cubeInOut')
		end
		if curBeat % 2==0 then
            playAnim('Guide','Press')
		end
    end
	if getRandomBool(1) and not luaSpriteExists('WhiteHand') then
        makeAnimatedLuaSprite('WhiteHand','stage/Alley/White_Hand',860, 100)
		addAnimationByPrefix('WhiteHand','idle', 'White Hand FInished', 24, false)
		scaleObject('WhiteHand',0.65,0.65)
		addLuaSprite('WhiteHand')
	end
end