function onCreate()
	-- blackground shit
	makeLuaSprite('fireshadows', 'fireshadows', -600, -300);
	setScrollFactor('fireshadows', 0.9, 0.9);

	addLuaSprite('fireshadows', false);
	
	makeAnimatedLuaSprite('fire','fire', -600, -300)addAnimationByPrefix('fire','dance','fire idle',24,true)
    objectPlayAnimation('fire','dance',false)
    setScrollFactor('fire', 0.9, 0.9);
	
	addLuaSprite('fire', false);
	
	makeLuaSprite('fireback', 'firesback', -600, -300);
	setScrollFactor('fireback', 0.9, 0.9);

	addLuaSprite('fireback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end