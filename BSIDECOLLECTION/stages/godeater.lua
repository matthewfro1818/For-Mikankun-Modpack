function onCreate()
	-- background shit
	makeAnimatedLuaSprite('sky', 'godeater/god_bg' , -650, -850)
	addAnimationByPrefix('sky', 'dance', 'bg', 24, true)
    objectPlayAnimation('sky', 'dance', false)
    setScrollFactor('sky', 0.1, 0.1);
	scaleObject('sky', 0.8, 0.8);

	makeAnimatedLuaSprite('cloud', 'godeater/god_bg' , -1050, -1400)
	addAnimationByPrefix('cloud', 'dance', 'cloud_smol', 24, true)
    objectPlayAnimation('cloud', 'dance', false)
    setScrollFactor('cloud', 0.3, 0.3);
	scaleObject('cloud', 1, 1);

	makeAnimatedLuaSprite('rock', 'godeater/god_bg' , 100, -800)
	addAnimationByPrefix('rock', 'dance', 'deb_norm', 24, true)
    objectPlayAnimation('rock', 'dance', false)
    setScrollFactor('rock', 0.4, 0.4);
	scaleObject('rock', 0.54, 0.54);

	makeAnimatedLuaSprite('rock1', 'godeater/god_bg' , 400, -300)
	addAnimationByPrefix('rock1', 'dance', 'deb_tiny', 24, true)
    objectPlayAnimation('rock1', 'dance', false)
    setScrollFactor('rock1', 0.4, 0.4);
	scaleObject('rock1', 0.54, 0.54);

	makeAnimatedLuaSprite('rock2', 'godeater/god_bg' , 750, -400)
	addAnimationByPrefix('rock2', 'dance', 'deb_spike', 24, true)
    objectPlayAnimation('rock2', 'dance', false)
    setScrollFactor('rock2', 0.4, 0.4);
	scaleObject('rock2', 0.54, 0.54);

	makeAnimatedLuaSprite('rock2', 'godeater/god_bg' , -950, -850)
	addAnimationByPrefix('rock2', 'dance', 'deb_small', 24, true)
    objectPlayAnimation('rock2', 'dance', false)
    setScrollFactor('rock3', 0.4, 0.4);
	scaleObject('rock3', 0.54, 0.54);

	makeAnimatedLuaSprite('rock4', 'godeater/god_bg' , -500, -1700)
	addAnimationByPrefix('rock4', 'dance', 'deb_norm', 24, true)
    objectPlayAnimation('rock4', 'dance', false)
    setScrollFactor('rock4', 0.75, 0.75);
	scaleObject('rock4', 1, 1);

	makeAnimatedLuaSprite('rock5', 'godeater/god_bg' , -1200, -1750)
	addAnimationByPrefix('rock5', 'dance', 'deb_rect', 24, true)
    objectPlayAnimation('rock5', 'dance', false)
    setScrollFactor('rock5', 0.75, 0.75);
	scaleObject('rock5', 1, 1);

	makeAnimatedLuaSprite('rock6', 'godeater/god_bg' , -800, -1100)
	addAnimationByPrefix('rock6', 'dance', 'deb_tiny', 24, true)
    objectPlayAnimation('rock6', 'dance', false)
    setScrollFactor('rock6', 0.75, 0.75);
	scaleObject('rock6', 1, 1);

	makeAnimatedLuaSprite('rock6', 'godeater/god_bg' , -800, -1100)
	addAnimationByPrefix('rock6', 'dance', 'deb_tiny', 24, true)
    objectPlayAnimation('rock6', 'dance', false)
    setScrollFactor('rock6', 0.75, 0.75);
	scaleObject('rock6', 1, 1);

	makeAnimatedLuaSprite('rock7', 'godeater/god_bg' , 700, -1850)
	addAnimationByPrefix('rock7', 'dance', 'deb_spike', 24, true)
    objectPlayAnimation('rock7', 'dance', false)
    setScrollFactor('rock7', 0.75, 0.75);
	scaleObject('rock7', 1, 1);

	makeAnimatedLuaSprite('rock8', 'godeater/god_bg' , 1300, -1300)
	addAnimationByPrefix('rock8', 'dance', 'deb_small', 24, true)
    objectPlayAnimation('rock8', 'dance', false)
    setScrollFactor('rock8', 0.75, 0.75);
	scaleObject('rock8', 1, 1);

	makeAnimatedLuaSprite('rock9', 'godeater/god_bg' , -800, -800)
	addAnimationByPrefix('rock9', 'dance', 'deb_spike', 24, true)
    objectPlayAnimation('rock9', 'dance', false)
    setScrollFactor('rock9', 0.75, 0.75);
	scaleObject('rock9', 1, 1);

	makeAnimatedLuaSprite('rock10', 'godeater/god_bg' , -1200, -900)
	addAnimationByPrefix('rock10', 'dance', 'deb_small', 24, true)
    objectPlayAnimation('rock10', 'dance', false)
    setScrollFactor('rock10', 0.75, 0.75);
	scaleObject('rock10', 1, 1);

	makeAnimatedLuaSprite('cloud1', 'godeater/god_bg' , -1350, -3100)
	addAnimationByPrefix('cloud1', 'dance', 'cloud_big', 24, true)
    objectPlayAnimation('cloud1', 'dance', false)
    setScrollFactor('cloud1', 0.9, 0.9);
	scaleObject('cloud1', 1, 1);

	makeAnimatedLuaSprite('techo', 'godeater/god_bg' , -200, -20)
	addAnimationByPrefix('techo', 'dance', 'broken_techo', 24, true)
    objectPlayAnimation('techo', 'dance', false)
    setScrollFactor('techo', 0.95, 0.95);
	scaleObject('techo', 1.5, 1.5);

	makeAnimatedLuaSprite('gfrock', 'godeater/god_bg' , -400, -1750)
	addAnimationByPrefix('gfrock', 'dance', 'gf_rock', 24, true)
    objectPlayAnimation('gfrock', 'dance', false)
    setScrollFactor('gfrock', 0.95, 0.95);
	scaleObject('gfrock', 1.3, 1.3);

	makeAnimatedLuaSprite('bfrock', 'godeater/god_bg' , 500, -1700)
	addAnimationByPrefix('bfrock', 'dance', 'rock', 24, true)
    objectPlayAnimation('bfrock', 'dance', false)
    setScrollFactor('bfrock', 1, 1);
	scaleObject('bfrock', 1, 1);

	addLuaSprite('sky', false);
	addLuaSprite('cloud', false);
	addLuaSprite('rock', false);
	addLuaSprite('rock1', false);
	addLuaSprite('rock2', false);
	addLuaSprite('rock3', false);
	addLuaSprite('rock4', false);
	addLuaSprite('rock5', false);
	addLuaSprite('rock6', false);
	addLuaSprite('rock7', false);
	addLuaSprite('rock8', false);
	addLuaSprite('rock9', false);
	addLuaSprite('rock10', false);
	addLuaSprite('cloud1', false);
	addLuaSprite('techo', false);
	addLuaSprite('gfrock', false);
	addLuaSprite('bfrock', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end