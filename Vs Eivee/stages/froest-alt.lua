function onCreate()
	-- blackground shit
	makeLuaSprite('alt-forest', 'alt-forest', -1600, -300);
	setScrollFactor('alt-forest', 0.9, 0.9);

	addLuaSprite('alt-forest', false);
	
	makeAnimatedLuaSprite('bottom1','jolteon-remake', -900, 120)
    addAnimationByPrefix('bottom1','dance','jolteon-remake idle',24,true)
    objectPlayAnimation('bottom1','dance',true)
    setScrollFactor('bottom1', 0.9, 0.9);
		
	addLuaSprite('bottom1', false);
	
	makeAnimatedLuaSprite('bottom2','flareon-remake', -1050, 128)
    addAnimationByPrefix('bottom2','dance','flareon-remake idle',24,true)
    objectPlayAnimation('bottom2','dance',true)
    setScrollFactor('bottom2', 0.9, 0.9);
		
	addLuaSprite('bottom2', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end