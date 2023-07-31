function onCreate()
	-- blackground shit
	makeLuaSprite('forest-winter', 'forest-winter', -600, -300);
	setScrollFactor('forest-winter', 0.9, 0.9);

	addLuaSprite('forest-winter', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end