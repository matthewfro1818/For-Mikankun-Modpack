


local active = false
local curWord = ''
local position = 0
local timer = 10
local useSpecificWord = false
local curWordAsLetters = {}
local wordLength = 0

local words = {
	'ABANDONED',
	'BOO!',
	'CAN YOU SEE?',
	'CELEBI DIED',
	'DONT BELONG',
	'DYING',
	'ERRIE NOISE',
	'FERALIGATR',
	'FRUSTRATION',
	'GET OUT',
	'GOLD',
	'GOODBYE',
	'GRAVEYARD',
	'GRUESOME',
	'HE DIED',
	'HELP',
	'HOPELESS',
	'IM DEAD',
	'I SEE YOU',
	'IT FAILED',
	'LEAVE HURRY',
	'NIGHTMARE',
	'NOT WANTED',
	'PERISH SONG',
	'SILVER',
	'TIRESOME',
	'USELESS',
	'WHERE?',
	'XXXXX',
	'SKILL ISSUE',
	'WELCOME TO HELL',
	'WORK THAT PENDULUM',
	'HES BRI ISH GET HIM',
	'MAYBE TRY PUSSY MODE',
	'KEK',

}

local onePercentWords = {
	'NICE COCK',
	'SUS AF',
	'BOOB LOL',	
	'LMAO GOTTEM',
	'RATIO',
	'HIPPOPOTAMUS',
	'POGGERS!',
	'BUSSY',
	'ASS LMAO',
	'RUN STREAMER',
}

local pointOnePercentWords = {
	'WANNA WORK ON MY FNF MOD?',
	'IM IN A FUCKING WHEEL CHAIR',
	'HI SHUBS',
	'HI ASH',
	'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
}



function onCreatePost()
	-- end of "create"
	makeAnimatedLuaSprite('preload', 'Unown_Alphabet', 0, 0);
	addAnimationByPrefix('preload', 'idle', 'A', 24, true);
	objectPlayAnimation('preload', 'idle');
	addLuaSprite('preload');
	removeLuaSprite('preload');


	
end

function onDestroy()
	-- triggered when the lua file is ended (Song fade out finished)
end

function onSoundFinished(tag)
	if active then 

	end
end

function onResume()

end
function onPause()
	if active then 
		return Function_Stop;
	end
end

function onUpdatePost(elapsed)


	if active then 
		

		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ANY') then
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..curWordAsLetters[position + 1]) then
				correctLetter()
			else 
				playSound('buzzer', 1, 'buzz')
			end
		end

	else 

	end
end

function correctLetter()
	
	position = position + 1
	setProperty('line'..position..'.visible', false)
	if position >= string.len(curWord) then 
		win()
		closeUnown()
	end
end

function win()
	--debugPrint('won')
end

function lose()
	setProperty('health', -10)
	closeUnown();
end



function onStepHit()
	-- triggered 16 times per section

end

function onBeatHit()
	-- triggered 4 times per section
	if active then 
		if timer > 0 then 
			timer = timer - 1
			setTextString('timer', timer)
		else 
			lose();
		end
	end

end

function open()
	active = true
	setProperty('boyfriend.stunned', true)


	makeLuaSprite('overlay', '', -100, -100)
	makeGraphic('overlay', 2000, 2000, 'ff0000')
	setScrollFactor('overlay', 0,0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0.4)
	addLuaSprite('overlay', true)

	makeLuaText('timer', timer, 100, (screenWidth / 2) - 5, 430)
	setTextSize('timer', 32)
	setTextAlignment('timer', 'center')
	setTextFont('timer', 'metro.otf')
	addLuaText('timer')
	
	position = 0
	curWordAsLetters = {}
	--debugPrint(curWord)
	wordLength = string.len(curWord)

	for i = 1, wordLength do 
		

		curWordAsLetters[i] = string.upper(string.sub(curWord, i, i))
		
		--debugPrint(curWordAsLetters[i])
		if (curWordAsLetters[i] ~= ' ') then 
			--debugPrint(curWordAsLetters[i])
			createLetterSprite(curWordAsLetters[i], i);
		end
	end
	
end

function getWord()

	if getRandomBool(0.1) then 
		local wordListLength = #(pointOnePercentWords)
		return tostring(pointOnePercentWords[getRandomInt(1, wordListLength)])	
	end

	if getRandomBool(1) then 
		local wordListLength = #(onePercentWords)
		return tostring(onePercentWords[getRandomInt(1, wordListLength)])	
	end

	local wordListLength = #(words)
	return tostring(words[getRandomInt(1, wordListLength)])	
end

function closeUnown()

	for i = 1, wordLength do 
		removeLuaSprite('unown'..i)
		removeLuaSprite('line'..i)
	end
	removeLuaSprite('overlay')
	removeLuaText('timer')
	active = false
	setProperty('boyfriend.stunned', false)
end


function createLetterSprite(letter, id)

	local xpos = 0

	
	if (260 - (15 * wordLength) <= 0) then
		xpos = 40 * id
	else
		xpos = (260 - (15 * wordLength)) * id
		--xpos = 40 * id
	end
	local realscale = 1 - (0.05 * wordLength)
	
	if (realscale < 0.2) then
		realscale = 0.2
	end
	--debugPrint(xpos)


	
	

	local sprName = 'unown'..id
	makeAnimatedLuaSprite(sprName, 'Unown_Alphabet', 0, 90);
	addAnimationByPrefix(sprName, 'idle', letter, 24, true);
	objectPlayAnimation(sprName, 'idle');
	setProperty(sprName..'.scale.x', realscale)
	setProperty(sprName..'.scale.y', realscale)
	
	updateHitbox(sprName)
	addLuaSprite(sprName, true);
	setObjectCamera(sprName, 'hud')

	local lineName = 'line'..id
	makeLuaSprite(lineName, 'line', 0, 590);
	setProperty(lineName..'.scale.x', realscale)
	setProperty(lineName..'.scale.y', realscale)
	updateHitbox(lineName)
	addLuaSprite(lineName, true);
	setObjectCamera(lineName, 'hud')


	local mid = 0
	if (260 - (15 * wordLength) <= 0) then
		mid = 40 * (wordLength / 2)
	else
		mid = (260 - (15 * wordLength)) * (wordLength / 2)
	end

	local dif = xpos - mid
	xpos = ((screenWidth - getProperty(sprName..'.width')) / 2) + dif

	setProperty(sprName..'.x', xpos)
	setProperty(lineName..'.x', xpos)
end


function onTimerCompleted(tag, loops, loopsLeft)

end

-- Tween/Timer hooks
function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag

end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	
end


function onEvent(name, value1, value2)

	if name == 'starthellUnown' then 
		if active then 
			closeUnown()
		end
		if value1 == '' then 
			curWord = string.upper(getWord());
		else 
			curWord = tostring(value1)
		end
		if value2 == '' then 
			timer = 10
		else 
			timer = tonumber(value2)
		end
		open();

	end
end



