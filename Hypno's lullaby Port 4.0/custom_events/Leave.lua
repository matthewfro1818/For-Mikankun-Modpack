--[[
    Code made by Drawoon_
]]
local OriginalPos={}
function onCreate()
    ShaderActive=false
  makeAnimatedLuaSprite('GengarLeave', 'characters/Buryman/enter_gengar', getCharacterX('dad')+425, getCharacterY('dad')+45)
    addAnimationByIndices('GengarLeave', 'Idle', 'gengar entrance', '56,55,54,53,52,51,50,49,48',24 )
    scaleObject('GengarLeave',6,6)
    setProperty('GengarLeave.antialiasing',false)
    
    initLuaShader('desaturation')
    initLuaShader('vignetteApparition')
   makeLuaSprite('ShaderA','ShadersImage',0,0)
   setGraphicSize('ShaderA',screenWidth,screenHeight)
   setObjectCamera('ShaderA','other')
   addLuaSprite('ShaderA')
   makeLuaSprite('desaturation',nil,1,0)
end
function onCreatePost()
    OriginalPos={getMidpointX('dad')+getProperty('dad.cameraPosition[0]')+150,getMidpointY('dad')+ -100+getProperty('dad.cameraPosition[1]')}
    if shadersEnabled then
        setSpriteShader('Back','desaturation')
        setSpriteShader('Floor','desaturation')
        setSpriteShader('Graves','desaturation')
        setShaderFloat('Graves','distortionTime',0)
        setShaderFloat('Graves','desaturationAmount',1)
        setShaderFloat('Graves','amplitude',0)
    end
end
function onEvent(name, value1, value2)
    if name=='Leave' then
        if value1=='Missingno' then
            doTweenY('DespawnMissingno', 'Missingno', getProperty('Missingno.y') + getProperty('Missingno.height') * 2, (stepCrochet * 24) / 1000, 'circInOut')
            setProperty('gengarEntrace.visible',true)
            playAnim('gengarEntrace','leave')
            setProperty('Gengar.visible',false)
        elseif value1=='Leanmonster' then
            CharPlayAnim('Muk','Outro',true)
            
            makeLuaSprite('TemporalCamera',nil,OriginalPos[1],OriginalPos[2])
            if shadersEnabled then
                ShaderActive=true
                doTweenX('Amount','desaturation',0,(stepCrochet * 32) / 1000,'sineIn')
                doTweenY('amplitude','desaturation',0.1,(stepCrochet * 32) / 1000,'sineIn')
            end
            setGlobalFromScript('scripts/Stuff/CameraMove','CanBooping',false)
            
            doTweenX('CameraMoving','TemporalCamera',OriginalPos[1]+175,(stepCrochet*32)/1000,'sineIn')
            doTweenY('CameraMoving2','TemporalCamera',OriginalPos[2]-150,(stepCrochet*32)/1000,'sineIn')
            doTweenZoom('EpicAppZoom', 'camGame', 0.9, (stepCrochet * 32) / 1000, 'sineIn')
        end
    end
end
local StayZoom=false
function onUpdate(elapsed)
    if luaSpriteExists('TemporalCamera') then
        setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{getProperty('TemporalCamera.x'),getProperty('TemporalCamera.y')})
    end

    if getProperty('gengarEntrace.animation.curAnim.finished') and getProperty('gengarEntrace.animation.curAnim.name')=='leave' and getProperty('gengarEntrace.visible') then
        setProperty('gengarEntrace.visible',false)
    end
    if getProperty('Muk.animation.curAnim.finished') and getProperty('Muk.animation.curAnim.name')=='Outro' and getProperty('Muk.visible') then
        setProperty('Muk.visible',false)
    end
    if ShaderActive then
    setShaderFloat('Graves','desaturationAmount',getProperty('desaturation.x'))
    setShaderFloat('Graves','amplitude',getProperty('desaturation.y'))
    setShaderFloat('Graves','distortionTime',getShaderFloat('Graves','distortionTime')+((elapsed / (1 / 60)) * 0.0125) / 2)
    setShaderFloat('ShaderA','time',getSongPosition() / (stepCrochet * 8))
    end
end
function onUpdatePost(elapsed)
    if StayZoom then
        setProperty('camGame.zoom',0.9)
    end
end
function onTweenCompleted(tag)
    if tag == 'DespawnMissingno' then
        setProperty('Missingno.visible',false)
    end
    if tag=='CameraMoving2' then
        setSpriteShader('ShaderA','vignetteApparition')
        runTimer('CameraMovingFinalDelay',(stepCrochet * 16) / 1000)
    end
    if tag=='CameraMovingFinal2' then
        setGlobalFromScript('scripts/Stuff/CameraMove','CanBooping',true)
        removeLuaSprite('TemporalCamera',true)
    end
    if tag=='EpicAppZoom' then
        setProperty('camGame.zoom',0.9)
        StayZoom=true
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='CameraMovingFinalDelay' then
        setProperty('camGame.zoom',0.9)
        doTweenZoom('EpicZoomFinal', 'camGame', getProperty('defaultCamZoom'), (stepCrochet * 32) / 1000, 'sineOut')
        StayZoom=false
        doTweenX('CameraMovingFinal','TemporalCamera',OriginalPos[1],(stepCrochet*32)/1000,'sineOut')
        doTweenY('CameraMovingFinal2','TemporalCamera',OriginalPos[2],(stepCrochet*32)/1000,'sineOut')
    end
end
function CharPlayAnim(Char,anim,force)
    playAnim(Char,anim,force)
    setProperty(Char..'.specialAnim',true)
end
