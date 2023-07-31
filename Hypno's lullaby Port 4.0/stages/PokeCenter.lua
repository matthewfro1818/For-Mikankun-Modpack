local Path='stage/PokeCenter/'
local nurseangle=0
local BGchar={'Misdreavous','Charmander','Dustskull','Cubone','Chansey','Audinos'}
function onCreate()
    initSaveData('HypnosPref')
    addLuaScript('scripts/Stuff/PlayStuff.lua')
    addLuaScript('scripts/Stuff/Character.lua')
    setProperty('skipCountdown',true)
    setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.15)
    local consistentPosition = {-735, -500}

    makeLuaSprite('floor',Path..'8floor',consistentPosition[1],consistentPosition[2])
    addLuaSprite('floor')
    
    makeLuaSprite('backlayer',Path..'7backlayer',consistentPosition[1],consistentPosition[2])
    setScrollFactor('backlayer',0.98, 0.98)
    addLuaSprite('backlayer')

    makeLuaSprite('nursejoy',Path..'6nursejoy',consistentPosition[1]+ 1260,consistentPosition[2]+ 674)
    setScrollFactor('nursejoy',0.98, 0.98)
    addLuaSprite('nursejoy')
    setProperty('nursejoy.origin.x',75)
    setProperty('nursejoy.origin.y',0)
    nurseangle=getProperty('nursejoy.angle')
    setProperty('nursejoy.visible',false)

    makeLuaSprite('table',Path..'5table',consistentPosition[1],consistentPosition[2])
    setScrollFactor('table',0.98, 0.98)
    addLuaSprite('table')

    makeLuaSprite('ShadowBG','',consistentPosition[1],consistentPosition[2])
    makeGraphic('ShadowBG',screenWidth*2,1205,'000000')
    setProperty('ShadowBG.alpha',0.95)
    if not lowQuality then
        setBlendMode('ShadowBG','OVERLAY')
    end
    addLuaSprite('ShadowBG')

    makeAnimatedLuaSprite('Dustskull',Path..'Characters/DustskullBackground',consistentPosition[1]+ 1500,consistentPosition[2]+ 750)
    addAnimationByPrefix('Dustskull','shadow','Hidden dustskull shadow One',24,true)
    addAnimationByPrefix('Dustskull','shadowToIdle','Dustskull Ease in show two',24,false)
    addAnimationByPrefix('Dustskull','idle','DUSTSKULLHELL',24,true)
    scaleObject('Dustskull',0.65,0.65)
    setScrollFactor('Dustskull',0.98, 0.98)
    addLuaSprite('Dustskull')

    makeAnimatedLuaSprite('Misdreavous',Path..'Characters/Misdreavous',consistentPosition[1]+ 980,consistentPosition[2]+ 725)
    addAnimationByPrefix('Misdreavous','shadow','Shadow for misdreaveous one',24,true)
    addAnimationByPrefix('Misdreavous','shadowToIdle','MISDREAVEOUS REA SHADOW',24,false)
    addAnimationByPrefix('Misdreavous','idle','MISDREAVEOUS REA SHAKE',24,true)
    scaleObject('Misdreavous',0.85,0.85)
    setScrollFactor('Misdreavous',0.98, 0.98)
    addLuaSprite('Misdreavous')

    makeAnimatedLuaSprite('Charmander',Path..'Characters/Charmander',consistentPosition[1]+ 1350,consistentPosition[2]+ 980)
    addAnimationByPrefix('Charmander','shadow','SHdowmanderone',24,true)
    addAnimationByPrefix('Charmander','shadowToIdle','THEIDLECHARMANDER TWO',24,false)
    addAnimationByPrefix('Charmander','idle','CHarmander frompokehell',24,true)
    playAnim('Charmander','idle')
    scaleObject('Charmander',0.65,0.65)
    setScrollFactor('Charmander',0.98, 0.98)
    addLuaSprite('Charmander')

    makeAnimatedLuaSprite('Cubone',Path..'Characters/CUBONE ALT',consistentPosition[1]+ 1150,consistentPosition[2]+ 1030)
    addAnimationByPrefix('Cubone','shadow','CUBONE ONE SHADOW',24,true)
    addAnimationByPrefix('Cubone','shadowToIdle','CUBONE TWO',24,false)
    addAnimationByPrefix('Cubone','idle','CUBONE SHAKE TREE',24,true)
    scaleObject('Cubone',0.55,0.55)
    setScrollFactor('Cubone',0.98, 0.98)
    addLuaSprite('Cubone')

    makeAnimatedLuaSprite('Audinos',Path..'Characters/Audinos ALT',consistentPosition[1]+ 930,consistentPosition[2]+ 975)
    addAnimationByPrefix('Audinos','shadow','Audino shadow one',24,true)
    addAnimationByPrefix('Audinos','shadowToIdle','Idle body tree',24,false)
    addAnimationByPrefix('Audinos','idle','Audini shake Four',24,true)
    playAnim('Audinos','idle')
    scaleObject('Audinos',0.55,0.55)
    setScrollFactor('Audinos',0.98, 0.98)
    addLuaSprite('Audinos')

    makeAnimatedLuaSprite('Chansey',Path..'Characters/Chansey',consistentPosition[1]+ 1450,consistentPosition[2]+ 870)
    addAnimationByPrefix('Chansey','shadow','Chansey numero uno',24,true)
    addAnimationByPrefix('Chansey','shadowToIdle','Chansey',24,false)
    addAnimationByPrefix('Chansey','idle','Chansey Normal shake',24,true)
    scaleObject('Chansey',0.75,0.75)
    setScrollFactor('Chansey',0.98, 0.98)
    addLuaSprite('Chansey')

    makeAnimatedLuaSprite('Jiggly',Path..'Characters/Purinsoulstare',consistentPosition[1]+ 1262,consistentPosition[2]+ 1080)
    addAnimationByPrefix('Jiggly','idle','Jigglypuff bg',24,true)
    scaleObject('Jiggly',1.25,1.25)
    setScrollFactor('Jiggly',0.98, 0.98)
    addLuaSprite('Jiggly')
    setProperty('Jiggly.visible',false)

    makeAnimatedLuaSprite('StaticBack','stage/Disabled/static',consistentPosition[1]+ 680,consistentPosition[2]+ 665)
    addAnimationByPrefix('StaticBack','idle','static',24,true)
    setProperty('StaticBack.antialiasing',false)
    addLuaSprite('StaticBack')
    setProperty('StaticBack.alpha',0)
    setScrollFactor('StaticBack',0.98,1)

    makeLuaSprite('toplayer',Path..'4toplayer',consistentPosition[1],consistentPosition[2])
    setScrollFactor('toplayer',1, 1)
    addLuaSprite('toplayer')

    makeLuaSprite('window',Path..'3window',consistentPosition[1],consistentPosition[2])
    addLuaSprite('window')

    makeLuaSprite('painting',Path..'2painting',consistentPosition[1],consistentPosition[2])
    addLuaSprite('painting')

    


    makeAnimatedLuaSprite('StaticPurin','stage/Disabled/static',consistentPosition[1],consistentPosition[2])
    addAnimationByPrefix('StaticPurin','idle','static',24,true)
    setGraphicSize('StaticPurin',screenWidth* 4,screenHeight* 4)
    setProperty('StaticPurin.antialiasing',false)
    addLuaSprite('StaticPurin',true)
    setProperty('StaticPurin.alpha',0)

    makeLuaSprite('darkoverlay',Path..'1darknessoverlay',consistentPosition[1],consistentPosition[2])
    addLuaSprite('darkoverlay',true)


    makeAnimatedLuaSprite('StaticOther','stage/Disabled/static',0,0)
    addAnimationByPrefix('StaticOther','idle','static',8,true)
    setGraphicSize('StaticOther',screenWidth* 1.01,screenHeight* 1.01)
    screenCenter('StaticOther','xy')
    setObjectCamera('StaticOther','other')
    addLuaSprite('StaticOther')
    setProperty('StaticOther.antialiasing',false)
    setProperty('StaticOther.alpha',0)
    if getDataFromSave('HypnosPref','Hell mode',false) then
        makeAnimatedLuaSprite('Guide','Mechanics/Extras',530, 370)
        addAnimationByPrefix('Guide','Press','Spacebar', 24, false)
        setObjectCamera('Guide','other')
        setProperty('Guide.alpha',0)
        addLuaSprite('Guide')
    end
    BGAnimPlay('shadow',true)
    for i=1,#BGchar do
        setProperty(BGchar[i]..'.alpha',0)
    end
