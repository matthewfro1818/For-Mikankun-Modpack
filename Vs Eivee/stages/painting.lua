function onCreate()
	-- blackground shit
	makeLuaSprite('painting', 'painting', -600, -300);
	setScrollFactor('painting', 0.9, 0.9);

	addLuaSprite('painting', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end