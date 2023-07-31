function onCreatePost()
    initSaveData('HypnosPref')
    makeLuaSprite('FiltreRef')
	if shadersEnabled then
		runHaxeCode([[
			var shaderName = "glitch";
    
			var shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
			game.camHUD.setFilters([new ShaderFilter(shader0)]);
			game.getLuaObject("FiltreRef").shader = shader0;
		]])
	end
end
local UpdateGlitch=false
function onUpdate(elapsed)
    if UpdateGlitch then 
        setShaderFloat('FiltreRef','time',(math.floor((getSongPosition() / crochet)) * crochet) / 1000)
    end
end
--Value1:Update time/Set Actual Time
--Value2:Set Prop
function onEvent(eventName, value1, value2)
    if eventName=='MissingnoGlitchHell' and getDataFromSave('HypnosPref','Hell mode',false) then
        local Result=stringSplit(value1,'/')
        if Result[1]=='true' then
            UpdateGlitch=true
        else
            UpdateGlitch=false
        end
        if Result[2]=='true' then
            setShaderFloat('FiltreRef','time',(math.floor((getSongPosition() / crochet)) * crochet) / 1000)
        end
        
        if value2=='' then
            
        else
            setShaderFloat('FiltreRef','prob',tonumber(value2))
        end
    end
end


--MissingnoGlitchHell