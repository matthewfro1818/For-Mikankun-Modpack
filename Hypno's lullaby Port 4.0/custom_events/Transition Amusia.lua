--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Transition Amusia' then
setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',true)
doTweenX('TransDAD','dad',getCharacterX('dad')+screenWidth,stepCrochet/1000*8,'circIn')
doTweenX('TransBF','boyfriend',getCharacterX('bf')-screenWidth,stepCrochet/1000*8,'circIn')
doTweenAlpha('TransitionVigette','Static',Lerp(0,0.25,0.4),8*(stepCrochet/1000),'circIn')
doTweenAlpha('TransitionVigette2','StaticOverlay',0.4,8*(stepCrochet/1000),'circIn')
callScript('custom_events/Vignette Fade.lua','ChangeMaxAlpha',{0.4,'StaticOverlay'})
end
end
function onTweenCompleted(tag)
if tag=='TransitionVigette2' then
    callScript('stages/Disabled','ChangeIntensity',{1.25})
    for i=0,7 do
        noteTweenAngle('Rotation'..tostring(i),i,360,16*(stepCrochet/1000),'cubeInOut')
    end
    callScript('stages/Disabled','FlipStrum')
    doTweenAlpha('HudTrans','camHUD',0,4*(stepCrochet/1000),'linear')
end
if tag=='HudTrans' then
    callScript('scripts/Stuff/PlayStuff.lua','FlipHealthBar')
    setProperty('iconWiggly.flipX',true)
triggerEvent('Change Character','dad','Disabled')
triggerEvent('Change Character','bf','Ponyta_Perspective')
setProperty('dad.idleSuffix','')
characterDance('dad')
callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{-256-64,-128+256})
callScript('stages/Disabled','ChangeZoom',{0.15,'dad'})
--loadGraphic('plateR','stage/Disabled/Purple_place')
setGraphicSize('plateR',getProperty('plateR.width'),getProperty('plateR.height'))
setProperty('plateR.offset.y',getProperty('plateR.offset.y')+96+60)
setProperty('boyfriend.y',getProperty('boyfriend.y')+284)
    setProperty('dad.y',getProperty('dad.y')-60)
    --loadGraphic('plateL','stage/Disabled/Purple_place')
    setGraphicSize('plateL',getProperty('plateL.width')/ 1.75,getProperty('plateL.height')/ 1.75)
	setProperty('plateL.offset.y',getProperty('plateL.offset.y')-68)
    setProperty('plateL.offset.x',128)
    doTweenX('TransDADFinal','dad',710,stepCrochet/1000*8,'circOut')
    doTweenX('TransBFFinal','boyfriend',20,stepCrochet/1000*8,'circOut')
    doTweenAlpha('HudTransEnd','camHUD',1,4*(stepCrochet/1000),'linear')

end
if tag=='TransBFFinal' then
    setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',false)
end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end