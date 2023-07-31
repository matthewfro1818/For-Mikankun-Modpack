function onCreate()

	makeLuaSprite('bg sky', 'pink/bg sky', -1200, -1000);
	addLuaSprite('bg sky', false);
	
	makeLuaSprite('cloud7', 'pink/pretender/cloud fathest', -1150, -50);
	addLuaSprite('cloud7', false);
	scaleObject('cloud7', 1, 1)

	makeLuaSprite('cloud2', 'pink/pretender/bigcloud', -1250, -1500);
	addLuaSprite('cloud2', false);
	scaleObject('cloud2', 0.9, 0.9)

	makeLuaSprite('cloud6', 'pink/pretender/cloud 4', -2550, -1450);
	addLuaSprite('cloud6', false);
	scaleObject('cloud6', 1, 1)

	makeLuaSprite('cloud5', 'pink/pretender/cloud 3', -550, -2050);
	addLuaSprite('cloud5', false);
	scaleObject('cloud5', 1, 1)

	makeLuaSprite('cloud4', 'pink/pretender/cloud 2', -550, -1150);
	addLuaSprite('cloud4', false);
	scaleObject('cloud4', 1, 1)

	makeLuaSprite('cloud3', 'pink/pretender/cloud 1', -650, -1050);
	addLuaSprite('cloud3', false);
	scaleObject('cloud3', 1, 1)

	makeLuaSprite('cloud1', 'pink/pretender/cloud front', -950, 0);
	addLuaSprite('cloud1', false);
	scaleObject('cloud1', 1, 1)

	makeLuaSprite('glasses', 'pink/glasses', -1150, -750);
	addLuaSprite('glasses', false);

	makeLuaSprite('what is this', 'pink/front plant', 0, -650);
	addLuaSprite('what is this', false);

	makeLuaSprite('lmao', 'pink/knocked over plant 2', -700, 300);
	addLuaSprite('lmao', false);
	scaleObject('lmao', 0.9, 0.9)

	makeLuaSprite('real3', 'pink/knocked over plant', 750, 200);
	addLuaSprite('real3', false);

	makeLuaSprite('real4', 'pink/tomatodead', 750, 250);
	addLuaSprite('real4', false);

	makeLuaSprite('real6', 'pink/rhm dead', 1200, 550);
	addLuaSprite('real6', false);

	makeLuaSprite('real2', 'pink/lightingpretender', -50, -70);
	addLuaSprite('real2', true);
	setObjectCamera('real2','hud')
    scaleObject('real2', 0.4, 0.4)

	makeLuaSprite('real', 'pink/front pot', -1400, 650);
	addLuaSprite('real', true);

	makeLuaSprite('real79', 'pink/pretender/green', -1200, -450);
	addLuaSprite('real79', true);

		precacheImage('defeat/lol thing') 
		precacheImage('defeat/deadBG') 
		precacheImage('defeat/deadFG')  
		precacheImage('defeat/iluminao omaga')
		precacheImage('pink/pretender/green')
		precacheImage('pink/rhm dead')
		precacheImage('pink/lightingpretender')
		precacheImage('pink/knocked over plant')
		precacheImage('pink/tomatodead')
		precacheImage('pink/knocked over plant 2')
		precacheImage('pink/bg sky')
		precacheImage('grey/grayoverlay')
		precacheImage('grey/graybg')
		precacheImage('grey/grayfg')
		precacheImage('grey/graymultiply')
		precacheImage('grey/wow_blackout')
		precacheImage('wallBP')
		precacheImage('LAVA OVERLAY IN GAME')
		precacheImage('bubbles')
		precacheImage('platform')
		precacheImage('firebubbles')
end

function onStepHit()
if curStep == 1040 then
removeLuaSprite('real79')
removeLuaSprite('real')
removeLuaSprite('real6')
removeLuaSprite('real4')
removeLuaSprite('real3')
removeLuaSprite('lmao')
removeLuaSprite('what is this')
removeLuaSprite('glasses')
removeLuaSprite('cloud1')
removeLuaSprite('cloud2')
removeLuaSprite('cloud3')
removeLuaSprite('cloud4')
removeLuaSprite('cloud5')
removeLuaSprite('cloud6')
removeLuaSprite('cloud7')
removeLuaSprite('bg sky')

makeLuaSprite('iluminao omaga', 'defeat/iluminao omaga', -1300, -400);
addLuaSprite('iluminao omaga', true);
scaleObject('iluminao omaga', 1.2, 1.2)

