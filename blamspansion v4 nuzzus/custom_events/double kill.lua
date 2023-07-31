
function onEvent(name, v1, v2)

	
	if name == 'double kill' and v1 == 'on'then
			triggerEvent('Set Cam Zoom', '0.9', '')
			triggerEvent('Change Character', 'dad', 'invisigf')
			triggerEvent('Flash Camera', '0.5', '')

				makeLuaSprite('whitebg', '', 0, 0)
				setScrollFactor('whitebg', 0, 0)
				makeGraphic('whitebg', 3840, 2160, '000000')
				addLuaSprite('whitebg', false)
				setProperty('whitebg.alpha', 1)
				screenCenter('whitebg', 'xy')

	elseif name == 'double kill' and v1 == 'off' then
		triggerEvent('Flash Camera', '0.5', '')
		triggerEvent('Set Cam Zoom', '0.8', '')
		triggerEvent('Change Character', 'dad', 'invisigf')
		triggerEvent('Change Character', 'bf', 'bf')
		setProperty('gf.visible', true)
		setProperty('whitebg.alpha', 0)
	end
end
