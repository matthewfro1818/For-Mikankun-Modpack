function onCreate()
	-- blackground shit
	makeLuaSprite('dark pokemon', 'dark pokemon', -600, -300);
	setScrollFactor('dark pokemon', 0.9, 0.9);

	addLuaSprite('dark pokemon', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end