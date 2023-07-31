
function onCreate()
makeLuaSprite('iluminao omaga', 'defeat/iluminao omaga', -800, -200);
addLuaSprite('iluminao omaga', true);
scaleObject('iluminao omaga', 1.2, 1.2)

makeAnimatedLuaSprite('snowback','defeat/defeat',-300,-350)
addAnimationByPrefix('snowback','snowback','defeat',24,false)
objectPlayAnimation('snowback','snowback',false)
scaleObject('snowback', 1.1, 1.1)
addLuaSprite('snowback', false)

setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-defeat-dead')

precacheImage('defeat/lol thing') 
precacheImage('defeat/deadBG') 
precacheImage('defeat/deadFG') 
end

function onBeatHit()
 if curBeat % 8 == 0 then
objectPlayAnimation('snowback','snowback',false)
 end
end

function onUpdate()
	setProperty('gf.alpha', 0);
end

function onStepHit()
	if curStep == 1088 then
	
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

	elseif curStep == 1344 then
	removeLuaSprite('deadFG')

	elseif curStep == 1856 then
	makeLuaSprite('deadFG', 'defeat/deadFG', -650, 800);
	addLuaSprite('deadFG', true);
	scaleObject('deadFG', 0.5, 0.5) 
	setScrollFactor('deadFG', 2.5, 1.5)

	removeLuaSprite('bf_legs')

	elseif curStep == 2368 then
	removeLuaSprite('deadFG')

	makeAnimatedLuaSprite('bf_legs', 'characters/bf_legs', 1685, 825);
	addAnimationByPrefix('bf_legs', '', '', 24, true);
	 scaleObject('bf_legs', 1, 1);
	setScrollFactor('bf_legs', 1, 1);
    setObjectOrder('bf_legs', 21);
    addLuaSprite('bf_legs', true)

	elseif curStep == 2624 then
	makeLuaSprite('deadFG', 'defeat/deadFG', -650, 800);
	addLuaSprite('deadFG', true);
	scaleObject('deadFG', 0.5, 0.5) 
	setScrollFactor('deadFG', 2.5, 1.5)
	removeLuaSprite('bf_legs')
	end
end