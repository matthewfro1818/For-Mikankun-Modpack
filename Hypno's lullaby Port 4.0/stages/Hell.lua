local Path="stage/Hell/"
local contractStep=0
local percentage=0
local BelzeeIcon=0
function onCreate()
	luaDebugMode=true
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	callOnLuas('FlipHealthBar')
	setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',-0.08)
	setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.12+0.13)
	callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{600, 800})
	
	precacheSound('bimbembooff')
	precacheSound('bimbembo')
	local resizeBG=0.75
	

    setProperty('skipCountdown',true)
	makeLuaSprite('Wall', Path..'wall', 0, 0)
	setGraphicSize('Wall',  getProperty('Wall.width')* resizeBG * 2, getProperty('Wall.height')*resizeBG*2)

	makeAnimatedLuaSprite('Lavabottom', Path..'lavabottom', -2, 1074)
    setGraphicSize('Lavabottom',  getProperty('Lavabottom.width')* resizeBG, getProperty('Lavabottom.height')*resizeBG)
    addAnimationByPrefix('Lavabottom', 'idle', 'lavabottom',24,true)
    playAnim('Lavabottom','idle')

	makeLuaSprite('Rocks',Path..'rocks', 109, 1140)
	setGraphicSize('Rocks',  getProperty('Rocks.width')* resizeBG *2, getProperty('Rocks.height')*resizeBG*2)

	makeLuaSprite('Floorbot',Path..'floorbot', 1070, 1135);
	setGraphicSize('Floorbot',  getProperty('Floorbot.width')* resizeBG *2, getProperty('Floorbot.height')*resizeBG*2)

	makeAnimatedLuaSprite('Lavatop',Path..'lavatop', -10, 1067 )
    setGraphicSize('Lavatop',  getProperty('Lavatop.width')* resizeBG, getProperty('Lavatop.height')*resizeBG)
    addAnimationByPrefix('Lavatop', 'idle', 'lavatop',24,true)
    playAnim('Lavatop','idle')

	makeAnimatedLuaSprite('Glowleft',Path..'glowleft', -403, 780 )
    setGraphicSize('Glowleft',  getProperty('Glowleft.width')* resizeBG, getProperty('Glowleft.height')*resizeBG)
    addAnimationByPrefix('Glowleft', 'idle', 'glowleft',24,true)
    playAnim('Glowleft','idle')

	makeAnimatedLuaSprite('Glowright',Path..'glowright', 1823, 653 )
    setGraphicSize('Glowright',  getProperty('Glowright.width')* resizeBG, getProperty('Glowright.height')* resizeBG)
    addAnimationByPrefix('Glowright', 'idle', 'glowright',24,true)
    playAnim('Glowright','idle')

	makeLuaSprite('Floor',Path..'floor', 2, 931);
	setGraphicSize('Floor',  getProperty('Floor.width')* resizeBG *2, getProperty('Floor.height')* resizeBG*2)

	makeLuaSprite('Roof',Path..'roof', 130, 100);
	setGraphicSize('Roof',  getProperty('Roof.width')* resizeBG *2, getProperty('Roof.height')*resizeBG*2)
	setScrollFactor('Roof',1.1, 1.1)

	makeLuaSprite('Pilfor',Path..'pilfor', 2132, 1282);
	setGraphicSize('Pilfor',  getProperty('Pilfor.width')* resizeBG *2, getProperty('Pilfor.height')*resizeBG*2)
	setScrollFactor('Pilfor',1.2, 1.2)

	makeLuaSprite('Pillar',Path..'pil',840, 553);
	setGraphicSize('Pillar',  getProperty('Pillar.width')* 0.75*2, getProperty('Pillar.height')* 0.75*2)

	makeAnimatedLuaSprite('ContractBF', 'characters/Beelze/ContractBF', getCharacterX('dad')- 232, getCharacterY('dad')+115)
    setGraphicSize('ContractBF',  getProperty('ContractBF.width')* 0.95, getProperty('ContractBF.height')* 0.95)
    addAnimationByPrefix('ContractBF', 'idle', 'ContractIdle',24,true)
	addAnimationByPrefix('ContractBF', '1', 'Contract_BF_01',24,false)
	addAnimationByPrefix('ContractBF', '2', 'Contract_BF_02',24,false)
	addAnimationByPrefix('ContractBF', '3', 'Contract_BF_03',24,false)
	addAnimationByPrefix('ContractBF', '4', 'Contract_BF_04',24,false)
	addAnimationByPrefix('ContractBF', '5', 'Contract_BF_05',24,false)
	addAnimationByPrefix('ContractBF', '6', 'Contract_BF_06',24,false)
	addAnimationByPrefix('ContractBF', '7', 'Contract_BF_07',24,false)
	addAnimationByPrefix('ContractBF', '8', 'Contract_BF_08',24,false)
	addAnimationByPrefix('ContractBF', '9', 'Contract_BF_09',24,false)
    playAnim('ContractBF','idle')



	addLuaSprite('Wall', false);
	addLuaSprite('Lavabottom', false);
	addLuaSprite('Rocks', false);
	addLuaSprite('Floorbot', false);
	addLuaSprite('Lavatop', false);
	addLuaSprite('Glowleft', false);
	addLuaSprite('Glowright', false);
	addLuaSprite('Floor', false);
	addLuaSprite('Roof', false);
	addLuaSprite('Pilfor', false);
	addLuaSprite('Pillar', false);


	lavabtmY=getProperty('Lavabottom.y')
	lavatopY=getProperty('Lavatop.y')
	glowLY=getProperty('Glowleft.y')
	glowRY=getProperty('Glowright.y')
	contractY=getProperty('ContractBF.y')
	
	runHaxeCode([[
    FlxG.cameras.remove(game.camOther,false);
	FlxG.cameras.remove(game.camHUD,false);
	var CamStrum:FlxCamera =new FlxCamera();
	CamStrum.bgColor=0x00;
    var CamBimbemboo:FlxCamera =new FlxCamera();
    CamBimbemboo.bgColor=0x00;
 
	setVar("CamStrum",CamStrum);
    FlxG.cameras.add(CamStrum,false);

	FlxG.cameras.add(game.camHUD,false);

	setVar("CamBimbemboo",CamBimbemboo);
    FlxG.cameras.add(CamBimbemboo,false);

    FlxG.cameras.add(game.camOther,false);
    ]])
	makeLuaSprite('blackscreen',nil,-100, -100)
	makeGraphic('blackscreen',screenWidth*2,screenHeight*2,'000000')
	SetDSCamera('blackscreen')
	addLuaSprite('blackscreen')

	makeLuaSprite('dsbg',Path..'dsgradient')
	scaleObject('dsbg',0.72, 0.72)
	SetDSCamera('dsbg')
	screenCenter('dsbg')
	addLuaSprite('dsbg')
	setProperty('dsbg.visible',false)

	makeLuaSprite('ds1',Path..'ds_01')
	scaleObject('ds1',0.72, 0.72)
	SetDSCamera('ds1')
	screenCenter('ds1','x')
	setProperty('ds1.x',getProperty('ds1.x')+10)
	setProperty('ds1.y',getProperty('ds1.y')-30)

	makeAnimatedLuaSprite('ds2',Path..'bimbembo')
	addAnimationByPrefix('ds2','intro', "dsintro", 24, false)
	scaleObject('ds2',0.72, 0.72)
	SetDSCamera('ds2')
	screenCenter('ds2')
	setProperty('ds2.x',getProperty('ds2.x')+10)
	setProperty('ds2.y',getProperty('ds2.y')-30)
	addLuaSprite('ds2')
	setProperty('ds2.visible',false)

	addLuaSprite('ds1')

	setProperty('camZooming',false)
	setGlobalFromScript('scripts/Stuff/CameraMove','CanBooping',false)
	setProperty('camGame.zoom',0.55)
	setProperty('camHUD.alpha',0)
	setProperty('CamStrum.zoom',0.65)
	setProperty('CamStrum.alpha',0)
    
