function onEvent(name)

 if name== 'cammove' then
doTweenAngle('woah', 'camHUD', getProperty('camHUD.angle') + 30, 0.2, 'circInOut')

doTweenAngle('woah2', 'camGame', getProperty('camGame.angle') + 30, 0.2, 'circInOut')
end
end