function onEvent(name)

 if name== 'cammove4' then
doTweenAngle('woah', 'camHUD', getProperty('camHUD.angle') + 360, 0.2, 'circInOut')

doTweenAngle('woah2', 'camGame', getProperty('camGame.angle') + 360, 0.2, 'circInOut')
end
end