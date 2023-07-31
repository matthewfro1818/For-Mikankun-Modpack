function onCreate()

	makeLuaSprite('boxingnight1','boxingnight1', -975, -550)
	addLuaSprite('boxingnight1', false)
	setLuaSpriteScrollFactor('boxingnight1', 0, 0);
	scaleObject('boxingnight1', 1.3, 1.3);

	makeLuaSprite('boxingnight3','boxingnight3', -1000, -450)
	addLuaSprite('boxingnight3', false)
	setLuaSpriteScrollFactor('boxingnight3', 0.2, 0.2);
	scaleObject('boxingnight3', 1.5, 1.5);

	makeLuaSprite('boxingboulder','boxingboulder', -1100, 550)
	addLuaSprite('boxingboulder', false)
	setLuaSpriteScrollFactor('boxingboulder', 1, 1);
	scaleObject('boxingboulder', 2, 2);

	makeLuaSprite('boxingboulder1','boxingboulder1', 750, 450)
	addLuaSprite('boxingboulder1', false)
	setLuaSpriteScrollFactor('boxingboulder1', 1, 1);
	scaleObject('boxingboulder1', 2.5, 2.5);

	addLuaSprite('boxingnight1', false);
	addLuaSprite('boxingnight3', false);
	addLuaSprite('boxingboulder', false);
	addLuaSprite('boxingboulder1', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
