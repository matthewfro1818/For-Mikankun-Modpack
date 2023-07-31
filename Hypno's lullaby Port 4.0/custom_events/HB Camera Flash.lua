function onEvent(eventName, value1, value2)
    if eventName=='HB Camera Flash' then
        makeLuaSprite('camflash',nil,-screenWidth,-screenHeight)
        makeGraphic('camflash',screenWidth * 3,screenHeight * 3,'FFFFFF')
        screenCenter('camflash')
        setScrollFactor('camflash',0,0)
        addLuaSprite('camflash',true)

        setProperty('camflash.alpha',0.6)
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')+ 0.08)

        doTweenAlpha('FlashHB','camflash',0,0.5,'linear')
    end
end
function onTweenCompleted(tag)
    if tag=='FlashHB' then
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')+ 0.08)
        setProperty('camflash.alpha',0.7)
        doTweenAlpha('FlashHB2','camflash',0,0.7,'linear')
    end
    if tag=='FlashHB2' then
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')- 0.16)
        setProperty('camflash.alpha',1)
        doTweenAlpha('FlashHB3','camflash',0,1.5,'linear')
    end
end