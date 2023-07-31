local Path='stage/Bygone/'
function onCreate()
    makeAnimatedLuaSprite('HeavenDoor',Path..'Heavens Gate',1148, -195)
    addAnimationByIndices('HeavenDoor','Open','Heavens Gate','0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20',24)
    addAnimationByIndices('HeavenDoor','Close','Heavens Gate','21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40',24)
    setProperty('HeavenDoor.alpha',0)
    addLuaSprite('HeavenDoor',true)

    makeAnimatedLuaSprite('AlexisPass',Path..'GGirl Alexis Passing Spritesheet',1189, -188)
    addAnimationByPrefix('AlexisPass','Die','GGirl Passing',24,false)
    setProperty('AlexisPass.visible',false)
    addLuaSprite('AlexisPass',true)
end
function onEvent(tag,v1,v2)
    if tag =='AlexisPass' then
        setProperty('Alexis.visible',false)
        setProperty('AlexisPass.visible',true)
        doTweenAlpha('HeavenDoor','HeavenDoor', 1,1, 'quadOut')
        playAnim('HeavenDoor','Open',true)
        playAnim('AlexisPass','Die',true)
        runTimer('DIe',1.0833,1)
        doTweenAlpha('IconP1','iconP1', 0,1.25, 'quadOut')   
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag=='DIe' then
    setProperty('AlexisPass.alpha',0)
    playAnim('HeavenDoor','Close',true)
    runTimer('Close',0.8333,1)
end
if tag=='Close' then
    doTweenAlpha('HeavenDoor','HeavenDoor', 0.0, 0.5, 'quadOut')   
end
end