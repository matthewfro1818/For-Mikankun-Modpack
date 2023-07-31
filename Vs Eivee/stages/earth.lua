function onCreate()
	-- blackground shit
	makeLuaSprite('earth', 'earth', -600, -300);
	setScrollFactor('earth', 0.9, 0.9);

	addLuaSprite('earth', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end