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

addLuaScript('multichara/sevpapyrus')
setProperty('papyrus.x', 2250)
setProperty('papyrus.y', 50)

addLuaScript('multichara/sevkapi')
setProperty('kapi.x', 2050)
setProperty('kapi.y', 0)

addLuaScript('multichara/sevhex')
setProperty('hex.x', 1850)
setProperty('hex.y', -50)

addLuaScript('multichara/sevcarol')
setProperty('carol.x', 2150)
setProperty('carol.y', 300)

addLuaScript('multichara/bf')
setProperty('bf.x', 1250)
setProperty('bf.y', 350)

addLuaScript('multichara/bffl')
setProperty('bffl.x', 1450)
setProperty('bffl.y', 400)

addLuaScript('multichara/bfrs')
setProperty('bfrs.x', 1650)
setProperty('bfrs.y', 450)

addLuaScript('multichara/sevannie')
setProperty('annie.x', 1750)
setProperty('annie.y', 500)

addLuaScript('multichara/sevbob')
setProperty('bob.x', 1850)
setProperty('bob.y', 550)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end


