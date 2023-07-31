local Path='stage/Mountain/'
function onCreate()
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	addLuaScript('scripts/Mechanics/Thermometer.lua')


	makeLuaSprite('Back',Path..'bg', -800, -300)
	setScrollFactor('Back',0.6, 0.6)

	makeLuaSprite('Charizard',Path..'Charizard', -50, -50)
	scaleObject('Charizard', 0.5, 0.5)
	setScrollFactor('Charizard',0.7, 0.7)

	makeLuaSprite('Blastoise',Path..'Blastoise', -400, 100)
	scaleObject('Blastoise', 0.4, 0.4)
	setScrollFactor('Blastoise',0.8, 0.8)

	makeLuaSprite('Pokemon',Path..'pokemons', 300, 200)
	scaleObject('Pokemon', 0.25, 0.25)
	setScrollFactor('Back',0.9, 0.9)

	makeLuaSprite('Fog',Path..'fog', 0, 0)
	setObjectCamera('Fog', 'other')
	setObjectOrder('Fog', 20)
	setGraphicSize('Fog', screenWidth, screenHeight)
	

	addLuaSprite('Back', false)
	addLuaSprite('Charizard', false)
	addLuaSprite('Blastoise', false)
	addLuaSprite('Pokemon', false)

	addLuaSprite('Fog', true)
	callScript('scripts/Stuff/PlayStuff','FlipHealthBar')
	setGlobalFromScript('scripts/Stuff/CameraMove','cameraCentred',true)
	setGlobalFromScript('scripts/Stuff/CameraMove','FirstPerson',true)
end