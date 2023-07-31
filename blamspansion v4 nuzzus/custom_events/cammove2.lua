function onEvent(name)

 if name== 'cammove2' then
doTweenAngle('woah', 'camHUD', getProperty('camHUD.angle') + -60, 0.2, 'circInOut')

doTweenAngle('woah2', 'camGame', getProperty('camGame.angle') + -60, 0.2, 'circInOut')
end
end