function onCreate()
	-- blackground shit
	makeLuaSprite('house', 'house', -600, -300);
	setScrollFactor('house', 0.9, 0.9);

	addLuaSprite('house', false);
	
	makeLuaSprite('back', 'back', -600, -300);
	setScrollFactor('back', 0.9, 0.9);

	addLuaSprite('back', false);
	
	makeLuaSprite('block', 'block', -600, -300);
	setScrollFactor('block', 0.9, 0.9);

	addLuaSprite('block', false);
	
	makeLuaSprite('dark', 'dark', -600, -300);
	setScrollFactor('dark', 0.9, 0.9);

	addLuaSprite('dark', false);
	
	makeLuaSprite('mountain', 'mountain', -600, -300);
	setScrollFactor('mountain', 0.9, 0.9);

	addLuaSprite('mountain', false);
	
	makeLuaSprite('lightning', 'lightning', -600, -300);
	setScrollFactor('lightning', 0.9, 0.9);

	addLuaSprite('lightning', false);
	
	makeLuaSprite('shadow', 'shadow', -600, -300);
	setScrollFactor('shadow', 0.9, 0.9);

	addLuaSprite('shadow', false);
	
	makeLuaSprite('secret', 'secret', -600, -300);
	setScrollFactor('secret', 0.9, 0.9);

	addLuaSprite('secret', false);
	
	makeLuaSprite('night', 'night', -600, -300);
	setScrollFactor('night', 0.9, 0.9);

	addLuaSprite('night', false);
	
	makeLuaSprite('sky-alt', 'sky-alt', -600, -300);
	setScrollFactor('sky-alt', 0.9, 0.9);

	addLuaSprite('sky-alt', false);
	
	makeLuaSprite('sky', 'sky', -600, -300);
	setScrollFactor('sky', 0.9, 0.9);

	addLuaSprite('sky', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end