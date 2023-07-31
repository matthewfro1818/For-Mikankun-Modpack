function onEvent(eventName, value1, value2)
    if eventName =='P3 Ending' then
        addLuaSprite('HypnoEnd')
        setProperty('dad.alpha',0)
        playAnim('HypnoEnd','Ending')
    end
end