end
local flicker=true
function onTimerCompleted(tag, loops, loopsLeft)
    if stringStartsWith(tag,'Intro') then
        local Step= tonumber(stringSplit(tag,'Intro')[2])
		if Step==1 then
            setProperty('dsbg.visible',true)
	        setProperty('ds2.visible',true)
			removeLuaSprite('blackscreen',false)
			runTimer('Intro2',0.7)
			runTimer('Intro4',2.8)
		elseif Step==2 then
            playAnim('ds2','intro')
			runTimer('Intro3',0.55)
		elseif Step==3 then
            playSound('bimbembo')
		elseif Step==4 then
            startCountdown()
			runTimer('Intro5',0.5)
		elseif Step==5 then
			doTweenAlpha('HudAlpha','CamStrum',1,0.7)
			doTweenAlpha('Ds2Alpha','ds2',0,0.4)
			doTweenAlpha('DsbgAlpha','dsbg',0,0.7,'linear')
		elseif Step==6 then
			doTweenZoom('CamGameZoom','camGame',0.75,1.35,'backIn')
			doTweenZoom('CamStrumZoom','CamStrum',1,1.5,'backIn')
			doTweenX('DS1X','ds1.scale',1.15,1.5,'backIn')
			doTweenY('DS1Y','ds1.scale',1.15,1.5,'backIn')
			runTimer('Intro7',1.2)
		elseif Step==7 then
			doTweenAlpha('CamHUDAlpha','camHUD',1,2)
			doTweenAlpha('Icon1Alpha','iconP1',1,2)
			doTweenAlpha('Icon2Alpha','iconP2',1,2)

		end
	end
	if stringStartsWith(tag,'Ending') then
        local Step= tonumber(stringSplit(tag,'Ending')[2])
		if Step==1 then
            doTweenZoom('CamGameZoomEnd','camGame',0.4,2.5,'quadOut')
			doTweenX('EndDS1X','ds1.scale',0.72,2.5,'quadOut')
			doTweenY('EndDS1Y','ds1.scale',0.72,2.5,'quadOut')
		elseif Step==2 then
			playSound('bimbembooff')
			doTweenAlpha('BlackscreenAlpha','blackscreen',1,1)	
			
			runTimer('Ending3',0.7)	
		elseif Step==3 then		
			doTweenAlpha('DsbfAlpha','dsbf',0.3,1.8)		
			runTimer('Ending4',3.4)	
		elseif Step==4 then	
			
			doTweenAlpha('DsCamAlpha','CamBimbemboo',0,0.3)	
		end
	end
	if tag=='bongF' then
		cameraShake('game',0.009,0.15)
	end
	if tag=='bongS' then
		cameraShake('game',0.005,0.3)
	end
	if tag=='GameOverDT' then
		playMusic('DeathTollDeathAmbience',1,true)
		doTweenZoom('CamZoomDied','camGameOverDT',0.6, 2,'quadInOut')	
		doTweenY('BFDTY','BFDT',-70, 2,'quadInOut')	
		doTweenX('BFDTX','BFDT',-30, 2,'quadInOut')	
	end
	if tag=='GameOverDTflicker' then
        if flicker then
			setProperty('flicker.alpha',0.22)
		else
			setProperty('flicker.alpha',0.2)
		end
		flicker=not flicker
	end
	if tag=='EndGameOver' then
		doTweenAlpha('CamAlphaDied','camGameOverDT',0,0.7,'linear')
	end
