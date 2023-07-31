function onEvent(eventName, value1, value2)
    if eventName=='GF Turn' then
        doTweenZoom('Zooming','FlxG.camera',0.52,0.3)
        doTweenAlpha('HUDAlpha','camHUD',0, 0.2)
        runTimer('ActiveIcon',1.5)
        runTimer('PlayDrop',2)
        addLuaSprite('HypnoEntrace',true)
        playAnim('HypnoEntrace','Entrance',true)

    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='PlayDrop' then
        playAnim('boyfriend','Drop',true)
        setProperty('boyfriend.specialAnim',true)
        setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',0)
    end
    if tag=='ActiveIcon' then
        makeAnimatedLuaSprite('HypnoIcon','icons/NEW_ABOMINATION_HYPNO_ICON',0,0)
        addAnimationByPrefix('HypnoIcon','idle','ABOMINATION HYPNO ICON instance 1',24,true)
        setObjectCamera('HypnoIcon','hud')
        addLuaSprite('HypnoIcon',true)
        if luaSpriteExists('Pendelum') then
            setProperty('Pendelum.visible',true)
            StartPendelum()
        end
        callScript('scripts/Stuff/PlayStuff','FlipHealthBar')
        runHaxeCode([[
            game.reloadHealthBarColors();
        ]])
        doTweenAlpha('HUDAlpha','camHUD',1, 0.2)
        for i=0,3 do 
            setPropertyFromGroup('strumLineNotes',i,'visible',true)
            setPropertyFromGroup('strumLineNotes',i,'alpha',0)
            if middlescroll then
                noteTweenAlpha('NOte'..i,i,0.35,0.2)
            else
                noteTweenAlpha('NOte'..i,i,1,0.2)
            end
        end
        
    end
end
function onUpdate(elapsed)
    if getProperty('boyfriend.animation.curAnim.name')=='Drop' and getProperty('boyfriend.animation.curAnim.finished') then
        setProperty('boyfriend.idleSuffix','')
        characterDance('bf')
        setProperty('boyfriend.cameraPosition',{-300,-50})
        makeLuaSprite('BFDead','stage/Cave/dead_ass_bitch_LMAOOOO',-95,935)
        scaleObject('BFDead',0.72,0.72)
        addLuaSprite('BFDead')
    end
    if getProperty('HypnoEntrace.animation.curAnim.name')=='Entrance' and getProperty('HypnoEntrace.animation.curAnim.finished') then
        setProperty('HypnoEntrace.visible',false)
        setProperty('dad.visible',true)
    end
end
function onCreate()
    precacheImage('stage/Cave/dead_ass_bitch_LMAOOOO')
    precacheImage('icons/NEW_ABOMINATION_HYPNO_ICON')
end
function onUpdatePost(elapsed)

setProperty('HypnoIcon.x',getProperty('iconP2.x')-60)

end

