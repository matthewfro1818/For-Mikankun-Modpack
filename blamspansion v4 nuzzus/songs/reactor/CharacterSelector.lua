--Made By Epic Wubbox#2851, credit me if used in a mod!
menuTrue = true
selectedChar = false
charNum = 1
--local luaDebugMode = true
function onCreate()
    if isStoryMode then
        menuTrue = false;
        return Function_Stop;
    end
end

function onCreatePost()
    if not isStoryMode then
        addHaxeLibrary('Paths')
	    addHaxeLibrary('ColorSwap')
	    addHaxeLibrary('BGSprite')
	    addHaxeLibrary('Conductor')

        groupStageX = getProperty('boyfriendGroup.x')
        groupStageY = getProperty('boyfriendGroup.y')

        setProperty('scoreTxt.visible', false);
        setProperty('healthBar.visible', false);
        setProperty('healthBarBG.visible', false);
        setProperty('iconP1.visible', false);
        setProperty('iconP2.visible', false);
   
        characters = {
            getProperty("boyfriend.curCharacter"),
            "bf",
            "redp",
            "greenp",
		"blackp",
		"amongbf",
		"dripbf",
		"stick-bf"
        }
        characterNames = {
            "Default",
            "Boyfriend",
            "Red",
            "Green",
		"Black",
		"AmongUsBoyfriend",
		"DripBoyfriend",
		"StickminBoyfriend"
        }

        for i = 1, #characters do
		--debugPrint(i)
            addCharacterToList(characters[i])
        end
        makeLuaText("charName", "", 1000, 0, 600)
        setTextSize("charName", 100)
        setTextFont("charName", "FnfWeekUiFont.ttf")
        addLuaText("charName")

        makeLuaText("charSelect", "CHARACTER SELECT", 1250, 0, 50)
        setTextSize("charSelect", 75)
        setTextFont("charSelect", "FNFont.ttf")
        addLuaText("charSelect")

        playMusic('freakyMenu', 0.7)
        -- dont edit from here on
	  --debugPrint(#characters)
        triggerEvent("Change Character", "0", characters[charNum])

        makeLuaSprite('selectArrow', 'charSelect/selectArrow', 250, 265)
        setObjectCamera('selectArrow', 'hud')
        scaleObject('selectArrow', 0.5, 0.5)
        addLuaSprite('selectArrow', true)

        makeLuaSprite('selectArrow2', 'charSelect/selectArrow', 850, 265)
        setObjectCamera('selectArrow2', 'hud')
        scaleObject('selectArrow2', 0.5, 0.5)
        addLuaSprite('selectArrow2', true)
        setProperty('selectArrow2.flipX', true)

        makeLuaSprite('Downfade', 'charSelect/fakefade', 0, -3000)
        setObjectCamera('Downfade', 'hud')
        addLuaSprite('Downfade', true)

        makeLuaSprite('Upfade', 'charSelect/fakefade', 0, -3000)
        setObjectCamera('Upfade', 'hud')
        addLuaSprite('Upfade', true)
        setProperty('Upfade.flipY', true)

        makeLuaSprite('unknown', 'charSelect/unknown', 575, 325)
        setObjectCamera('unknown', 'hud')
        scaleObject('unknown', 2, 2)
        addLuaSprite('unknown', true)

        makeLuaSprite('BG', 'charSelect/bfBG', 0, 0)
        setObjectCamera('BG', 'hud')
        addLuaSprite('BG', false)



    end
end

function onUpdatePost(elapsed)
    if not isStoryMode then
	  if charNum == 8 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -175)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 180/360;
                colorSwap.saturation = 75/100;
                colorSwap.brightness = 75/100;
		]])
	  elseif charNum == 7 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -175)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 200/360;
                colorSwap.saturation = 50/100;
                colorSwap.brightness = 75/100;
		]])
	  elseif charNum == 6 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -100)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 50/360;
                colorSwap.saturation = 25/100;
                colorSwap.brightness = 50/100;
		]])
        elseif charNum == 5 and menuTrue then
		setProperty('boyfriendGroup.x', 350)
            setProperty('boyfriendGroup.y', -125)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 150/360;
                colorSwap.saturation = 50/100;
                colorSwap.brightness = 75/100;
		]])
        elseif charNum == 4 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -175)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 180/360;
                colorSwap.saturation = 50/100;
                colorSwap.brightness = 75/100;
            ]])
        elseif charNum == 3 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -175)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 260/360;
                colorSwap.saturation = 75/100;
                colorSwap.brightness = 75/100;
            ]])
        elseif charNum == 2 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -175)
            setProperty('boyfriend.visible', true)
            setProperty('unknown.visible', false)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.hue = 10/360;
                colorSwap.saturation = 25/100;
                colorSwap.brightness = 75/100;
            ]])
        elseif charNum == 1 and menuTrue then
		setProperty('boyfriendGroup.x', 400)
            setProperty('boyfriendGroup.y', -150)
            setProperty('boyfriend.visible', false)
            setProperty('unknown.visible', true)
            runHaxeCode([[
                var colorSwap = new ColorSwap();
                game.getLuaObject('BG').shader = colorSwap.shader;
                colorSwap.saturation -= 100;
                colorSwap.brightness -= 0.5;
            ]])
        end
        if menuTrue then
            setObjectCamera('boyfriend', 'hud')
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' and getProperty('boyfriend.animation.curAnim.finished') then
                playAnim('boyfriend', 'idle', true)
            end
        elseif not menuTrue then
            setObjectCamera('boyfriend', 'game')
            setProperty('boyfriendGroup.x', groupStageX)
            setProperty('boyfriendGroup.y', groupStageY)
        end
        if not selectedChar and menuTrue then
            if keyJustPressed("right") then
                playSound('scrollMenu', 0.7)
                if charNum + 1 >= #characters + 1 then
                    charNum = 1          
                else
                    charNum = charNum + 1
                end
                triggerEvent("Change Character", "0", characters[charNum])
            end
        end

        if keyPressed("right") then
            scaleObject('selectArrow2', 0.45, 0.45)
            setProperty('selectArrow2.y', 275)
            setProperty('selectArrow2.x', 855)
        elseif keyPressed("left") then
            scaleObject('selectArrow', 0.45, 0.45)
            setProperty('selectArrow.y', 275)
            setProperty('selectArrow.x', 255)
        elseif keyReleased("right") then
            scaleObject('selectArrow2', 0.5, 0.5)
            setProperty('selectArrow2.y', 265)
            setProperty('selectArrow2.x', 850)
        elseif keyReleased("left") then
            scaleObject('selectArrow', 0.5, 0.5)
            setProperty('selectArrow.y', 265)
            setProperty('selectArrow.x', 250)
        end

        if keyJustPressed("left") and menuTrue then
            playSound('scrollMenu', 0.7)
            if charNum == 1 then
                charNum = #characters
            else
                charNum = charNum - 1
            end
            triggerEvent("Change Character", "0", characters[charNum])
        end
        screenCenter("charName", "x")
        if keyJustPressed("back") then
            selectedChar = true
            startCountdown()
            restartSong()
        end
    end
        if keyJustPressed("space") and menuTrue then
            runHaxeCode('FlxG.sound.music.stop();')
            doTweenY('downFade1', 'Downfade', 3250, 1.75, circInOut)
            doTweenY('UpFade1', 'Upfade', 1250, 1.75, circInOut)
            doTweenAlpha('Bf', 'boyfriend', 0, 0.25)
            doTweenAlpha('unknown', 'unknown', 0, 0.25)
            runTimer('resetStuff', 1)
            selectedChar = true
            runTimer('startUp', 1.5)
            setProperty("charName.visible", false)
            setProperty("charSelect.visible", false)
        end
        setTextString("charName", characterNames[charNum])
    
end

function onTimerCompleted(tag)
    if tag == 'startUp' then
        startCountdown()
    elseif tag == 'resetStuff' then
        if not getPropertyFromClass('ClientPrefs', 'hideHud') then
            setProperty('scoreTxt.visible', true);
            setProperty('healthBar.visible', true);
            setProperty('healthBarBG.visible', true);
            setProperty('iconP1.visible', true);
            setProperty('iconP2.visible', true);
        end
        setProperty('boyfriend.visible', true)
        removeLuaSprite('unknown', true)
        removeLuaSprite('Downfade', true)
        removeLuaSprite('BG', true)
        removeLuaSprite('selectArrow', true)
        removeLuaSprite('selectArrow2', true)
        doTweenAlpha('Bf2', 'boyfriend', 1, 0.1)
        menuTrue = false
    end
end

function onStartCountdown()
    if not isStoryMode then
        if not selectedChar then
            return Function_Stop
        elseif selectedChar then
            menuTrue = false
            removeLuaSprite('Upfade', true)
        end
    end
end
