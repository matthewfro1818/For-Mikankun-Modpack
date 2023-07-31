function onCreate()
	-- blackground shit
	makeLuaSprite('back', 'eeveeroom', -600, -300);
	setScrollFactor('back', 0.9, 0.9);

	addLuaSprite('back', false);
	
	makeAnimatedLuaSprite('bottom','bottoms', -300, 120)addAnimationByPrefix('bottom','dance','bottoms idle',24,true)
    objectPlayAnimation('bottom','dance',false)
    setScrollFactor('bottom', 0.9, 0.9);
	
	addLuaSprite('bottom', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end