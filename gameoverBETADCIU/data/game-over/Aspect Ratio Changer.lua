-- A universal version of the Window Changer script used in Funk Mix Advance.
wideScreen = (26 * 6) + 4

function onCreate()
	if getPropertyFromClass("openfl.Lib", "application.window.width") ~= 960 then
		setPropertyFromClass("flixel.FlxG", "width", 960)
		setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 960)
		setPropertyFromClass("openfl.Lib", "application.window.width", 960)
		setPropertyFromClass("openfl.Lib", "application.window.height", 720)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") + wideScreen)
		setProperty("camGame.x", -wideScreen)
		setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
	end
end

function onCreatePost()
	if downscroll then
		setProperty("timeTxt.y", getProperty("timeTxt.y") + 10)
		setProperty("timeBarBG.y", getProperty("timeBarBG.y") + 10)
		setProperty("timeBar.y", getProperty("timeBar.y") + 10)
		setProperty("botplayTxt.y", getProperty("botplayTxt.y") + 10)
	else
		setProperty("timeTxt.y", getProperty("timeTxt.y") - 20)
		setProperty("timeBarBG.y", getProperty("timeBarBG.y") - 20)
		setProperty("timeBar.y", getProperty("timeBar.y") - 20)
		setProperty("botplayTxt.y", getProperty("botplayTxt.y") - 20)
	end
	setArrows()
end

function setArrows()
	for i = 0,math.max(getProperty("opponentStrums.length")-1,getProperty("playerStrums.length"))-1 do
		noteTwnByX = (13 * 6) - 3
		noteTwnByY = (3 * 6)

		iPosX = _G["defaultOpponentStrumX"..i] - noteTwnByX
		jPosX = _G["defaultPlayerStrumX"..i] - noteTwnByX + (2 * 6) - 2
		iPosY = _G["defaultOpponentStrumY"..i] - noteTwnByY
		jPosY = _G["defaultPlayerStrumY"..i] - noteTwnByY
		iPosD = _G["defaultOpponentStrumY"..i] + noteTwnByY - (1 * 6) + 1
		jPosD = _G["defaultPlayerStrumY"..i] + noteTwnByY - (1 * 6) + 1

		if downscroll then
			setPropertyFromGroup("opponentStrums", i, "y", iPosD)
			setPropertyFromGroup("playerStrums", i, "y", jPosD)
		else
			setPropertyFromGroup("opponentStrums", i, "y", iPosY)
			setPropertyFromGroup("playerStrums", i, "y", jPosY)
		end
		if middlescroll then
			if i <= 1 then
				setPropertyFromGroup("opponentStrums", i, "x", _G["defaultOpponentStrumX"..i] - noteTwnByX + (2 * 6))
			else
				setPropertyFromGroup("opponentStrums", i, "x", _G["defaultOpponentStrumX"..i] - wideScreen + noteTwnByX + (1 * 6))
			end
			setPropertyFromGroup("playerStrums", i, "x", _G["defaultPlayerStrumX"..i] + (2 * 6))
		else
			setPropertyFromGroup("opponentStrums", i, "x", iPosX)
			setPropertyFromGroup("playerStrums", i, "x", jPosX)
		end
	end
end

function onCountdownStarted()
	for i = 0,math.max(getProperty("opponentStrums.length"),getProperty("playerStrums.length"))-1 do
		setOnLuas("defaultOpponentStrumX"..i, getPropertyFromGroup("opponentStrums", i, "x"))
		setOnLuas("defaultOpponentStrumY"..i, getPropertyFromGroup("opponentStrums", i, "y"))
		setOnLuas("defaultPlayerStrumX"..i, getPropertyFromGroup("playerStrums", i, "x"))
		setOnLuas("defaultPlayerStrumY"..i, getPropertyFromGroup("playerStrums", i, "y"))
	end
end

function onExitSong()
	setPropertyFromClass("flixel.FlxG", "width", 1280)
end

function onOpenChartEditor()
	setPropertyFromClass("flixel.FlxG", "width", 1280)
end

function onOpenCharacterEditor()
	setPropertyFromClass("flixel.FlxG", "width", 1280)
end

function onDestroy()
	setPropertyFromClass("flixel.FlxG", "width", 1280)
	setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 1280)
	setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
	setPropertyFromClass("openfl.Lib", "application.window.height", 720)
	setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - wideScreen)
	setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
end