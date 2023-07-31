function onCreate()
	-- blackground shit
	makeLuaSprite('gear', 'gear', -600, -300);
	setScrollFactor('gear', 0.9, 0.9);

	addLuaSprite('gear', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end