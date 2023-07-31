function onCreatePost()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 3840, 2160, '000000')
	addLuaSprite('whitebg', true)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')
end