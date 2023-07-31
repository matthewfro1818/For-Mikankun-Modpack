function onCreate()
    makeLuaSprite("sexyred", "kittensBareBreasts.png", 0.0, 0.0)
    makeGraphic("sexyred", 1280, 720, "ff0000")
    addLuaSprite("sexyred", false)
    setObjectCamera("sexyred", "camOther")
    setProperty("sexyred.alpha", 0)
end

function onUpdate(elapsed)   
    if curStep == 1616 then
        doTweenAlpha('assesa','camGame',0,1/playbackRate,'sineInOut')
        doTweenAlpha('asses','camHUD',0,1/playbackRate,'sineInOut')
    end
    if curStep == 1737 then
        doTweenAlpha('assesa','camGame',1,0.5/playbackRate,'quadOut')
        doTweenAlpha('asses','camHUD',1,0.5/playbackRate,'quadOut')
        doTweenAlpha('redFadeinout','sexyred',0,0.5/playbackRate,'quadOut')
    end
    if curStep > 2328 then
        endSong()
        setProperty("playbackRate", 1)
    end
end

function onBeatHit()
    if curStep > 1632 and curStep < 1737 then
        if curBeat % 4 == 2 then
            doTweenAlpha('redFadeinout','sexyred',1,0.5/playbackRate,'sineInOut')
        elseif curBeat % 4 == 3 then
            doTweenAlpha('redFadeinout','sexyred',0,1/playbackRate,'sineInOut')
        end
    end
end