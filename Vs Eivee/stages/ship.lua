function onCreate()
	-- blackground shit
	makeLuaSprite('ship', 'ship', -600, -300);
	setScrollFactor('ship', 0.9, 0.9);

	addLuaSprite('ship', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end