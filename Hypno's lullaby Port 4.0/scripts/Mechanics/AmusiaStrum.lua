function onCreatePost()
    initSaveData('HypnosPref')
    isHell=getDataFromSave('HypnosPref','Hell mode',false)
    if isHell then
        for i = 0, getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('unspawnNotes',i,'mustPress',not getPropertyFromGroup('unspawnNotes',i,'mustPress'))
            setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
            setPropertyFromGroup('unspawnNotes',i,'noMissAnimation',true)
            setPropertyFromGroup('unspawnNotes',i,'blockHit',true)
            setPropertyFromGroup('unspawnNotes',i,'missHealth',0)
        end
    else
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if not getPropertyFromGroup('unspawnNotes',i,'mustPress') then
                setPropertyFromGroup('unspawnNotes',i,'ignoreNote',true)
            end
        end
    end

    if isHell then
        for i=0,3 do
            setPropertyFromGroup('playerStrums',i,'sustainReduce',false)
            if not middlescroll then
                local Opp=getPropertyFromGroup('opponentStrums',i,'x')
                local Player=getPropertyFromGroup('playerStrums',i,'x')
                setPropertyFromGroup('playerStrums',i,'x',Opp)
                setPropertyFromGroup('opponentStrums',i,'x',Player)
            end
        end
    end 
    runHaxeCode([[
        FlxG.cameras.remove(game.camHUD,false);
        FlxG.cameras.remove(game.camOther,false);
        var StrumCamera:FlxCamera =new FlxCamera(game.camHUD.x, game.camHUD.y, ]]..screenWidth..[[,]]..screenHeight..[[,1);
        StrumCamera.bgColor=0x00;
        var HudStuffCam:FlxCamera =new FlxCamera(game.camHUD.x, game.camHUD.y, ]]..screenWidth..[[,]]..screenHeight..[[,1);
        HudStuffCam.bgColor=0x00;
        setVar("HudStuffCam",HudStuffCam);
        setVar("StrumCamera",StrumCamera);
        FlxG.cameras.add(game.camHUD,false);
        FlxG.cameras.add(StrumCamera,false);
        FlxG.cameras.add(HudStuffCam,false);
        FlxG.cameras.add(game.camOther,false);
        game.botplayTxt.cameras=[getVar('HudStuffCam')];
        game.addTextToDebug("a",]]..getColorFromHex('FFFFFF')..[[);
    ]])
end
local Pressed={false,false,false,false}
function onKeyPress(key)
    Pressed[key+1]=true
    if isHell then
    runHaxeCode([[
		game.playerStrums.members[]]..key..[[].playAnim('static', true)
	]])
    end
end
function onKeyRelease(key)
    Pressed[key+1]=false
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if isHell then
    addHealth(0.0475*6)
    if getHealth()>=2 then
         setHealth(-20)
    end
end
end
function onUpdate(elapsed)
    for ProxNote=0,getProperty('notes.length')-1 do
        if ProxNote~= -1 then
            local MustPress=getPropertyFromGroup('notes',ProxNote,'mustPress')
            local isSUS=getPropertyFromGroup('notes',ProxNote,'isSustainNote')
            local wasGood=getPropertyFromGroup('notes',ProxNote,'wasGoodHit')
            local OppHit=getPropertyFromGroup('notes',ProxNote,'hitByOpponent')
            local Late=getPropertyFromGroup('notes',ProxNote,'tooLate')
            local CanHit=getPropertyFromGroup('notes',ProxNote,'canBeHit')
            local Notedata=getPropertyFromGroup('notes',ProxNote,'noteData')
            if isHell then
                local JustPressed={keyJustPressed('left'),keyJustPressed('down'),keyJustPressed('up'),keyJustPressed('right')}
                if JustPressed[Notedata+1] then
                    if not isSUS and not wasGood and not Late and CanHit and MustPress then
                        GoodNote(ProxNote,Notedata)
                    end
                elseif Pressed[Notedata+1] then
                    if isSUS and CanHit and not wasGood and not Late and MustPress then
                        GoodNote(ProxNote,Notedata)
                    end
                end
            else
                if not MustPress and wasGood and not OppHit then
                    local Anim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
                    setPropertyFromGroup('notes',ProxNote,'hitByOpponent',true)
                    playAnim('dad',Anim[Notedata+1]..getPropertyFromGroup('notes',ProxNote, 'animSuffix'),true)
                    callOnLuas('opponentNoteHit',{ProxNote, Notedata, getPropertyFromGroup('notes',ProxNote, 'noteType'), isSUS})
                    setProperty('dad.holdTimer',0)
                    setProperty('vocals.volume',1)
                    StrumShake('opponentStrums')
                end
            end
            
        end
    end
    setProperty('StrumCamera.alpha',getProperty('camHUD.alpha'))
    setProperty('StrumCamera.visible',getProperty('camHUD.visible'))
    setProperty('StrumCamera.zoom',getProperty('camHUD.zoom'))
    setProperty('HudStuffCam.alpha',getProperty('camHUD.alpha'))
    setProperty('HudStuffCam.visible',getProperty('camHUD.visible'))
    setProperty('HudStuffCam.zoom',getProperty('camHUD.zoom'))
