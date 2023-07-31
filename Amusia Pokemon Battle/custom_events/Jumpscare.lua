--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Jumpscare' then
    runTimer('called', 1, 1)
    setProperty('Jumpscare.visible',true)
    playSound('WigglyTuffJumpscare',1)
cameraShake('other',0.008,(songLength-getSongPosition())/1000)
if getProperty('haha2.visible') == true then
    health = getProperty('health')
    setProperty('health', health- 0);
else
    setProperty('health', 0);
end
end
end
function onCreate()
    precacheSound('WigglyTuffJumpscare')
    makeLuaSprite('Jumpscare','Wigglytuff_jumpscare',0,0)
    scaleObject('Jumpscare',0.3,0.3)
    setObjectCamera('Jumpscare','other')
    screenCenter('Jumpscare','xy')
    setObjectOrder('Jumpscare',getObjectOrder('Static')-1)
    addLuaSprite('Jumpscare',false)
    setProperty('Jumpscare.visible',false)
end
