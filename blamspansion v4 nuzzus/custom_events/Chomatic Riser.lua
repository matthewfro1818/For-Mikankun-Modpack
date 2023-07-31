--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Chomatic Riser' then
NewZoom=tonumber(value1)
TimeSteps=tonumber(value2)


if NewZoom>getProperty('Chomatic.x') then
    doTweenX('ChomaticRiser','Chomatic',NewZoom,(TimeSteps *stepCrochet) / 1000,'cubeIn')
else
    doTweenX('ChomaticRiser','Chomatic',NewZoom,(TimeSteps *stepCrochet) / 1000,'cubeOut')
end
end
end
function onCreate()
    makeLuaSprite('Chomatic')
if shadersEnabled then
    runHaxeCode([[
        var shaderName = "camEffects";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("Chomatic").shader = shader0;


    ]])
end
end
function onUpdate(elapsed)
setShaderFloat('Chomatic','distort',getProperty('Chomatic.x'))
end