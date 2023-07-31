
function onEvent(eventName, value1, value2)
if eventName=='check if died' then
    if getProperty('haha2.visible') == true then
        triggerEvent('disabled attacks',"F/l/e/d /s/u/c/c/e/s/f/u/l/l/y/!",'Failed')
        health = getProperty('health')
        setProperty('health', health- 0);
    else
        triggerEvent('disabled attacks',"C/o/u/l/d/n/t /g/e/t /a/w/a/y/././.",'Failed')
        function onStepHit()
            health = getProperty('health')
            setProperty('health', health - 0.1);
        end
    end
end
end

