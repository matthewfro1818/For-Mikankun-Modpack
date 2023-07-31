function onCreate()
	-- background shit
	makeLuaSprite('libaryback', 'libary', -730, -130);
	setScrollFactor('libaryback', 0.9, 0.9);
	

	addLuaSprite('libaryback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end