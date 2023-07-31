function onCreate()

	makeLuaSprite('shaggyspook','bg_lemon', -400, -160)
	addLuaSprite('shaggyspook', false)
	setLuaSpriteScrollFactor('shaggyspook', 1, 1);
	scaleObject('shaggyspook', 1.5, 1.5);

	addLuaSprite('shaggyspook', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