end    
function BGAnimPlay(name,force)
    for i=1,#BGchar do
        playAnim(BGchar[i],name,force)
    end
end
function onCreatePost()
    if getDataFromSave('HypnosPref','Hell mode',false) then
        CreatePendelum(false)
    end
    
    callScript('scripts/Stuff/Character.lua','CreateCharacter',{'Jiggly-front','DAD',getProperty('dad.x')+76,getProperty('dad.y')+246,'JigglyFront'})
    setProperty('JigglyFront.visible',false)
    setProperty('dad.visible',false)
    setProperty('boyfriend.idleSuffix','-alt')
    characterDance('boyfriend')
    setObjectOrder('dadGroup',getObjectOrder('StaticPurin')+1)
	setObjectOrder('JigglyFront',getObjectOrder('dadGroup')+1)
end
local Currentvisible=0
function onTweenCompleted(tag)
    if tag=='StaticOtherAlpha' then
        setProperty(BGchar[1]..'.alpha',1)
        Currentvisible=1
    end
    if tag=='StaticAlphaFront' then
        BGAnimPlay('shadowToIdle',true)
        doTweenAlpha('BGShadowAlpha','ShadowBG',0,13/24,'linear')
    end
    if tag=='BGShadowAlpha' then
        BGAnimPlay('idle',true)
    end
end
function onSongStart()
    if getDataFromSave('HypnosPref','Hell mode',false) then
        StartPendelum()
    end
end
function onUpdate(elapsed)
    setProperty('nursejoy.angle',nurseangle + math.sin((180 / math.pi) * ((getSongPosition() / 1000) / 36)) * 3)
end		
function onBeatHit()
    if luaSpriteExists('Pendelum') and luaSpriteExists('Guide') then
        if curBeat==2 then
            doTweenAlpha('Guide','Guide',1,0.5,'cubeInOut')
		elseif curBeat== 14 then
            doTweenAlpha('Guide','Guide',0,0.5,'cubeInOut')
		end
		if curBeat % 2==0 then
            playAnim('Guide','Press')
		end
    end
    if curBeat>=math.floor((284-56)/5)*(Currentvisible+1) and Currentvisible~=0 and #BGchar>Currentvisible then
        Currentvisible=Currentvisible+1
        debugPrint(Currentvisible,' '..BGchar[Currentvisible])
        runTimer('Static',(stepCrochet/1000)/2,12)
    end
end
local Flicker=true
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='Static' then
        if Flicker then
            setProperty('StaticBack.alpha',1)
        elseif not Flicker then
            setProperty('StaticBack.alpha',0)
        end
        if loopsLeft==1 then
            setProperty(BGchar[Currentvisible]..'.alpha',1)
        end
        Flicker=not Flicker
    end
end