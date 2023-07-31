function onCreate()
	-- blackground shit
	makeLuaSprite('block', 'block', -600, -300);
	setScrollFactor('block', 0.9, 0.9);

	addLuaSprite('block', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end