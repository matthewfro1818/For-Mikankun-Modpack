function onCreate() -- Add The Nigger
if not downscroll and not middlescroll then

	makeAnimatedLuaSprite('nigflip', 'fnotes', 693, -61)

elseif downscroll and middlescroll then -- Different Scrolls Support

	makeAnimatedLuaSprite('nigflip', 'fnotes', 362, 420)
	setProperty('nigflip.flipY', true)
	setProperty('nigflip.flipX', true)

elseif middlescroll then
	makeAnimatedLuaSprite('nigflip', 'fnotes', 373, -61)

elseif downscroll then

	makeAnimatedLuaSprite('nigflip', 'fnotes', 683, 421)
	setProperty('nigflip.flipY', true)
	setProperty('nigflip.flipX', true)

end
	-- Properties
	scaleObject('nigflip', 0.7, 0.7)
	setObjectCamera('nigflip', 'hud')
	precacheImage('fnotes')
	-- Animations
	addAnimationByPrefix('nigflip', 'gremlin', 'black', 24, false)
--	addAnimationByIndices('nigflip', 'quickgremlin', 'black', '9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41')
--	addAnimationByIndices('nigflip', 'reversegremlin', 'black', '41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0')
end

function onEvent(name, value1, value2)
	if name == 'Flip Arrows' then
	addLuaSprite('nigflip', true)
	if value1 == '' then
	runTimer('FLIPPAN', 1.5, 1);
	objectPlayAnimation('nigflip', 'gremlin')
	setProperty('nigflip.visible', true)
	elseif value1 == 'unflip' or value1 == '1' then
	runTimer('UNFLIPPAN', 1.5, 1);
	objectPlayAnimation('nigflip', 'gremlin')
	setProperty('nigflip.visible', true)
			end
	for note=4,7 do
	noteTweenAlpha('byebye'..note, note, 0, 0.03, 'quintIn')
		end
	end
end
	
function onTimerCompleted(tag, loops, loopsLeft)
    for note=4,7 do
        noteTweenAlpha('hihi'..note, note, 1, 0.01, 'linear')
		end
    if tag == 'UNFLIPPAN' then
        for note=4,7 do
            noteTweenAngle('unspeen'..note, note, 0, 0.01, 'linear')
	end
		if not middlescroll then
        noteTweenX('unFlipX', 7, 1069, 0.01, 'linear')
        noteTweenX('unflipY', 6, 957, 0.01, 'linear')
        noteTweenX('unFlipY2', 5, 845, 0.01, 'linear')
        noteTweenX('unFlipX2', 4, 734, 0.01, 'linear')
		elseif middlescroll then
		noteTweenX('MunFlipX', 7, 750, 0.01, 'linear')
        noteTweenX('MunFlipY', 6, 637, 0.01, 'linear')
        noteTweenX('MunFlipY2', 5, 527, 0.01, 'linear')
        noteTweenX('MunFlipX2', 4, 414, 0.01, 'linear')
		end
    elseif tag == 'FLIPPAN' then
        for note=4,7 do
            noteTweenAngle('speen'..note, note, 180, 0.01, 'linear')
        end
		if not middlescroll then
        noteTweenX('FlipX', 4, 1069, 0.01, 'linear')
        noteTweenX('FlipY', 5, 957, 0.01, 'linear')
        noteTweenX('FlipY2', 6, 845, 0.01, 'linear')
        noteTweenX('FlipX2', 7, 734, 0.01, 'linear')
		elseif middlescroll then
		noteTweenX('MFlipX', 4, 750, 0.01, 'linear')
        noteTweenX('MFlipY', 5, 637, 0.01, 'linear')
        noteTweenX('MFlipY2', 6, 527, 0.01, 'linear')
        noteTweenX('MFlipX2', 7, 414, 0.01, 'linear')
		end
	end
	setProperty('nigflip.visible', false)
end