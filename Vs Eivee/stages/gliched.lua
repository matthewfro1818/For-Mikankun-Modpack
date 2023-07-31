function onCreate()
	-- blackground shit
	
	makeLuaSprite('darkness', 'darkness', -600, -300);
	setScrollFactor('darkness', 0.9, 0.9);

	addLuaSprite('darkness', false);
	
	makeLuaSprite('gliched', 'gliched', -600, -300);
	setScrollFactor('gliched', 0.9, 0.9);

	addLuaSprite('gliched', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end