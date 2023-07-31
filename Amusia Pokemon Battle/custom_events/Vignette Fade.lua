function onEvent(eventName, value1, value2)
if eventName=='Vignette Fade' then
    
 
doTweenAlpha('Vigette1','Static',Lerp(0,StaticMax,tonumber(value1)),tonumber(value2)*(stepCrochet/1000),'linear')
doTweenAlpha('Vigette2','StaticOverlay',Lerp(0,StaticOverlayMax,tonumber(value1)),tonumber(value2)*(stepCrochet/1000),'linear')

end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function ChangeMaxAlpha(NewAlpha,WhatAlpha)
if WhatAlpha=='StaticOverlay'then
    StaticOverlayMax=NewAlpha
else
    StaticMax=NewAlpha
end

end
function onCreate()
    StaticMax=0.25
    StaticOverlayMax=0.6
end
