function onCreate()

	makeLuaSprite('bg','wildcatnight/sky-but-again-not-in-terms-of-the-fangirl', -900, -634)
	addLuaSprite('bg', false)
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 1.3, 1.3);

	makeLuaSprite('city','wildcatnight/city', 1548, 241)
	addLuaSprite('city', false)
	setLuaSpriteScrollFactor('city', 0.2, 0.2);
	scaleObject('city', 1, 1);

	makeLuaSprite('road','wildcatnight/road', 1020, 286)
	addLuaSprite('road', false)
	setLuaSpriteScrollFactor('road', 0.8, 0.8);
	scaleObject('road', 1, 1);

	makeLuaSprite('sand','wildcatnight/quote sand', -827, 323)
	addLuaSprite('sand', false)
	setLuaSpriteScrollFactor('sand', 0.6, 0.6);
	scaleObject('sand', 1, 1);

	makeLuaSprite('fence','wildcatnight/quote fences', -850, 340)
	addLuaSprite('fence', false)
	setLuaSpriteScrollFactor('fence', 0.8, 0.8);
	scaleObject('fence', 1, 1);

	makeLuaSprite('moon','wildcatnight/moon', -300, -195)
	addLuaSprite('moon', false)
	setLuaSpriteScrollFactor('moon', 0.05, 0.05);
	scaleObject('moon', 0.75, 0.75);

	makeLuaSprite('biru','wildcatnight/building', -253, -629)
	addLuaSprite('biru', false)
	setLuaSpriteScrollFactor('biru', 1, 1);
	scaleObject('biru', 1, 1);

	makeLuaSprite('walk','wildcatnight/walkside', -1253, 689)
	addLuaSprite('walk', false)
	setLuaSpriteScrollFactor('walk', 1, 1);
	scaleObject('walk', 1.5, 1.5);

	addLuaSprite('bg', false);
	addLuaSprite('city', false);
	addLuaSprite('road', false);
	addLuaSprite('sand', false);
	addLuaSprite('fence', false);
	addLuaSprite('moon', false);
	addLuaSprite('biru', false);
	addLuaSprite('walk', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
