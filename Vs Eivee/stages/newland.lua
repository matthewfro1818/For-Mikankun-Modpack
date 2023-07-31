function onCreate()
	-- blackground shit
	makeLuaSprite('newland', 'newland', -600, -300);
	setScrollFactor('newland', 0.9, 0.9);

	addLuaSprite('newland', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end