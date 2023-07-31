function onCreate()
    makeLuaSprite("tempShader0")


    initLuaShader('brimstoneCamEffects',150)
    targetGBvalue=0
    ShaderGB=false
    actualGB=0
    GBEnd=false
end
function onEvent(tag,v1,v2)
    if tag=='Filtrer' and shadersEnabled then
   
    if v2 == 'Game' then
        Pokemon(v1)
        Characters(v1)
        Stages(v1)
    elseif v2 =='Characters' then
        Characters(v1)
        Pokemon(v1)
    elseif v2 =='Stage' then
        Stages(v1)
    elseif v2 =='All' then
        All(v1)
       
    end

    end

end
function Stages(shader0)
    if shader0=='' then
      
        removeSpriteShader('Back')
        removeSpriteShader('Floor')
        removeSpriteShader('Graves')
    else
 setSpriteShader('Back',shader0)
 setSpriteShader('Floor',shader0)
 setSpriteShader('Graves',shader0)
    end
end
function Characters(shader9)
    if shader9=='' then
        removeSpriteShader('BF')
        removeSpriteShader('Buryman')

    else
    setSpriteShader('BF',shader9)
    setSpriteShader('Buryman',shader9)
    end
end
function Pokemon(shader8)
    if shader8=='' then
        removeSpriteShader('boyfriend')
        removeSpriteShader('dad')

    else
    setSpriteShader('boyfriend',shader8)
    setSpriteShader('dad',shader8)
    end
end
function All(shader7)
    if shader7 == ''  then
         
        GBEnd=true
        
        if actualGB>=0.99 then targetGBvalue=0 end
    elseif shader7=='brimstoneCamEffects' then
    local Shader=shader7
    runHaxeCode([[
        var shaderName = "]]..Shader..[[";
        

        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        
    ]])
    setShaderFloat('tempShader0','intensity',0)
    targetGBvalue=1
    ShaderGB=true

    end

end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function onUpdate(elapsed)
    if shadersEnabled then
        if ShaderGB then
            actualGB=getShaderFloat('tempShader0','intensity')
            actualGB=Lerp(actualGB,targetGBvalue,0.025)   
            setShaderFloat('tempShader0','intensity',actualGB)
        else
            actualGB=0
        end
        if GBEnd and targetGBvalue==0 and actualGB<=0.01 then
            ShaderGB=false
            actualGB=0
            GBEnd=false
            runHaxeCode([[
                game.camGame.setFilters([]);
                game.camHUD.setFilters([]);
                game.getLuaObject("tempShader0").shader = null; 
            ]])
        end
    end

end