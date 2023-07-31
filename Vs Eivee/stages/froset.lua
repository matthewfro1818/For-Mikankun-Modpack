function onCreate()
	-- blackground shit
	makeLuaSprite('back', 'back', -600, -300);
	setScrollFactor('back', 0.9, 0.9);

	addLuaSprite('back', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end