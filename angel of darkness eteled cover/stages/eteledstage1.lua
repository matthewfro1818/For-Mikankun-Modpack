function onCreate()
	-- background shit
	makeLuaSprite('eteledstageback1', 'eteledstageback1', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
makeLuaSprite('miibuttons', 'miibuttons', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	

	addLuaSprite('eteledstageback1', false);
	addLuaSprite('miibutttons', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end