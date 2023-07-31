function onEvent(tag,v1,v2)
    if tag=='summonFreakachu'then
        doTweenZoom('zom', 'camGame', 1.15, 0.6, 'linear')
        triggerEvent('Camera Follow Pos','600','300')
        triggerEvent('Change Character','dad','Freakachu_entrance')
        runTimer('Read_dead',2.1,1)
        runTimer('morezonm',0.6,1)
        runTimer('Shake',0.86,1)
    end
end
function onTimerCompleted(tag)
if tag=='Read_dead'then
    
    triggerEvent('Camera Follow Pos','','')
    addLuaSprite('Freakachu', false);
    FreakachuActive=true
    triggerEvent('Change Character','dad','Red_Dead')
    doTweenZoom('zom', 'camGame', 0.8, 0.5, 'quartInOut')
end
if tag=='morezonm'then
    doTweenZoom('zom', 'camGame', 2, 0.6, 'quartInOut')
end
if tag=='Shake'then
    
    cameraShake('Game',0.001,0.8)
end
if tag=='Idle' then
    playAnim('Freakachu','idle',true)
end
end
function onCreate()
    ColdownSplit=30
    ChanceSplit=0.1
    FreakachuActive=false
    makeAnimatedLuaSprite('Freakachu', 'characters/Freakachu', 500, 260)
    addAnimationByPrefix('Freakachu', 'idle', 'Freakachu IDLE', 24,true)
    addAnimationByPrefix('Freakachu', 'Split', 'Freakachu PAIN SPLIT', 24,true)
    scaleObject('Freakachu', 1.45, 1.45)
    precacheSound('Frostbite_bite')
end
function onBeatHit()
if FreakachuActive==true then
    ChanceSplit=ChanceSplit+0
    ColdownSplit=ColdownSplit-1
end
if FreakachuActive==true and ColdownSplit<=0 and getRandomBool(ChanceSplit)==false and getHealth()>1.25 then
    ChanceSplit = 0.5;
    ColdownSplit = 30;
    playAnim('boyfriend','singDOWNmiss')
 playAnim('Freakachu','Split',true)
 addHealth(-(0.2 + (getHealth() / 2.856)))
 playSound('Frostbite_bite',0.7)
 runTimer('Idle',1.2,1)
end
end

