function onCreate()
	-- background shit
	makeLuaSprite('funny','room',-140,-370)
	addLuaSprite('funny',false)
	scaleObject('funny', 1.0, 1.0);

	makeLuaSprite('wtf','thing',-140,-370)
	addLuaSprite('wtf',true)
	scaleObject('wtf', 1.0, 1.0);

	makeLuaSprite('br','border',-140,-370)
	addLuaSprite('br',true)
	scaleObject('br', 1.0, 1.0);

	makeLuaSprite('barup','',-34.95,-210)
	makeGraphic('barup',1348.9,211,'000000')
	addLuaSprite('barup',true)
    setScrollFactor('barup',0,0)
    setObjectCamera('barup','hud')

	makeLuaSprite('bardown','',-26,720)
	makeGraphic('bardown',1348.9,211,'000000')
	addLuaSprite('bardown',true)
    setScrollFactor('bardown',0,0)
    setObjectCamera('bardown','hud')
	close(true)
end