function onCreate()
    makeLuaSprite('jumpscare','stage/Mountain/Pikachu')
    setGraphicSize('jumpscare',screenWidth,screenHeight )
    setObjectCamera('jumpscare','other')
    screenCenter('jumpscare','xy')
    precacheSound('Frostbite_ending')
end
local Frostbitending=false
function onEvent(tag)
    if tag=='End_Frostbite' then
        setGlobalFromScript('scripts/Stuff/HypnosPauseState','CanPause',false)
        Frostbitending=true
        playSound('Frostbite_ending',1)
        setPropertyFromClass('PlayState','seenCutscene',true)
        setProperty('camGame.visible',false)
        setProperty('camHUD.visible',false)
        setProperty('Fog.visible',false)
        runTimer('Jumpscare',10.12,1)
        
        makeLuaSprite('Chomatic')
        if shadersEnabled then
            runHaxeCode([[
                var shaderName = "aberration";
                
                game.initLuaShader(shaderName);
                
                var shader0 = game.createRuntimeShader(shaderName);
                game.camOther.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("Chomatic").shader = shader0;
        
            ]])
        end
    end
end
local abbCur = 0.75
local abbTarget = 0.75
local imgScaleCur = 0.65
local imgScaleTarget = 0.65
function onUpdate(elapsed)
    if luaSpriteExists('Jumpscare') then
        imgScaleCur = Lerp(imgScaleCur, imgScaleTarget, (elapsed / (1 / 120)) * 0.15)
        scaleObject('Jumpscare',imgScaleCur,imgScaleCur)
    end
    if Frostbitending and shadersEnabled then
        abbCur=Lerp(abbCur,abbTarget,(elapsed / (1 / 120)) * 0.06)
        setShaderFloat('Chomatic','aberration',abbCur)
        setShaderFloat('Chomatic','effectTime',abbCur)

    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
 end
function onTimerCompleted(tag)
if tag=='Jumpscare' then
    addLuaSprite('jumpscare',false)
    cameraShake('other',0.008, 3.08)
    runTimer('EndSong',3.08,1)
    imgScaleTarget = 0.35
	abbTarget = 0.35
end
if tag == 'EndSong' then
    Frostbitending=false
end
end


