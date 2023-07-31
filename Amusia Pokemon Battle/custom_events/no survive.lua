--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='no survive' then
doTweenX('dontdieX', 'dontdie', 950, 0.35, backOut)
doTweenY('dontdieY', 'dontdie', 0, 0.35, backOut)
scaleObject('dontdie', 0.5, 0.5)
end
end
