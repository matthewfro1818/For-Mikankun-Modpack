function onCreatePost()
    hasBeenHit = false
    addHaxeLibrary('Math')
    addHaxeLibrary('FlxStringUtil', 'flixel.util')
    makeLuaSprite("timebarBgDiscord", "hud/timebar", 0, 0)
    setObjectCamera("timebarBgDiscord", "camOther")
    addLuaSprite("timebarBgDiscord", false)
    setProperty("timebarBgDiscord.y", 720-getProperty("timebarBgDiscord.height"))
    setProperty('timeBarBG.visible', false)
    setObjectCamera("timeBar", "camOther")
    setProperty('timebarBgDiscord.alpha',0.8)
    setTimeBarColors("5865F2", "000000")
    setProperty('timeBar.x',339)
    setProperty('timeBar.y',660)
    setGraphicSize("timeBar", 883, 38)
    makeLuaSprite("pauseIcon", "hud/pause", 20, 0)
    ass = "?:??"
    currentTime = "?:??"
    makeLuaText("discordTime", "0:00 / "..ass, 1280, -950, 0.0)
    addLuaText("discordTime")
    setObjectCamera("discordTime", "camOther")
    setTextAlignment("discordTime", 'right')
    setTextSize("discordTime", 50)
    setProperty("discordTime.y", getProperty("timebarBgDiscord.y")+((getProperty("timebarBgDiscord.height")/2)-(getProperty("discordTime.height")/2)))
end

function onSongStart()
    ass = runHaxeCode("return FlxStringUtil.formatTime(Math.max(0, Math.floor(FlxG.sound.music.length / 1000)), false)")
end
function onUpdate(elapsed)
    if curStep > 1 then
        currentTime = runHaxeCode("return FlxStringUtil.formatTime(Math.max(0, Math.floor("..getSongPosition().." / 1000)), false)")
    end
        if curBeat < 2 then
        setProperty('timeTxt.visible',false)
        setProperty("timeBar.alpha", 0.8)
    end
    setTextString("discordTime", currentTime.." / "..ass)
end