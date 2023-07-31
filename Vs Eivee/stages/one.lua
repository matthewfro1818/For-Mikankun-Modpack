function onCreate()
	-- blackground shit
	
	makeLuaSprite('paper', 'paper', -600, -300);
	setScrollFactor('paper', 0.9, 0.9);

	addLuaSprite('paper', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end