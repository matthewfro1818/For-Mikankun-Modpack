function onCreate()
	-- blackground shit
	makeLuaSprite('big tree', 'big tree', -600, -300);
	setScrollFactor('big tree', 0.9, 0.9);

	addLuaSprite('big tree', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end