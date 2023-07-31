function onStepHit()
    if curStep == 1 then
        setProperty('camGame.zoom', 0.65)
    end
    if curStep == 10 then
        setProperty('camGame.zoom', 0.7)
    end
    if curStep == 14 then
        setProperty('camGame.zoom', 0.75)
    end
    if curStep == 16 then
        setProperty('camGame.zoom', 0.8)
    end
    if curStep == 26 then
        setProperty('camGame.zoom', 0.85)
    end

    if curStep == 30 then
        setProperty('camGame.zoom', 0.9)
    end
    if curStep == 32 then
        setProperty('camGame.zoom', 0.95)
    end
    if curStep == 42 then
        setProperty('camGame.zoom', 1.0)
    end
    if curStep == 46 then
        setProperty('camGame.zoom', 1.05)
    end
    if curStep == 48 then
        setProperty('camGame.zoom', 1.1)
    end
    if curStep == 58 then
        setProperty('camGame.zoom', 1.15)
    end
    if curStep == 63 then
        setProperty('camGame.zoom', 1.2)
    end
    if curStep == 65 then
        doTweenZoom('oooh','camGame', 0.6, 5, 'linear')
    end
    if curStep == 1216 then
        doTweenZoom('tibbles','camGame', 1.2, 5, 'linear')
    end
    if curStep == 1373 then
        doTweenZoom('wee','camGame', 0.6, 2)
    end
end