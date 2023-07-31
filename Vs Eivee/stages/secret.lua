function onCreate()
	-- blackground shit
	makeLuaSprite('shadow', 'shadow', -600, -300);
	setScrollFactor('shadow', 0.9, 0.9);

	addLuaSprite('shadow', false);
	
	makeLuaSprite('secret', 'secret', -600, -300);
	setScrollFactor('secret', 0.9, 0.9);

	addLuaSprite('secret', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end