function onCreate()
	-- blackground shit
	makeLuaSprite('program', 'program', -600, -300);
	setScrollFactor('program', 0.9, 0.9);

	addLuaSprite('program', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end