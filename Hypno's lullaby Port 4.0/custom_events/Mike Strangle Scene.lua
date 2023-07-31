local strangling=false
function onEvent(eventName, value1, value2)
    if eventName=='Mike Strangle Scene' then
        setProperty('camGame.zoom',getProperty('camGame.zoom')+2.5)
        setProperty('background.visible',false)
        setProperty('portrait.visible',false)
        setProperty('lacama.visible',false)
        setProperty('laalmuada.visible',false)
        SetCharacterDAD('StevenFp')
        SetCharacterBF('MikeFp')
        if not getDataFromSave('HypnosPref','Pussy mode',false) then
            strangling = true
        end
        
        setProperty('dad.alpha',0)
        setProperty('boyfriend.alpha',0)
        Set('dad','',-300,400)
        Set('boyfriend','',300,100)
        setGlobalFromScript('scripts/Stuff/CameraMove','cameraCentred',true)
        setProperty('dad.y',800)
        setProperty('boyfriend.y',-300)
        doTweenAlpha('MikeAlpha','boyfriend',1,6,'quadOut')
        doTweenY('MikeY','boyfriend',100,6,'quadOut')
        doTweenAlpha('StevenAlpha','dad',1,6,'quadOut')
        doTweenY('StevenY','dad',400,6,'quadOut')
    end
end
function onCreate()
    addCharacterToList('StevenFp','dad')
    addCharacterToList('MikeFp','bf')
    initSaveData('HypnosPref')
end
local NotesHell=1
function onUpdate(elapsed)
    if strangling then
        if getDataFromSave('HypnosPref','Hell mode',false) then
            if getHealth() >= 0.050 then addHealth(-(0.0035 * ((elapsed) * 120))) end
            NotesHell=math.abs(math.sin((getSongPosition() / (stepCrochet  * 16)) * math.pi))
            for i=0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes',i,'mustPress') then
                    setPropertyFromGroup('notes',i,'multAlpha',Lerp(0.35,1,NotesHell))
                end
            end
        else
            if getHealth() >= 0.395 then addHealth(-(0.0020 * ((elapsed) * 120))) end
        end
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
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
function SetCharacterBF(CharacterName)
    runHaxeCode([[
        var lastAlpha:Float = game.boyfriend.alpha;
        game.boyfriend.alpha = 0;
        game.boyfriend=game.boyfriendMap.get(']]..CharacterName..[[');
        game.boyfriend.alpha = lastAlpha;
        game.setOnLuas('boyfriendName', game.boyfriend.curCharacter);
    ]])
end
function Set(tag,Var,X,Y)
    if X~=nil then
        setProperty(tag..Var..'.x',X)
    end
    if Y~=nil then
        setProperty(tag..Var..'.y',Y)
    end
end