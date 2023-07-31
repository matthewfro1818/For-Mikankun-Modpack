function onCreate()
	-- -- background shit
	makeLuaSprite('hall', 'entity/nikusa/NikusaBG', -1000, -425);
	makeLuaSprite('black', 'black', 0, 0);
	setObjectCamera('black','hud')
	setProperty('black.alpha',0)

	addLuaSprite('hall', false);
	addLuaSprite('black', false);
end

-- -350 + Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.5) * 12.5;

function onUpdate(elapsed)
	-- getSongPosition();
end

function onEvent(en, v1, v2)
	if en == 'dadothercharacterplay-anim' then
		othercharacterPlayAnim('dad',v1,v2)
		setProperty('dad.otherCharacters['..v1..'].specialAnim', true)
	end
	if en == 'bfothercharacterplay-anim' then
		othercharacterPlayAnim('boyfriend',v1,v2)
		setProperty('boyfriend.otherCharacters['..v1..'].specialAnim', true)
	end
	if en == 'blackoutspawn' then
		doTweenAlpha('blackout',v1,v2)
	end
end