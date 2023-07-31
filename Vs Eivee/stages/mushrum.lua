function onCreate()
	-- blackground shit
	makeLuaSprite('mushrum', 'mushrum', -600, -450);
	setScrollFactor('mushrum', 0.9, 0.9);

	addLuaSprite('mushrum', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end