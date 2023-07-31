function onCreate()
	-- blackground shit
	makeLuaSprite('big tree-alt', 'big tree-alt', -600, -300);
	setScrollFactor('big tree-alt', 0.9, 0.9);

	addLuaSprite('big tree-alt', false);
	
	makeAnimatedLuaSprite('rain','rain',-600, -300)addAnimationByPrefix('rain','dance','rain raining',24,true)
    objectPlayAnimation('rain','dance',false)
    setScrollFactor('rain', 0.9, 0.9);
	
	addLuaSprite('rain', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end