function onEvent(name, value1, value2)
if name == 'CameraFlipBack' then
 doTweenAngle('bruh', 'camera', 0, 0.2, 'linear')
playSound('cameraFlip', true)
characterPlayAnim('dad', 'SwingDown', true)

end
end