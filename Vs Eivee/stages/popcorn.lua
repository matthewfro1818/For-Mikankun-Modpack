function onCreate()
	-- blackground shit
	makeLuaSprite('popcorn1', 'popcorn1', -600, -300);
	setScrollFactor('popcorn1', 0.9, 0.9);

	addLuaSprite('popcorn1', false);
	
	makeLuaSprite('popcorn2', 'popcorn2', -600, -300);
	setScrollFactor('popcorn2', 0.9, 0.9);

	addLuaSprite('popcorn2', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end