elseif curStep == 1296 then
removeLuaSprite('iluminao omaga')

    makeLuaSprite('floor3', 'grey/grayoverlay', -950, -250);
	setScrollFactor('floor3', 1, 1);
	scaleObject('floor3', 0.9, 0.9);
	addLuaSprite('floor3', false);

	makeLuaSprite('floor', 'grey/graybg', -950, -250);
	setScrollFactor('floor', 1, 1);
	scaleObject('floor', 0.9, 0.9);
	addLuaSprite('floor', false);

    makeLuaSprite('floor4', 'grey/grayfg', -950, -250);
	setScrollFactor('floor4', 1, 1);
	scaleObject('floor4', 0.9, 0.9);
	addLuaSprite('floor4', true);

    makeLuaSprite('floor2', 'grey/graymultiply', -950, -250);
	setScrollFactor('floor2', 1, 1);
	scaleObject('floor2', 0.9, 0.9);
	addLuaSprite('floor2', true);

    makeLuaSprite('floor5', 'grey/wow_blackout', -950, -250);
	setScrollFactor('floor5', 1, 1);
	scaleObject('floor5', 5, 5);
	addLuaSprite('floor5', true);

elseif curStep == 2320 then

removeLuaSprite('floor')
removeLuaSprite('floor2')
removeLuaSprite('floor3')
removeLuaSprite('floor4')
removeLuaSprite('floor5')

	makeLuaSprite('lol thing', 'defeat/lol thing', -1100, -200);
addLuaSprite('lol thing', false);
scaleObject('lol thing', 1.3, 1.3) 

makeLuaSprite('iluminao omaga', 'defeat/iluminao omaga', -1800, -400);
addLuaSprite('iluminao omaga', true);
scaleObject('iluminao omaga', 1.2, 1.2)

makeLuaSprite('deadBG', 'defeat/deadBG', -1150, 325);
addLuaSprite('deadBG', false);
scaleObject('deadBG', 0.4, 0.4) 

makeLuaSprite('deadFG', 'defeat/deadFG', -1150, 600);
addLuaSprite('deadFG', true);
scaleObject('deadFG', 0.5, 0.5) 

elseif curStep == 2832 then
	makeAnimatedLuaSprite('wallBP','wallBP',-1850,-600)
	addAnimationByPrefix('wallBP','wallBP','Back wall and lava',17,true)
	objectPlayAnimation('wallBP','wallBP',false)
	addLuaSprite('wallBP',false)

    makeAnimatedLuaSprite('bubbles','firebubbles',-300,400)
	addAnimationByPrefix('bubbles','woah','Fire Overlay',24,true)
	objectPlayAnimation('bubbles','woah',false)
	addLuaSprite('bubbles',true)

    makeAnimatedLuaSprite('bubbles2','bubbles',-500,920)
	addAnimationByPrefix('bubbles2','woah2','Lava Bubbles',24,true)
	objectPlayAnimation('bubbles2','woah2',false)
	addLuaSprite('bubbles2',false)

    makeLuaSprite('platform2', 'LAVA OVERLAY IN GAME', -800, 0);
	addLuaSprite('platform2', true)
    scaleObject('platform2', 1.5, 1.5)

	makeLuaSprite('platform', 'platform', -350, 630);
	setScrollFactor('platform', 0.9, 0.9);
	addLuaSprite('platform', false)

	removeLuaSprite('deadFG')
	removeLuaSprite('deadBG')
	removeLuaSprite('iluminao omaga')
	removeLuaSprite('lol thing')
	removeLuaSprite('real2')

elseif curStep == 4112 then
	makeLuaSprite('lol thing', 'defeat/lol thing', -1100, -200);
	addLuaSprite('lol thing', false);
	scaleObject('lol thing', 1.3, 1.3) 
	
	makeLuaSprite('iluminao omaga', 'defeat/iluminao omaga', -1800, -400);
	addLuaSprite('iluminao omaga', true);
	scaleObject('iluminao omaga', 1.2, 1.2)
	
	makeLuaSprite('deadBG', 'defeat/deadBG', -1150, 325);
	addLuaSprite('deadBG', false);
	scaleObject('deadBG', 0.4, 0.4) 
	
	makeLuaSprite('deadFG', 'defeat/deadFG', -1150, 600);
	addLuaSprite('deadFG', true);
	scaleObject('deadFG', 0.5, 0.5) 
	
	removeLuaSprite('platform')
	removeLuaSprite('platform2')
	removeLuaSprite('bubbles2')
	removeLuaSprite('bubbles')
	removeLuaSprite('wallBP')
end
end