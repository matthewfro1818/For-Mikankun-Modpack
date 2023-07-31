enable = true

function onCreate()
	if not enable then
		close(true)
	end
end

function onCreatePost()
	makeLuaText('health')
	setProperty('health.x', 950)
	setProperty('health.y', 638)
	setTextSize('health', 20)
	setObjectCamera('health', 'hud')
	addLuaText('health')
	if (downscroll) then
		setProperty('health.y', 76)
	end
	
	makeLuaText('sideTxt')
    setTextAlignment('sideTxt', 'left')
	setProperty('sideTxt.x', 40)
	setProperty('sideTxt.y', 288)
	setTextSize('sideTxt', 20)
	setObjectCamera('sideTxt', 'hud')
	addLuaText('sideTxt')
end

function onUpdatePost()
	setProperty('health.alpha', getProperty('healthBarBG.alpha'))
	setProperty('health.visible', getProperty('healthBarBG.visible'))
	hp = getProperty('health')
	if (hp > 2) then 
		hp = 2
	end
	setTextString('health', string.format("%.1f%%", hp * 50))
	
	setProperty('sideTxt.alpha', getProperty('scoreTxt.alpha'))
	setProperty('sideTxt.visible', getProperty('scoreTxt.visible'))
	setTextString('sideTxt', 'Notes Hit: ' .. hits .. '\nCombo: ' .. getProperty('combo') .. '\n\nSicks: ' .. getProperty('sicks') .. '\nGoods: ' .. getProperty('goods') .. '\nBads: ' .. getProperty('bads') .. '\nShits: ' .. getProperty('shits') .. '\nMisses: ' .. misses .. '\n')
end