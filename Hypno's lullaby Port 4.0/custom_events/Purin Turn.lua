local Anim=false
function onEvent(eventName, value1, value2)
    if eventName=='Purin Turn' then
        if getProperty('dad.visible') then
            playAnim('dad','turn',true)
            setProperty('dad.specialAnim',true)
            Anim=true
            
            doTweenAlpha('StaticAlpha','StaticPurin',1,(getProperty('dad.animation.curAnim.numFrames')/24)-0.2)
        else
            setProperty('dad.visible',true)
            playAnim('dad','turn',true,true)
            setProperty('dad.specialAnim',true)
            callScript('scripts/Stuff/Character.lua','ChangeSingChar',{'dad','DAD'})
            setProperty('JigglyFront.visible',false)
            setProperty('opponentCameraOffset',{0,0})
            setProperty('defaultCamZoom',getProperty('defaultCamZoom')-0.55)
            doTweenAlpha('StaticAlphaFront','StaticPurin',0,(getProperty('dad.animation.curAnim.numFrames')/24)-0.2)
        end
    end
end
function onUpdate(elapsed)
    if Anim and not getProperty('dad.specialAnim') then
        Anim=false
        setProperty('dad.visible',false)
        callScript('scripts/Stuff/Character.lua','ChangeSingChar',{'JigglyFront','DAD'})
        setProperty('JigglyFront.visible',true)
        setProperty('opponentCameraOffset',{-40,240})
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')+0.55)
    end
end