--Code made by Drawoon_
--if you use this please give me credit
--Independent code
function onCreate()
    --For Isotope
    addCharacterToList('Glitchy-Red-Mad','dad')

end
function onEvent(eventName, value1, value2)
    if eventName=='Better Character Change' then
        CharacterOptions=stringSplit(value1..'/'..value2,'/')
        CharacterChanges(CharacterOptions[3],CharacterOptions[1])
        ChangeIcon(toBool(CharacterOptions[4]),CharacterOptions[3],CharacterOptions[1],toBool(CharacterOptions[2]))
        
    end
end
function CharacterChanges(CharacterName,Type)
if Type=='bf' or Type=='boyfriend' then
    runHaxeCode([[
        var lastAlpha:Float = game.boyfriend.alpha;
        game.boyfriend.alpha = 0;
        game.boyfriend=game.boyfriendMap.get(']]..CharacterName..[[');
        game.boyfriend.alpha = lastAlpha;
        game.setOnLuas('boyfriendName', game.boyfriend.curCharacter);

    ]])
elseif Type=='dad' or Type=='opponent' then
    runHaxeCode([[
        var lastAlpha:Float = game.dad.alpha;
        game.dad.alpha = 0;
        game.dad=game.dadMap.get(']]..CharacterName..[[');
        game.dad.alpha = lastAlpha;
        game.setOnLuas('dadName', game.dad.curCharacter);
    ]])
elseif Type=='gf' then

end
end
function ChangeIcon(ReloadColor,IconName,Type,Changes)
    if ReloadColor== nil then
        ReloadColor=true
    end
    if ReloadColor then
        runHaxeCode([[
            game.reloadHealthBarColors();
        ]])
    end
    if Changes== nil then
        Changes=true
    end
if Changes then
if Type=='bf' or Type=='boyfriend' then
    runHaxeCode([[
        game.iconP1.changeIcon(']]..IconName..[[');
    ]])
elseif Type=='dad' or Type=='opponent' then
    runHaxeCode([[
        game.iconP2.changeIcon(']]..IconName..[[');
    ]])
end
end
end
function toBool(Var)
    if Var=='true' then
        return true
    elseif Var=='false' then
        return false
    end
end
function GetCharNum(Var)
    if Type=='bf' or Type=='boyfriend' then
        return 0
    elseif Type=='dad' or Type=='opponent' then
        return 1
    elseif Type=='gf' then
        return 2
    end
end