end
function StrumShake(Strum)
    if Strum=='opponentStrums' then
    runHaxeCode([[
        game.strumLineNotes.members[0].cameras=[getVar('StrumCamera')];
        game.strumLineNotes.members[1].cameras=[getVar('StrumCamera')];
        game.strumLineNotes.members[2].cameras=[getVar('StrumCamera')];
        game.strumLineNotes.members[3].cameras=[getVar('StrumCamera')];
        getVar('StrumCamera').shake(0.00625, 0.05);
    ]])
    else
        runHaxeCode([[
            game.strumLineNotes.members[4].cameras=[getVar('StrumCamera')];
            game.strumLineNotes.members[5].cameras=[getVar('StrumCamera')];
            game.strumLineNotes.members[6].cameras=[getVar('StrumCamera')];
            game.strumLineNotes.members[7].cameras=[getVar('StrumCamera')];
            getVar('StrumCamera').shake(0.00625, 0.05);
        ]])
    end

end
function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    if not getPropertyFromGroup('notes',membersIndex,'mustPress') and not isHell then
        runHaxeCode([[
            game.notes.members[]]..membersIndex..[[].camera=getVar('StrumCamera');
        ]])
    elseif getPropertyFromGroup('notes',membersIndex,'mustPress') and isHell then
        runHaxeCode([[
            game.notes.members[]]..membersIndex..[[].camera=getVar('StrumCamera');
        ]])
    end
end
function GoodNote(id,Notedata)
    local Anim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
    if getProperty('dad.holdTimer') > stepCrochet * (0.0011 / playbackRate) * getProperty('dad.singDuration') and  stringStartsWith(getProperty('dad.animation.curAnim.name'),'sing') and not stringEndsWith(getProperty('dad.animation.curAnim.name'),'miss') then 
        characterDance('dad')
    end
    playAnim('dad',Anim[Notedata+1]..getPropertyFromGroup('notes', id, 'animSuffix'),true)
    setProperty('dad.holdTimer',0)
    setProperty('vocals.volume',1)

    if not getPropertyFromGroup('notes',id,'isSustainNote') then
        setProperty('combo',getProperty('combo')+1)
        local ratingOffset=getPropertyFromClass('ClientPrefs','ratingOffset')
        local Rating= (getPropertyFromGroup('notes',id,'strumTime') - getSongPosition() + ratingOffset)
        local List={}
        for i=0,getProperty('ratingsData.length')-1 do
            table.insert(List,getProperty('ratingsData['..i..'].hitWindow'))
        end
        local RatingScore=math.abs(Rating/playbackRate)
        local Score=350
        if RatingScore <= List[1] then
            setPropertyFromGroup('notes',id,'rating','sick')
            setProperty('sicks',getProperty('sicks')+1)
            Score=getProperty('ratingsData[0].score')
            setPropertyFromGroup('notes',id,'ratingMod',getProperty('ratingsData[0].ratingMod'))
        elseif RatingScore <= List[2] then
            setPropertyFromGroup('notes',id,'rating','good')
            setProperty('goods',getProperty('goods')+1)
            Score=getProperty('ratingsData[1].score')
            setPropertyFromGroup('notes',id,'ratingMod',getProperty('ratingsData[1].ratingMod'))
        elseif RatingScore <= List[3] then
            setPropertyFromGroup('notes',id,'rating','bad')
            setProperty('bads',getProperty('bads')+1)
            Score=getProperty('ratingsData[2].score')
            setPropertyFromGroup('notes',id,'ratingMod',getProperty('ratingsData[2].ratingMod'))
        elseif RatingScore <= List[4] then
            setPropertyFromGroup('notes',id,'rating','shit')
            setProperty('shits',getProperty('shits')+1)
            setPropertyFromGroup('notes',id,'ratingMod',0)
        else
            setPropertyFromGroup('notes',id,'rating','shit')
            setProperty('shits',getProperty('shits')+1)
            setPropertyFromGroup('notes',id,'ratingMod',0)
        end
        --debugPrint(getPropertyFromGroup('notes',id,'ratingMod'))
        addScore(Score)
        setProperty('totalNotesHit',getProperty('totalNotesHit')+getPropertyFromGroup('notes',id,'ratingMod'))
        setProperty('totalPlayed',getProperty('totalPlayed')+1)
        addHits(1)
    end
    StrumShake('playerStrums')
    callOnLuas('goodNoteHit',{id,Notedata,getPropertyFromGroup('notes',id,'noteType'),getPropertyFromGroup('notes',id,'isSustainNote')})
    setPropertyFromGroup('notes',id,'wasGoodHit',true)
    setPropertyFromGroup('notes',id,'ignoreNote',true)
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if isHell then
        local Anim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
        playAnim('boyfriend',Anim[noteData+1]..getPropertyFromGroup('notes', membersIndex, 'animSuffix'),true)
        setProperty('boyfriend.holdTimer',0)
    end
end