--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Amusia Background Change' then
    doTweenAlpha('VigetteChange','Static',Lerp(0,0.25,1),8*(stepCrochet/1000),'circIn')
    doTweenAlpha('VigetteChange2','StaticOverlay',Lerp(0,0.6,1),8*(stepCrochet/1000),'circIn')
   
end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function onTweenCompleted(tag)
if tag=='VigetteChange' then
    callScript('stages/Disabled','ChangeIntensity',{0.75})
    setProperty('background2.visible',true)
    setProperty('background1.visible',false)
    doTweenAlpha('VigetteLast','Static',Lerp(0,0.25,0.25),4*(stepCrochet/1000),'circOut')
    doTweenAlpha('VigetteLast2','StaticOverlay',Lerp(0,0.6,0.25),4*(stepCrochet/1000),'circOut')
end
end