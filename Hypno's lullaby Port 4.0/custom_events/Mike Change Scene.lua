function onEvent(eventName, value1, value2)
    if eventName=='Mike Change Scene' then
        setProperty('camGame.zoom',getProperty('camGame.zoom')+2.5)
        setProperty('boyfriend.visible',true)
        setProperty('background.visible',true)
        setProperty('portrait.visible',true)
        setProperty('lacama.visible',true)
        setProperty('laalmuada.visible',true)
        setProperty('iconP1.visible',true)
        for i=0,3 do
            setPropertyFromGroup('playerStrums',i,'visible',true)
        end
        SetCharacterDAD('Steven')
        setProperty('dad.cameraPosition',{-275,-155})
        setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.10)
    end
end
function onCreate()
    addCharacterToList('Steven','dad')
end
function SetCharacterDAD(CharacterName)
    runHaxeCode([[
        var lastAlpha:Float = game.dad.alpha;
        game.dad.alpha = 0;
        game.dad=game.dadMap.get(']]..CharacterName..[[');
        game.dad.alpha = lastAlpha;
        game.setOnLuas('dadName', game.dad.curCharacter);
     ]])
end