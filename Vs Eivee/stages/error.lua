function onCreate()
	-- blackground shit
	makeLuaSprite('blockerror', 'blockerror', -600, -300);
	setScrollFactor('blockerror', 0.9, 0.9);

	addLuaSprite('blockerror', false);
	
	makeAnimatedLuaSprite('bottom creppy','bottom creppy', -300, 120)addAnimationByPrefix('bottom creppy','dance','bottom creppy idle',24,true)
    objectPlayAnimation('bottom creppy','dance',false)
    setScrollFactor('bottom creppy', 0.9, 0.9);
	
	addLuaSprite('bottom creppy', false);
	
	makeLuaSprite('block', 'block', -600, -300);
	setScrollFactor('block', 0.9, 0.9);

	addLuaSprite('block', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end