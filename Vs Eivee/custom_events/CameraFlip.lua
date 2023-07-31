function onEvent(name, value1, value2)
if name == 'CameraFlip' then
 doTweenAngle('bruh', 'camera', 180, 0.2, 'linear')
playSound('cameraFlip', true)
characterPlayAnim('dad', 'SwingUp', true)

end
end