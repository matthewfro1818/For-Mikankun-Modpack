function onSongStart()
	makeLuaSprite('popupBox', '', 0, 200)
	makeGraphic('popupBox', 300, 200, '0xFF000000')
	setProperty('popupBox.x', -getProperty('popupBox.width'))

	doTweenX('popup', 'popupBox', 0, 0.5, 'quantInOut')
	runTimer('popupEnd', 4)
	setObjectCamera('popupBox', 'other')
	addLuaSprite('popupBox')
	setProperty('popupBox.alpha', 0.7)

	local text = 'Absolute Rage (Remastered)\nMashup by HeckinLeBork\n\nMadness by Rozebud\nBallistic by Sock.Clip\nA.G.O.T.I. by TheInnuendo\nGenocide by Tenzubushi'

	--[[if (songName == 'GODSPEED') then 
		text = 'Godspeed\nMashup by HeckinLeBork\n\nGod Eater, Blast, Kaio-ken and Super Saiyan by srPerez\n\nImprobable Outset by Rozebud'
		if (getPropertyFromClass('PlayState', 'god')) then 
			text = 'Godspeed (God Version)\nMashup by HeckinLeBork\n\nGod Eater, Blast, Kaio-ken and Super Saiyan by srPerez\n\nHellclown by Rozebud'
			defaultZoom = 0.56
		end
	elseif (songName == 'GODSPEED-old') then
		text = 'Godspeed (old)\nMashup by HeckinLeBork\n\nGod Eater, Blast, Kaio-ken and Super Saiyan by srPerez\n\nImprobable Outset by Rozebud'
    elseif songName == 'universal-catastrophy' then 
        text = 'Universal Catastrophy\nMashup by HeckinLeBork\n\nTalladega and Final Destination by srPerez'
    elseif songName == 'Monsters-Arent-Real' then 
        text = 'Monsters Arent Real\nMashup by HeckinLeBork\n\nKaio-ken by srPerez\n\nFoolhardy by Rozebud\n\nCredit goes to whoever made the og meme clip'
    elseif songName == "What I wanna know is where's the caveman" then 
        text = "Boy am I glad that he's frozen in there and that we're out here and that he's m'sheriff and that we're frozen out here and we're in there and I just remembered we're out here.\nWhat I wanna know is where's the caveman\n\nMashup by HeckinLeBork\n\nWhere are you, Eruption, Whats New and Soothing Power by srPerez"
	end]]--

	makeLuaText('popupText', text, getProperty('popupBox.width'), getProperty('popupBox.x')+5, getProperty('popupBox.y')+5)
	setTextSize('popupText', 20)
	addLuaText('popupText')
	doTweenX('popupText', 'popupText', 5, 0.5, 'quantInOut')	
	setObjectCamera('popupText', 'other')
end
function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'popupEnd' then 
		doTweenX('popupEnd', 'popupBox', -getProperty('popupBox.width')-500, 0.5, 'quantInOut')
		doTweenX('popupTextEnd', 'popupText', -getProperty('popupBox.width')-500, 0.5, 'quantInOut')
	end
end