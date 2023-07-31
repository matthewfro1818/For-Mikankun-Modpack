cameramoving = false
currentsegment = "finale"


local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and not seenCutscene then --Block the first countdown
        startVideo('oldfinale');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end
function onCreate()
    setProperty('iluminao omaga.alpha',0)

    makeLuaSprite('cargopreload', 'Finale2/cargo', -1600, -350);
    addLuaSprite('cargopreload');
    scaleObject('cargopreload', 3, 2.5)

    makeLuaSprite('gradientpreload', 'Finale2/Gradient', -1600, -350);
    addLuaSprite('gradientpreload',true);
    scaleObject('gradientpreload', 3, 2.5)

    makeLuaSprite('vigdrop', 'Finale2/VignetteFin', 0, -175);
    addLuaSprite('vigdrop',true);
    scaleObject('vigdrop', 1, 1)

    setProperty('cargopreload.alpha',0)
    setProperty('gradientpreload.alpha',0)
    setProperty('vigdrop.alpha',0)

    precacheImage('bg')
    precacheImage('plat')
    precacheImage('vig')
end


function onStepHit()
    if curStep == 127 then
        doTweenAlpha('bftween','boyfriend',1,13.4,"Linear")

    end
    if curStep == 256 then
        doTweenAlpha('backgroundtween','iluminao omaga',1,13.4,"Linear")
        doTweenAlpha('dadtween','dad',1,13.4,"Linear")
    end
    if curStep == 1344 then
        cameraFlash('camHud', 'ff000d', 0.6,true)
        cameramoving = true
        currentsegment = "Danger"
        doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
        doTweenAngle('camturn', 'camHUD', -1.5, crochet/300, 'sineInOut')
        addAnimationByPrefix('blacklegssprite', 'legmovement', 'legs', 24, true)
        objectPlayAnimation('blacklegssprite', 'legmovement')
        setProperty('blacklegssprite.alpha',1)

        setProperty('boyfriend.x',1800)
        setProperty('boyfriend.y',625)
    
        setProperty('dad.x',560)
        setProperty('dad.y',90)

        updateHitbox('boyfriend')
        updateHitbox('dad')
        setProperty('iluminao omaga.alpha',0)

    end
    if curStep == 1856 then
        cameraFlash('camHud', 'ff000d', 0.6,true)
        cameramoving = false
        currentsegment = "finale"

        cancelTween('camturn1')
        cancelTween('turn1')
        cancelTween('camturn')
        cancelTween('turn')
        setProperty('blacklegssprite.alpha',0)

        setProperty('boyfriend.x',1100)
        setProperty('boyfriend.y',450)
    
        setProperty('dad.x',440)
        setProperty('dad.y',180)

        updateHitbox('boyfriend')
        updateHitbox('dad')
        
        setProperty('bg.alpha',0)
        setProperty('plat.alpha',0)
        setProperty('vig.alpha',0)
        setProperty('iluminao omaga.alpha',1)
        setProperty('blacklegssprite.alpha',0)

    end
    if curStep == 2368 then
        cameraFlash('camHud', 'ff000d', 0.6,true)

        cameramoving = true
        currentsegment = "Danger"

        doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
        doTweenAngle('camturn', 'camHUD', -1.5, crochet/300, 'sineInOut')
        addAnimationByPrefix('blacklegssprite', 'legmovement', 'legs', 24, true)
        objectPlayAnimation('blacklegssprite', 'legmovement')
        setProperty('blacklegssprite.alpha',1)
        
        setProperty('boyfriend.x',1800)
        setProperty('boyfriend.y',625)
    
        setProperty('dad.x',560)
        setProperty('dad.y',90)

        updateHitbox('boyfriend')
        updateHitbox('dad')

        setProperty('bg.alpha',1)
        setProperty('plat.alpha',1)
        setProperty('vig.alpha',1)
        setProperty('iluminao omaga.alpha',0)
        setProperty('blacklegssprite.alpha',1)

    end
    if curStep == 2624 then
        cameraFlash('camHud', 'ff000d', 0.6,true)

        cameramoving = false
        currentsegment = "finale"

        cancelTween('camturn1')
        cancelTween('turn1')
        cancelTween('camturn')
        cancelTween('turn')
        setProperty('blacklegssprite.alpha',0)

        setProperty('boyfriend.x',1100)
        setProperty('boyfriend.y',450)
    
        setProperty('dad.x',440)
        setProperty('dad.y',180)

        updateHitbox('boyfriend')
        updateHitbox('dad')

        setProperty('bg.alpha',0)
        setProperty('plat.alpha',0)
        setProperty('vig.alpha',0)
        setProperty('iluminao omaga.alpha',1)
        setProperty('blacklegssprite.alpha',0)

    end
    if curStep == 3200 then
        cameraFlash('camHud', 'ff000d', 1.25,true)
        currentsegment = "doublekill"
        setProperty('cargopreload.alpha',1)
        setProperty('gradientpreload.alpha',1)
        setProperty('vigdrop.alpha',1)
        setProperty('dad.y',275)
        setProperty('boyfriend.y',535)
        removeLuaSprite('lol thing')
        removeLuaSprite('deadBG')
        removeLuaSprite('deadFG')
    end
    if curStep == 3727 then
        cameraFlash('camGame', 'ff000d', 0.2,true)
        currentsegment = "finale"
        setProperty('cargopreload.alpha',0)
        setProperty('gradientpreload.alpha',0)
        setProperty('vigdrop.alpha',0)

        makeLuaSprite('lol thing', 'defeat/lol thing', -600, -200);
        addLuaSprite('lol thing', false);
        scaleObject('lol thing', 1.3, 1.3) 
        
        makeLuaSprite('deadBG', 'defeat/deadBG', -600, 425);
        addLuaSprite('deadBG', false);
        scaleObject('deadBG', 0.4, 0.4) 
        
        makeLuaSprite('deadFG', 'defeat/deadFG', -650, 800);
        addLuaSprite('deadFG', true);
        scaleObject('deadFG', 0.5, 0.5) 
        setScrollFactor('deadFG', 2.5, 1.5)
        setProperty('dad.y',175)
        setProperty('boyfriend.y',435)
    end
end


function onUpdate()
    setProperty('gf.alpha', 0);
    if curStep <= 126 then
        setProperty('boyfriend.alpha',0)
    end
    if curStep <= 256 then
        setProperty('dad.alpha',0)
    end
    if cameramoving == false then
        setProperty('camGame.angle',0)
        setProperty('camHUD.angle',0)
    end
end



function onTweenCompleted(t)
    if cameramoving == true then
        if t == 'turn' then
            doTweenAngle('turn1', 'camGame', -1.5, crochet/300, 'sineInOut')
            doTweenAngle('camturn1', 'camHUD', 1.5, crochet/300, 'sineInOut')
        end
        if t == 'turn1' then
            doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
            doTweenAngle('camturn', 'camHUD', -1.5, crochet/300, 'sineInOut')
        end 
    end

end