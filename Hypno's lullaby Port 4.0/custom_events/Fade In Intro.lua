function onEvent(eventName, value1, value2)
    if eventName=='Fade In Intro' then
        doTweenAlpha('Intro','camGame',1,2.5,'quadInOut')
        doTweenZoom('IntroZoom','camGame',getProperty('defaultCamZoom')-0.3,5,'quadOut')
    end
end
function onCreatePost()
    setProperty('camGame.alpha',0)
end
function onTweenCompleted(tag)
    if tag=='IntroZoom' then
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')-0.3)
    end
end