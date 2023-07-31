function onCreate()
    ponytaflash={true,false}
    startflashingpony = false
    noa = 1
end
function onEvent(eventName, value1, value2)
    if eventName == 'Player flash' then
    runTimer('ponytaflashe', 0.1, 6)
    runTimer('timers', 0.7)
    startflashingpony = true
    end
end

function onUpdate()
    if noa > 2 then
        noa = 1
    end
end

function onStepHit()
if startflashingpony == true then
    setProperty('boyfriend.visible',ponytaflash[noa])
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ponytaflashe' then
        if startflashingpony == true then
    noa = noa+ 1
        end
    end
    if tag == 'timers' then
        noa = 1
        startflashingpony = false
    end
end