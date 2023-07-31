function onCreate()
	-- blackground shit
	makeLuaSprite('pinkfireshadows', 'pinkfireshadows', -600, -300);
	setScrollFactor('pinkfireshadows', 0.9, 0.9);

	addLuaSprite('pinkfireshadows', false);
	
	makeAnimatedLuaSprite('fire','pink fire', -600, -300)addAnimationByPrefix('fire','dance','fire idle',24,true)
    objectPlayAnimation('fire','dance',false)
    setScrollFactor('fire', 0.9, 0.9);
	
	addLuaSprite('fire', false);
	
	makeLuaSprite('fraost', 'fraost', -600, -300);
	setScrollFactor('fraost', 0.9, 0.9);

	addLuaSprite('fraost', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end