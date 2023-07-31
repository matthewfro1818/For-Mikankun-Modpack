xmin = 0
xmax = 900
ymin = 100
ymax = 600

function onEvent(name)
    if name == 'eyes' then
        nametag = math.random(0, 1000)

        makeAnimatedLuaSprite(nametag, 'MarkovEyes', math.random(xmin, xmax), math.random(ymin, ymax))
        addAnimationByPrefix(nametag, 'MarkovWindow', 'MarkovWindow', 24, false)
        objectPlayAnimation(nametag, 'MarkovWindow', true)
        setObjectCamera(nametag, 'other')
        addLuaSprite(nametag, true)

        runTimer(nametag, 4.5, 0)
    end
end

function onTimerCompleted(timername)
    removeLuaSprite(timername, true)
end