end
function onTweenCompleted(tag)
    if tag=='DsbgAlpha' then
		removeLuaSprite('dsbg',false)
		removeLuaSprite('ds2',false)
		runTimer('Intro6',0.5)
	end
	if tag=='CamGameZoom' then
		
		setGlobalFromScript('scripts/Stuff/CameraMove','CanBooping',true)
		setProperty('camZooming',true)
	end
	if tag=='BlackscreenAlpha' then
		setProperty('camGame.visible',false)
	end
	if tag=='DS1Y' then
		removeLuaSprite('ds1',false)
	end
	if tag=='EndDS1Y' then
		runTimer('Ending2',1.5)	
	end
	if tag=='CamAlphaDied' then
		restartSong()
	end
end
function SetDSCamera(tag)
    runHaxeCode([[
		var Object=game.getLuaObject("]]..tag..[[");
		if(Object!=null && getVar("CamBimbemboo")!=null){
			Object.camera = getVar("CamBimbemboo");
		}
	]])
end
function onCreatePost()
	runHaxeCode([[
		game.strumLineNotes.camera = getVar("CamStrum");
	]])
	setProperty('iconP1.alpha',0)
	setProperty('iconP2.alpha',0)
	lavafloating = 0
	lavamod = 60
	bellY=getCharacterY('gf')
	bellX=getCharacterX('gf')
