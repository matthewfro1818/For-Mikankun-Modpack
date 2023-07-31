function onCreate()
	makeAnimatedLuaSprite('Icon', 'icons/bigjolteon', 0, 0)
	addAnimationByPrefix('Icon', 'normal', 'jolteon normal', 24, true)
	addAnimationByPrefix('Icon', 'loss', 'jolteon lose', 20, true)
	setObjectCamera('Icon', 'camHUD')
	addLuaSprite('Icon', true)
	scaleObject('Icon', 0.3, 0.3)

end



function onUpdate(elapsed)
	if getProperty('health') > 1.61 then
		objectPlayAnimation('Icon', 'loss', false)
		setProperty('Icon.x', getProperty('iconP2.x') - 100)
		setProperty('Icon.y', getProperty('iconP2.y') - 180)
	elseif getProperty('health') < 1.61 then
		objectPlayAnimation('Icon', 'normal', false)
		setProperty('Icon.x', getProperty('iconP2.x') - 100)
		setProperty('Icon.y', getProperty('iconP2.y') - 180)
	end

	setProperty('Icon.scale.x', getProperty('iconP2.scale.x') /3.5)
	setProperty('Icon.scale.y', getProperty('iconP2.scale.y') /3.5)
end

flipped = true
duration = 0

function onCreatePost()
	setObjectOrder('Icon', getObjectOrder('iconP2') -1)
	duration = getPropertyFromClass('Conductor', 'stepCrochet') * 2 / 1100
end