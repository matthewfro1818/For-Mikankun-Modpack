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

	makeLuaSprite('real5', 'pink/ripbozo', 1000, 450);
	addLuaSprite('real5', false);
	scaleObject('real5', 0.8, 0.8)

	makeLuaSprite('real6', 'pink/rhm dead', 1200, 650);
	addLuaSprite('real6', false);

	makeLuaSprite('real2', 'pink/lightingpretender', -50, -70);
	addLuaSprite('real2', true);
	setObjectCamera('real2','hud')
    scaleObject('real2', 0.4, 0.4)
	setBlendMode('real2', 'difference')

	makeLuaSprite('real', 'pink/front pot', -1400, 650);
	addLuaSprite('real', true);

	makeLuaSprite('real79', 'pink/pretender/green', -1000, -450);
	addLuaSprite('real79', true);

end