function onCreate()
	-- blackground shit
	makeLuaSprite('burninghouse', 'burninghouse', -600, -300);
	setScrollFactor('burninghouse', 0.9, 0.9);

	addLuaSprite('burninghouse', false);
	
	makeLuaSprite('oldhouse', 'oldhouse', -600, -300);
	setScrollFactor('oldhouse', 0.9, 0.9);

	addLuaSprite('oldhouse', false);
	
	makeLuaSprite('cave', 'cave', -600, -300);
	setScrollFactor('cave', 0.9, 0.9);

	addLuaSprite('cave', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end