end
local B=false
local ColorHealthBar=nil
function onStartCountdown()
	if not B then
		runTimer('Intro1',1)
		B=not B
        return Function_Stop
	else
		ColorHealthBar={dad=getProperty('dad.healthColorArray'),dawn=getProperty('boyfriend.healthColorArray'),bf=getProperty('OtherBoyfriend.healthColorArray')}
		return Function_Continue
	end
	
end

function onUpdate(elapsed)
	setProperty('gf.y',bellY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 72)) * 32)  
	setProperty('gf.x',bellX + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 96)) * 16)  
	if luaSpriteExists('ContractBF') and contractStep <= 9 then 
		setProperty('ContractBF.y',contractY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 48)) * 16);
	end
	percentage =(contractStep * contractStep) / 100
	if contractStep > 4 then
		percentage = percentage+math.sin(((getPropertyFromClass('Conductor','songPosition')) / (stepCrochet  * 16)) * math.pi) * (contractStep / 10) * 0.25;

	end
	if contractStep > 9 then 
		percentage = 1 
	end
    if contractStep~=0 then
		setProperty('boyfriend.alpha',1-percentage)
		setProperty('iconP1.alpha',1-percentage)
	end
	setProperty('OtherBoyfriend.alpha',percentage)
	setProperty('OtherBoyfriendicon.alpha',percentage)
	if ColorHealthBar~=nil then
		local BoyfriendColor={toInt(Lerp(ColorHealthBar.dawn[1],ColorHealthBar.bf[1],percentage)),toInt(Lerp(ColorHealthBar.dawn[2],ColorHealthBar.bf[2],percentage)),toInt(Lerp(ColorHealthBar.dawn[3],ColorHealthBar.bf[3],percentage))}
	    setHealthBarColors(getColorFromRGB(ColorHealthBar.dad[1],ColorHealthBar.dad[2],ColorHealthBar.dad[3]),getColorFromRGB(BoyfriendColor[1],BoyfriendColor[2],BoyfriendColor[3]))
	end
	if lavafloating == 1 then
		setProperty('Lavabottom.y', lavabtmY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / lavamod)) * 8)
		setProperty('Lavatop.y', lavatopY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / lavamod)) * 8)
		setProperty('Glowleft.y',glowLY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / lavamod)) * 8)
		setProperty('Glowright.y',glowRY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / lavamod)) * 8) 
	end
end
function onUpdatePost(elapsed)
setProperty('iconP2.animation.curAnim.curFrame',BelzeeIcon)
end
function onEvent(tag,value1,value2)
	if tag == 'BongHellBell' then
	playAnim('gf','Bong',true)
	setProperty('gf.specialAnim',true)	
	cameraShake('game',0.015,0.075)
	runTimer('bongF',0.075,1)
	runTimer('bongS',0.15,1)
	
	end
	if tag=='Toggle_Lava_Fast' then
		lavamod = 30;		
		if lavafloating == 0 then
			lavafloating = 1
		
		else 
			lavafloating = 0;
		end
	end
	if tag=='Toggle_Lava' then
		lavamod = 60;		
		if lavafloating == 0 then
			lavafloating = 1
		
		else 
			lavafloating = 0;
		end
	end
	if tag=='Contract_Advance' then
		contractStep=contractStep+1
		if contractStep<10 then
		playAnim('ContractBF',tostring(contractStep),true)
		else
			
			doTweenColor('ContractColor','ContractBF','0xFF3131',1.3,'backIn')
            doTweenX('ContractXscale','ContractBF.scale',0.3,1.3,'backIn')
			doTweenY('ContractYscale','ContractBF.scale',0.3,1.3,'backIn')
            doTweenAlpha('ContractAlpha','ContractBF',0,1.3,'backIn')
			
		end
	end
	if tag=='Beelze_Walk'then
		BelzeeIcon=1
	end
	if tag=='HB_Ending' then
		makeLuaSprite('blackscreen',nil,-100, -100)
		makeGraphic('blackscreen',screenWidth*2,screenHeight*2,'000000')
		SetDSCamera('blackscreen')
		addLuaSprite('blackscreen')
		setProperty('blackscreen.alpha',0)
	
		makeLuaSprite('ds1',Path..'ds_01')
		scaleObject('ds1',0.72, 0.72)
		SetDSCamera('ds1')
		screenCenter('ds1','x')
		scaleObject('ds1',1.15, 1.15,false)
		setProperty('ds1.x',getProperty('ds1.x')+10)
		setProperty('ds1.y',getProperty('ds1.y')-30)
		addLuaSprite('ds1')

		makeLuaSprite('dsbf',Path..'ds_03')
		scaleObject('dsbf',0.72, 0.72)
		SetDSCamera('dsbf')
		screenCenter('dsbf','x')
		setProperty('dsbf.x',getProperty('dsbf.x')+10)
		setProperty('dsbf.y',getProperty('dsbf.y')-30)
		addLuaSprite('dsbf')
		setProperty('dsbf.alpha',0)
		setGlobalFromScript('scripts/Stuff/CameraMove','CanBooping',false)
		setProperty('camZooming',false)
		doTweenAlpha('CamHUDAlpha','camHUD',0,1)
		doTweenAlpha('Icon1Alpha','iconP1',0,1)
		doTweenAlpha('Icon2Alpha','iconP2',0,1)
		doTweenAlpha('CamStrumAlpha','CamStrum',0,1)
		runTimer('Ending1',0.7)
	end
