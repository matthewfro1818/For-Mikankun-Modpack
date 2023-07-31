function onCreate()
    disabledflash={true,false}
    startflashing = false
    yeah = 1
end
function onEvent(eventName, value1, value2)
    if eventName == 'Opponent flash' then
    runTimer('disabledflashe', 0.1, 6)
    runTimer('timers', 0.7)
    startflashing = true
    end
end

function onUpdate()
    if yeah > 2 then
        yeah = 1
    end
end

function onStepHit()
if startflashing == true then
    setProperty('dad.visible',disabledflash[yeah])
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'disabledflashe' then
        if startflashing == true then
    yeah = yeah+ 1
        end
    end
    if tag == 'timers' then
        startflashing = false
    end
end