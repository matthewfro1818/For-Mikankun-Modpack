function onEvent(eventName, value1, value2)
    if eventName=='EjectedStart' then
        removeLuaSprite('Black')
        cameraFlash('other','FFFFFF',(stepCrochet/1000)*4,false)
    end
end