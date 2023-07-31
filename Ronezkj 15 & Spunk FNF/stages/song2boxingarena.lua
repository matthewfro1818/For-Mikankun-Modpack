function onCreate()

	makeLuaSprite('boxingnight1','song2boxingarena/boxingnight1', -350, -250)
	addLuaSprite('boxingnight1', false)
	setLuaSpriteScrollFactor('boxingnight1', 1.5, 1.5);
	scaleObject('boxingnight1', 1.2, 1.2);

	makeLuaSprite('boxingnight2','song2boxingarena/boxingnight2', -350, -240)
	addLuaSprite('boxingnight2', false)
	setLuaSpriteScrollFactor('boxingnight2', 0.8, 0.8);
	scaleObject('boxingnight2', 1.2, 1.2);

	makeLuaSprite('boxingnight3','song2boxingarena/boxingnight3', -750, -450)
	addLuaSprite('boxingnight3', false)
	setLuaSpriteScrollFactor('boxingnight3', 0.8, 0.8);
	scaleObject('boxingnight3', 1.2, 1.2);

	addLuaSprite('boxingnight1', false);
	addLuaSprite('boxingnight2', false);
	addLuaSprite('boxingnight3', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
