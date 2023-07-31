--Hello! This is your script, you may be confused but its really easy
--First, you need to have your image ready, read the tutorial about the thing here:
--Next, replace the word "Test", with the name of your image (capitalization matters).
--Open up the game and press 7 in any song, after that 

function onCreate()
	-- background
	
	makeLuaSprite('SKY', 'SKY', -150, -100);
	setScrollFactor('SKY', 0.9, 0.9);
	scaleObject('SKY', 1.3, 1.3);
	addLuaSprite('SKY', false);

	makeLuaSprite('STREET', 'STREET', -150, -100);
	setScrollFactor('STREET', 0.9, 0.9);
	scaleObject('STREET', 1.3, 1.3);
	addLuaSprite('STREET', false);

	makeLuaSprite('HOUSES', 'HOUSES', -150, -100);
	setScrollFactor('HOUSES', 0.9, 0.9);
	scaleObject('HOUSES', 1.3, 1.3);
	addLuaSprite('HOUSES', false);

	makeLuaSprite('HILL', 'HILL', -150, -100);
	setScrollFactor('HILL', 0.9, 0.9);
	scaleObject('HILL', 1.3, 1.3);
	addLuaSprite('HILL', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end