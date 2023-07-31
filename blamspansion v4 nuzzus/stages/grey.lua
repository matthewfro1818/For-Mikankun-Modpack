function onCreate()

    makeLuaSprite('floor3', 'grey/grayoverlay', -650, 500);
	setScrollFactor('floor3', 1, 1);
	scaleObject('floor3', 0.9, 0.9);
	addLuaSprite('floor3', false);

	makeLuaSprite('floor', 'grey/graybg', -650, 500);
	setScrollFactor('floor', 1, 1);
	scaleObject('floor', 0.9, 0.9);
	addLuaSprite('floor', false);

    makeLuaSprite('floor4', 'grey/grayfg', -650, 500);
	setScrollFactor('floor4', 1, 1);
	scaleObject('floor4', 0.9, 0.9);
	addLuaSprite('floor4', false);

    makeLuaSprite('floor2', 'grey/graymultiply', -650, 500);
	setScrollFactor('floor2', 1, 1);
	scaleObject('floor2', 0.9, 0.9);
	addLuaSprite('floor2', true);

    makeLuaSprite('floor5', 'grey/wow_blackout', -650, 500);
	setScrollFactor('floor5', 1, 1);
	scaleObject('floor5', 5, 5);
	addLuaSprite('floor5', true);

    setBlendMode('floor5', 'difference')
end