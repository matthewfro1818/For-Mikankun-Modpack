--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Transition Amusia' then
triggerEvent('Camera Follow Pos',"640","150")
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
    callScript('stages/Disabled','FlipStrum',{-(screenWidth / 4),'playerStrums'})
    callScript('stages/Disabled','FlipStrum',{(screenWidth / 4),'StrumNote'})
    doTweenAlpha('HudTrans','camHUD',0,4*(stepCrochet/1000),'linear')
end
if tag=='HudTrans' then
    FlipBar=true
    setProperty('healthBar.flipX',true)
    setProperty('iconP1.flipX',true)
    setProperty('iconWiggly.flipX',true)
    healthBarWidth= getProperty('healthBar.width')
    healthBarX = getProperty('healthBar.x')
triggerEvent('Change Character','dad','Disabled')
triggerEvent('Change Character','bf','Ponyta_Perspective')
setProperty('dad.idleSuffix','')
characterDance('dad')
callScript('stages/Disabled','ChangeZoom',{0.15,'dad'})
scaleObject('plateR',1,1)
setProperty('plateR.offset.y',80)
setProperty('boyfriend.y',150)
    setProperty('dad.y',-5)
setGraphicSize('plateL',getProperty('plateL.width')/ 1.75,getProperty('plateL.height')/ 1.75)
	setProperty('plateL.offset.y',20)
    setProperty('plateL.offset.x',140)
    doTweenX('TransDADFinal','dad',710,stepCrochet/1000*8,'circOut')
    doTweenX('TransBFFinal','boyfriend',20,stepCrochet/1000*8,'circOut')
    doTweenAlpha('HudTransEnd','camHUD',1,4*(stepCrochet/1000),'linear')

end
if tag=='TransBFFinal' then
    triggerEvent('Camera Follow Pos',"","")
end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function onUpdate(elapsed)
    if FlipBar then
    healthBarPercent = getProperty('healthBar.percent')
    XoffsetP2=healthBarX+(healthBarWidth*healthBarPercent*0.01)+(150 *getProperty('iconP1.scale.x') - 150) / 2 - 26
    XoffsetP1=healthBarX+(healthBarWidth*healthBarPercent*0.01)-(150 *getProperty('iconP2.scale.x')) / 2 - 26* 2
    
    end
end
function onUpdatePost(elapsed)
    if FlipBar then
    setProperty('iconP2.x',XoffsetP2)
    setProperty('iconP1.x',XoffsetP1) 
    end
end
function onCreate()
    FlipBar=false
    

end