end
local Open=true
local StopPause=false
function onGameOver()
	setProperty('paused',true)
	runHaxeCode([[
		FlxG.sound.music.pause();
		game.vocals.pause();
		game.KillNotes();
	]])
	if Open then
		Open=false
	openCustomSubstate('GameOverDT',true)
	end
    return Function_Stop
end
function onCustomSubstateCreate(name)
    if name=='GameOverDT' then
		runHaxeCode([[
			game.camHUD.visible=false;
			game.camGame.visible=false;
			getVar("CamStrum").visible=false;
			getVar("CamBimbemboo").visible=false;
			var SubState=FlxG.cameras.list[FlxG.cameras.list.length - 1];
			SubState.zoom=1.2;
			SubState.bgColor=0xFF;
			SubState.flash(]]..getColorFromHex('FF0000')..[[, 2.5);	
			setVar("camGameOverDT",SubState);
		]])
		StopPause=true
		playSound('DT_Loss_SFX')

        makeLuaSprite('flicker','characters/Death/vignetteFlicker')
		screenCenter('flicker')
		setProperty('flicker.y',getProperty('flicker.y')-25)
		scaleObject('flicker',1.35, 1.35,false)
		setProperty('flicker.alpha',0.2)
        
		makeAnimatedLuaSprite('BFDT','characters/Death/hellbellDeath',-225, -250)
        addAnimationByPrefix('BFDT','idle', "deathIdle", 24, false)
		addAnimationByPrefix('BFDT','lol', "deathLol", 24, false)
		addAnimationByPrefix('BFDT','confirm', "deathConfirm", 24, false)
		scaleObject('BFDT',1.3, 1.3,false)
		addLuaSpriteSubstate('BFDT')
		playAnim('BFDT','idle',true)
		runTimer('GameOverDTflicker',0.08,0)

		addLuaSpriteSubstate('flicker')
		runTimer('GameOverDT',1.5)
	end
end
function onCustomSubstateUpdate(name, elapsed)
    if name=='GameOverDT' then
        if keyJustPressed('accept') then
			runHaxeCode([[
				getVar("camGameOverDT").flash(]]..getColorFromHex('000000')..[[, 0.2);
			]])
			playAnim('BFDT','confirm',true)
			stopSound('')
			playSound('gameOverEnd')
			runTimer('EndGameOver',1.2)
			
		end
		if keyJustPressed('back') then
			callScript('scripts/Stuff/PlayStuff.lua','toMenu')
		end
		if getProperty('BFDT.animation.curAnim.finished') then
            if getProperty('BFDT.animation.curAnim.name')=='idle' then
				playAnim('BFDT','lol',true)
			elseif getProperty('BFDT.animation.curAnim.name')=='lol' then
				playAnim('BFDT','idle',true)
			end
		end
	end
end
function addLuaSpriteSubstate(tag)
	runHaxeCode([[
		CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
    ]])
end
function onPause()
    if StopPause then
        return Function_Stop
	end
end
function Lerp(Min,Max,Ratio)
	return Min + Ratio * (Max - Min)
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
	local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
	if PassFromHex then
		return getColorFromHex(FinalColor)
	else
		return FinalColor
	end
end
function toInt(float)
	if float<=math.floor(float)+0.5 then
		return math.floor(float)
	else
		return math.ceil(float)
	end
end