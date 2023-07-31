function onCreate()
	-- blackground shit
	makeAnimatedLuaSprite('bg','bg', -450, -150)addAnimationByPrefix('bg','dance','bg bg move',24,true)
    objectPlayAnimation('bg','dance',false)
    setScrollFactor('bg', 0.9, 0.9);
	
	addLuaSprite('bg', false);
	
	makeLuaSprite('flower shop', 'flower shop', -600, -300);
	setScrollFactor('flower shop', 0.9, 0.9);

	addLuaSprite('flower shop', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end