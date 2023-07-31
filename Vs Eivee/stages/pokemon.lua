function onCreate()
	-- blackground shit
	makeLuaSprite('pokemon', 'pokemon', -600, -300);
	setScrollFactor('pokemon', 0.9, 0.9);

	addLuaSprite('pokemon', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end