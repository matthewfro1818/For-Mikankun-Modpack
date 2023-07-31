-- made by Laztrix#5670
-- please credit if you gonna use this as a mod that will be public

function onSongStart()
	makeTrailSprite()
end

function onEvent(name, value1, value2)
	if name == 'Change Character' then -- this should work i guess?
		makeTrailSprite()
	end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if isSustainNote == false then
		if getPropertyFromGroup('notes', membersIndex, 'gfNote') then
			gfNoteHit(membersIndex, noteData, noteType, isSustainNote)
		else
			if passDirectionBF ~= nil then
				runHaxeCode([[
					trailBF.playAnim(game.singAnimations[]]..passDirectionBF..[[], true);
					trailBF.holdTimer = 0;
				]])
				setProperty('trailBF.alpha', 1)
				doTweenAlpha('betrailbf', 'trailBF', 0, 0.4,'linear')
				cancelTimer('bfframed')
			end
			passDirectionBF = noteData
			runTimer('bfframed', 0.03)
		end
	end
end

function opponentNoteHit(membersIndex, noteData ,noteType, isSustainNote)
	if isSustainNote == false then
		if getPropertyFromGroup('notes', membersIndex, 'gfNote') then
			gfNoteHit(membersIndex, noteData, noteType, isSustainNote)
		else
			if passDirectionDad ~= nil then
				runHaxeCode([[
					trailDad.playAnim(game.singAnimations[]]..passDirectionDad..[[], true);
					trailDad.holdTimer = 0;
				]])
				cancelTimer('dadframed')
				setProperty('trailDad.alpha', 1)
				doTweenAlpha('betraildad', 'trailDad', 0, 0.4, 'linear')
			end
			passDirectionDad = noteData
			runTimer('dadframed', 0.03)
		end
	end
end

function gfNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if passDirectionGF ~= nil then
		runHaxeCode([[
			trailGF.playAnim(game.singAnimations[]]..passDirectionGF..[[], true);
			trailGF.holdTimer = 0;
		]])
		setProperty('trailGF.alpha', 1)
		doTweenAlpha('betrailgf', 'trailGF', 0, 0.4,'linear')
		cancelTimer('gfframed')
	end
	passDirectionGF = noteData
	runTimer('gfframed', 0.03)
end

function onTimerCompleted(tag)
	if tag == 'dadframed' then
		passDirectionDad = nil
	end

	if tag == 'gfframed' then
		passDirectionGF = nil
	end

	if tag == 'bfframed' then
		passDirectionBF = nil
	end
end

function rgbToHex(rgb) -- https://www.codegrepper.com/code-examples/lua/rgb+to+hex+lua
	return string.format('%02x%02x%02x', math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end

function makeTrailSprite()
	runHaxeCode([[
		// getting character original position
		var dadPos = [game.dad.x, game.dad.y];
		var gfPos = [game.gf.x, game.gf.y];
		var bfPos = [game.boyfriend.x, game.boyfriend.y];

		// new characters for the trails
		trailDad = new Character(dadPos[0], dadPos[1], game.dad.curCharacter);
		game.addBehindDad(trailDad);
		trailGF = new Character(gfPos[0], gfPos[1], game.gf.curCharacter);
		game.addBehindGF(trailGF);
		trailBF = new Boyfriend(bfPos[0], bfPos[1], game.boyfriend.curCharacter);
		game.addBehindBF(trailBF);

		// set the variable so you can mess it with setProperty stuff
		game.variables.set('trailDad', trailDad);
		game.variables.set('trailGF', trailGF);
		game.variables.set('trailBF', trailBF);

		// grrr
		trailDad.alpha = 0;
		trailGF.alpha = 0;
		trailBF.alpha = 0;

		// color
		trailDad.color = ]] .. getColorFromHex(rgbToHex(getProperty('dad.healthColorArray'))) .. [[;
		trailGF.color = ]] .. getColorFromHex(rgbToHex(getProperty('gf.healthColorArray'))) .. [[;
		trailBF.color = ]] .. getColorFromHex(rgbToHex(getProperty('boyfriend.healthColorArray'))) .. [[;
	]])
end

-- made by Laztrix#5670
-- please credit if you gonna use this as a mod that will be public