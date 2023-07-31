local Parts=0
function onEvent(eventName, value1, value2)
    if eventName=='Pico Turn' then
        if Parts==0 then
            doTweenAlpha('StaticBackAlpha','StaticBack',1,(crochet/1000)*8,'expoOut')
        elseif Parts==1 then
            doTweenAlpha('StaticOtherAlpha','StaticOther',1,(stepCrochet/1000)*32,'expoOut')
            
        end
        Parts=Parts+1
    end
end
local isZooming=false
local CameraMove={}
function onUpdate(elapsed)
    
    if isZooming then
        local ease=(elapsed * 1.125)
        CameraMove[1]=Lerp(getProperty('Jiggly.x')+getProperty('Jiggly.width')/2,getProperty('camFollowPos.x'),ease)
        CameraMove[2]=Lerp(getProperty('Jiggly.y')+getProperty('Jiggly.height')/2,getProperty('camFollowPos.y'),ease)
        setProperty('defaultCamZoom',Lerp(1.95,getProperty('defaultCamZoom'),1 - ease))
        setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',CameraMove)
        
    end
    if getGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos')~= isZooming then
        setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',isZooming)
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function onTweenCompleted(tag)
    if tag=='StaticBackAlpha' then
        setProperty('Jiggly.visible',true)
        setProperty('nursejoy.visible',true)
        doTweenAlpha('StaticBackAlpha2','StaticBack',0,(crochet/1000)*3,'expoIn')
    end
    if tag=='StaticBackAlpha2' then
        playAnim('boyfriend','turn',true)
        setProperty('boyfriend.specialAnim',true)
        setProperty('boyfriend.idleSuffix','-turn')
        runTimer('Waiting',22+(getProperty('dad.animation.curAnim.numFrames')/18))
        isZooming=true
        
    end
    if tag=='StaticOtherAlpha' then
        setProperty('Jiggly.visible',false)
        setProperty('dad.visible',true)
        isZooming=false
        setProperty('defaultCamZoom',0.75)
        if luaSpriteExists('Pendelum') then
            doTweenAlpha('PendelumAlpha','Pendelum',0,(stepCrochet/1000)*5,'linear')
        end
        doTweenAlpha('StaticOtherAlpha2','StaticOther',0,(stepCrochet/1000)*3,'expoIn')
    end
    if tag=='StaticOtherAlpha2' then
        playAnim('boyfriend','knife',true)
        setProperty('boyfriend.specialAnim',true)
        setProperty('boyfriend.idleSuffix','')
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='Waiting' then
        playAnim('boyfriend','turnback',true)
        setProperty('boyfriend.specialAnim',true)
        setProperty('boyfriend.idleSuffix','-alt')
    end
end