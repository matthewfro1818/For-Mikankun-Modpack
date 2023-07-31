--Code made by Drawoon_
--if you use this please give me credit
--Independent code
function onEvent(eventName, value1, value2)
if eventName=='Red Aberration' then
    intensity=tonumber(value1)
    initial=tonumber(value2)
    

    MakeShaders()
    setShaderFloat('dad','intensity',intensity)
    setShaderFloat('dad','initial',initial)
end
end
function MakeShaders()
    initLuaShader('RedAberration')
    makeLuaSprite('RedFiltrers')
if shadersEnabled then
    runHaxeCode([[
        var shaderName = "vignetteGlitch";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("RedFiltrers").shader = shader0;
        shader0.setFloat("time",1);
        shader0.setFloat("prob",0);
        shader0.setFloat("vignetteIntensity",0.5);

    ]])
end
end
function onUpdate(elapsed)
newStep=toInt(getSongPosition()/(stepCrochet * 16))
falseIntensity=Lerp(falseIntensity,0,elapsed*2)
setShaderFloat('RedFiltrers','prob',0.75)
setShaderFloat('RedFiltrers','time',getSongPosition()/(stepCrochet * 16))

if OldStep~=newStep and newStep>OldStep then
    falseIntensity=intensity
    OldStep=newStep
end




end
function onCreate()
    falseIntensity=0
    OldStep=0
    intensity=0
    
end
function toInt(Float)
    newInt=stringSplit(tostring(Float),'.')
    return tonumber(newInt[1]);
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
