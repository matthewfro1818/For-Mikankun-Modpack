function onCreate()
	-- blackground shit
	makeLuaSprite('mountain', 'mountain', -600, -300);
	setScrollFactor('mountain', 0.9, 0.9);

	addLuaSprite('mountain', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end