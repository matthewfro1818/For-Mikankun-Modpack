function onCreate()
    if shadersEnabled then
    makeLuaSprite("AberrationShader")


    initLuaShader('camEffects',150)
    local Shader2='camEffects'
    runHaxeCode([[
        var Aberration = "]]..Shader2..[[";
        
        game.initLuaShader(Aberration);
        
        var shader1 = game.createRuntimeShader(Aberration);
        game.camGame.setFilters([new ShaderFilter(shader1)]);
        game.camHUD.setFilters([new ShaderFilter(shader1)]);
        
        game.getLuaObject("AberrationShader").shader = shader1;
 
        shader1.setFloat('distort', 3);
       
    ]])
    end

end
function onEvent(tag,v1,v2)
if tag=='Aberration' then
    if tonumber(v1)>getProperty('AberrationShader.x') then
doTweenX('AberrationTween','AberrationShader',tonumber(v1) ,(tonumber(v2) * stepCrochet ) / 1000,'cubeIn')
    else
        doTweenX('AberrationTween','AberrationShader',tonumber(v1) ,(tonumber(v2) * stepCrochet ) / 1000,'cubeOut')
    end
end
end
function onUpdate(elapsed)
    setShaderFloat('AberrationShader','distort',getProperty('AberrationShader.x'))
end