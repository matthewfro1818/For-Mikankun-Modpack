function onCreate()

	makeLuaSprite('boxingnight1','miiboxingarena/boxingnight1', -350, -250)
	addLuaSprite('boxingnight1', false)
	setLuaSpriteScrollFactor('boxingnight1', 1, 1);
	scaleObject('boxingnight1', 1, 1);

	makeLuaSprite('boxingnight2','miiboxingarena/boxingnight2', -800, -600)
	addLuaSprite('boxingnight2', false)
	setLuaSpriteScrollFactor('boxingnight2', 0.8, 0.8);
	scaleObject('boxingnight2', 1.4, 1.4);

	makeLuaSprite('boxingnight3','miiboxingarena/boxingnight3', -750, -450)
	addLuaSprite('boxingnight3', false)
	setLuaSpriteScrollFactor('boxingnight3', 1, 1);
	scaleObject('boxingnight3', 1.3, 1.3);

	addLuaSprite('boxingnight1', false);
	addLuaSprite('boxingnight2', false);
	addLuaSprite('boxingnight3', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
