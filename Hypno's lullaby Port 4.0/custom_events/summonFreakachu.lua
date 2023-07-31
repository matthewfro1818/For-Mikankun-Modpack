function onEvent(tag,v1,v2)
    if tag=='summonFreakachu'then
        doTweenZoom('zom1', 'camGame',getProperty('defaultCamZoom')+ 1.15, 0.6, 'quartOut')
        setProperty('boyfriendCameraOffset',{-215,15})
        setProperty('dad.visible',false)
        setProperty('Summon.visible',true)
       
        playAnim('Summon','summon')
        runTimer('Shake',0.86,1)
    end
    if tag=='End_Frostbite' then
        FreakachuActive=false
    end
end
function onUpdate(elapsed)
    if getProperty('Summon.animation.curAnim.finished') and getProperty('Summon.visible') then
       
        setProperty('Freakachu.visible',true)
        playAnim('Freakachu','idle',true)
        setProperty('Summon.visible',false)
        setProperty('defaultCamZoom',0.8)
    end
    if getProperty('Freakachu.animation.curAnim.finished') then
        playAnim('Freakachu','idle',true)
    end
end
function onTweenCompleted(tag)
    if tag=='zom1' then
        setProperty('defaultCamZoom',getProperty('camGame.zoom')+ 1.15)
    end
    if tag=='zom3' then
        setProperty('defaultCamZoom',getProperty('camGame.zoom')+ 0.8)
    end
end
function onTimerCompleted(tag)
if tag=='Shake'then
    setProperty('boyfriendCameraOffset',{-275,15})
    doTweenZoom('zom3', 'camGame',getProperty('defaultCamZoom')+0.8, 0.03, 'quartOut')
    setProperty('dad.visible',true)
    triggerEvent('Change Character','dad','Red_Dead')
	FreakachuActive=true
    cameraShake('Game',0.001,0.8)
end
end
function onCreatePost()
    initSaveData('HypnosPref')
    ColdownSplit=30
    ChanceSplit=0.1
    FreakachuActive=false
    precacheSound('Frostbite_bite')
    makeAnimatedLuaSprite('Freakachu', 'characters/Red/Freakachu', getProperty('dad.x')- 155, getProperty('dad.y')+ 335)
    scaleObject('Freakachu', 1.18,1.18)
    addAnimationByPrefix('Freakachu', 'idle', 'Freakachu IDLE', 24,false)
    addAnimationByPrefix('Freakachu', 'Split', 'Freakachu PAIN SPLIT', 24,false)
    addOffset('Freakachu','Split',-5, 28)
    addOffset('Freakachu','idle',0, 0)
    addLuaSprite('Freakachu', false)
    setProperty('Freakachu.visible',false)

    makeAnimatedLuaSprite('Summon','characters/Red/freakachu_entrance', getProperty('dad.x')-195, getProperty('dad.y')+140)
    addAnimationByPrefix('Summon', 'summon', "Freakachu entrance instance 1", 24, false)
    scaleObject('Summon', 0.76,0.76)
    addLuaSprite('Summon')
    setProperty('Summon.visible',false)
    
    
end
function onBeatHit()
if FreakachuActive then
    ChanceSplit=ChanceSplit+0.1
    ColdownSplit=ColdownSplit-1
end
if FreakachuActive and ColdownSplit<=0 and (getRandomBool(ChanceSplit) or getDataFromSave('HypnosPref','Hell mode',false)) and getHealth()>1.25 and not getDataFromSave('HypnosPref','Pussy mode',false) then
    ChanceSplit = 0.5;
    ColdownSplit = 30;
    playAnim('boyfriend','singDOWNmiss')
 playAnim('Freakachu','Split',true)
 addHealth(-(0.2 + (getHealth() / 2.856)))
 playSound('Frostbite_bite',0.7)
end
end