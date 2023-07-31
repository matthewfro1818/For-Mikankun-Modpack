local allowCountdown = false

function onCreate()
	-- background shit
	makeLuaSprite('honey', 'honeycomb/BG_Back1', -1700, -250);
	setScrollFactor('honey', 0.9, 0.9);
	scaleObject('honey', 2.4, 2.4);

	makeLuaSprite('honeycomb1', 'honeycomb/BG_Back2', -1400, -150);
	setScrollFactor('honeycomb1', 1.2, 0.9);
	scaleObject('honeycomb1', 1.3, 1.3);

	makeLuaSprite('honeycomb2', 'honeycomb/BG_Back3', -1400, -150);
	setScrollFactor('honeycomb2', 1.2, 0.9);
	scaleObject('honeycomb2', 1.5, 1.5);

	makeLuaSprite('honeycomb3', 'honeycomb/BG_Back4', -1400, -150);
	setScrollFactor('honeycomb3', 1.2, 0.9);
	scaleObject('honeycomb3', 1.6, 1.6);

	makeLuaSprite('honeycomb3.1', 'honeycomb/BG_Back4', -1400, -750);
	setScrollFactor('honeycomb3', 1.2, 0.9);
	scaleObject('honeycomb3', 1.6, 1.6);

	makeLuaSprite('honeycomb4', 'honeycomb/BG_Back5', -1400, -150);
	setScrollFactor('honeycomb4', 1.2, 0.9);
	scaleObject('honeycomb4', 1.4, 1.4);

	makeLuaSprite('GfPlatform', 'honeycomb/Platform', -785, 285);
	setScrollFactor('GfPlatform', 1, 0.9);
	scaleObject('GfPlatform', 0.8, 0.8);

	makeLuaSprite('Platform', 'honeycomb/Platform', 50, 590);
	setScrollFactor('Platform', 1, 0.9);
	scaleObject('Platform', 0.9, 0.9);
	
addLuaScript('lua_characters/bf')
setProperty('bf.x', 820)
setProperty('bf.y', 1022)

addLuaScript('lua_characters/re bf')
setProperty('re bf.x', 1120)
setProperty('re bf.y', 1022)

addLuaScript('lua_characters/bfmonky')
setProperty('bfmonky.x', 1380)
setProperty('bfmonky.y', 1050)

addLuaScript('lua_characters/amor')
setProperty('amor.x', -500)
setProperty('amor.y', 800)


addLuaScript('lua_characters/aflac')
setProperty('aflac.x', -50)
setProperty('aflac.y', 482)

addLuaScript('lua_characters/bee')
setProperty('bee.x', -820)
setProperty('bee.y', 722)

	addLuaSprite('honey', false);
	addLuaSprite('honeycomb1', false);
	addLuaSprite('honeycomb2', false);
	addLuaSprite('honeycomb3', false);
	addLuaSprite('honeycomb3.1', false);
	addLuaSprite('honeycomb4', false);
	addLuaSprite('GfPlatform', false);
	addLuaSprite('Platform', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onEvent(name, value1, value2)
	if name == 'visible' then	
	setPropertyFromGroup('value1',i,'visible',value2)
	end
end