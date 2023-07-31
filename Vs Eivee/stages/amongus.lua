function onCreate()
	-- blackground shit
	makeLuaSprite('amongus', 'amongus', -600, -300);
	setScrollFactor('amongus', 0.9, 0.9);

	addLuaSprite('amongus', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end