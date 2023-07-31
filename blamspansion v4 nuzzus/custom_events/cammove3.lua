function onEvent(name)

 if name== 'cammove3' then
doTweenAngle('woah', 'camHUD', getProperty('camHUD.angle') + 90, 0.2, 'circInOut')

doTweenAngle('woah2', 'camGame', getProperty('camGame.angle') + 90, 0.2, 'circInOut')
end
end