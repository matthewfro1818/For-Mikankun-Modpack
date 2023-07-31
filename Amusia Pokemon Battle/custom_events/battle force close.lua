--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='battle force close' then
    if getProperty('battletext.visible') then
        playSound('confirmText',1)
        Question=false
    setProperty('battletext.visible',false)
    setProperty('moveselector.visible',false)
    setProperty('flareblitz.visible',false)
    setProperty('ember.visible',false)
    setProperty('protect.visible',false)
    setProperty('morningsun.visible',false)
    setProperty('battlestext.visible',false)
    end
end
end
