function onCreate()
	-- background shit
	makeLuaSprite('sky', 'hill/sky', -1204, -456);
	setLuaSpriteScrollFactor('sky', 0.15, 0.15);
	scaleObject('sky', 1, 1);
	
	makeLuaSprite('clouds', 'hill/clouds', -988, -260);
	setLuaSpriteScrollFactor('clouds', 0.25, 0.25);
	scaleObject('clouds', 1, 1);

	makeLuaSprite('backmount', 'hill/backmount', -700, -40);
	setLuaSpriteScrollFactor('backmount', 0.4, 0.4);
	scaleObject('backmount', 1, 1);

	makeLuaSprite('middlemount', 'hill/middlemount', -240, 200);
	setLuaSpriteScrollFactor('middlemount', 0.6, 0.6);
	scaleObject('middlemount', 1, 1);

	makeLuaSprite('ground', 'hill/ground', -660, 624);
	setLuaSpriteScrollFactor('ground', 1, 1);
	scaleObject('ground', 1, 1);

	addLuaSprite('sky', false);
	addLuaSprite('clouds', false);
	addLuaSprite('backmount', false);
	addLuaSprite('middlemount', false);
	addLuaSprite('ground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end