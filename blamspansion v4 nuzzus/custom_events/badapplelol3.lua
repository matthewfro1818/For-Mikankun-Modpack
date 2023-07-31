function onCreatePost()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 3840, 2160, 'FFFFFF')
	addLuaSprite('whitebg', false)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')
end
function onEvent(n, v1, v2)
	if n == 'badapplelol3' and string.lower(v1) == 'a' then
		doTweenAlpha('applebadxd69', 'whitebg', 1, v2, 'linear')
		doTweenColor('badapplexd1', 'dad', '000000', v2, 'linear')
		doTweenColor('badapplexd6', 'healthBar', '000000', v2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', v2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', v2, 'linear')
	end
	if n == 'badapplelol3' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'whitebg', 0, v2, 'linear')
		doTweenColor('badapplexd1', 'dad', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd7', 'healthBar', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', v2, 'linear')
	end
end