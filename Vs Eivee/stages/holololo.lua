function onCreate()
	-- blackground shit
	makeAnimatedLuaSprite('holololo run','bg/holololo run', -450, -150)addAnimationByPrefix('holololo run','dance','holololo run runbg',24,true)
    objectPlayAnimation('holololo run','dance',false)
    setScrollFactor('holololo run', 0.9, 0.9);
	
	addLuaSprite('holololo run', false);
	
	makeLuaSprite('holololo', 'bg/holololo', -600, -300);
	setScrollFactor('holololo', 0.9, 0.9);

	addLuaSprite('holololo', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end