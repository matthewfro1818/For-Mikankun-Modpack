function onStepHit()
if curStep == 272 then

makeLuaSprite('lol thing', 'defeat/lol thing', -600, -200);
addLuaSprite('lol thing', false);
scaleObject('lol thing', 1.3, 1.3) 

makeLuaSprite('deadBG', 'defeat/deadBG', -600, 425);
addLuaSprite('deadBG', false);
scaleObject('deadBG', 0.4, 0.4) 

makeLuaSprite('deadFG', 'defeat/deadFG', -650, 800);
addLuaSprite('deadFG', true);
scaleObject('deadFG', 0.5, 0.5) 
setScrollFactor('deadFG', 2.5, 1.5)

elseif curStep == 1440 then

makeLuaSprite('lol thing', 'defeat/lol thing', -600, -200);
addLuaSprite('lol thing', false);
scaleObject('lol thing', 1.3, 1.3) 

makeLuaSprite('deadBG', 'defeat/deadBG', -600, 425);
addLuaSprite('deadBG', false);
scaleObject('deadBG', 0.4, 0.4) 

makeLuaSprite('deadFG', 'defeat/deadFG', -650, 800);
addLuaSprite('deadFG', true);
scaleObject('deadFG', 0.5, 0.5) 
setScrollFactor('deadFG', 2.5, 1.5)

makeLuaSprite('iluminao omaga', 'defeat/iluminao omaga', -800, -200);
addLuaSprite('iluminao omaga', true);
scaleObject('iluminao omaga', 1.2, 1.2)
setBlendMode('iluminao omaga', 'add')
end
end

function onCreate()
precacheImage('defeat/lol thing') 
precacheImage('defeat/deadBG') 
precacheImage('defeat/deadFG') 
end
