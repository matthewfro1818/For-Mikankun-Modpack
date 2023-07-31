function onCreate()
	-- blackground shit
	makeLuaSprite('painting_shadow', 'painting_shadow', -600, -300);
	setScrollFactor('painting_shadow', 0.9, 0.9);

	addLuaSprite('painting_shadow', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end