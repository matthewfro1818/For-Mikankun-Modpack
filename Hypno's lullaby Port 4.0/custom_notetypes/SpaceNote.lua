local isCovering=false
local ActualBlur=0
local MaxBlurr=2
local volumeMinVocals=0.2
local volumeMinInst=0.1
local amount=0
function onCreate()
    initSaveData('HypnosPref')
    luaDebugMode=true
    DisabledStrum=getDataFromSave('HypnosPref','Pussy mode',false)
    Hellmode=getDataFromSave('HypnosPref','Hell mode',false)
    makeLuaSprite('Blurr')
    if shadersEnabled then
        runHaxeCode([[
            var shaderName = "gaussian";
            
            game.initLuaShader(shaderName);
            
            var shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("Blurr").shader = shader0;
    
        ]])
        setShaderFloat('Blurr','amount',ActualBlur)
    else
        amount=ActualBlur
    end--add shader
    addHaxeLibrary('FlxSound','flixel.system')
end
function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'SpaceNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', "Bronzong_Gong_mechanic")
            setPropertyFromGroup('unspawnNotes', i, 'noteData', 4)
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            if Hellmode then
                setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0)
            else
                setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 1)
            end
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
            
			if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
                runHaxeCode([[
                    var Note:Note=game.unspawnNotes[]]..i..[[];
                    Note.animation.addByPrefix('spacebarholdend','spacebar hold end');
                    Note.animation.addByPrefix('spacebarhold','spacebar hold piece');
                    
                    if(Note.prevNote != null){
                        Note.animation.play('spacebarholdend',true);
                        if(Note.prevNote.isSustainNote){
                            Note.prevNote.animation.play('spacebarhold',true);
                        }
                    }
                ]])
                setPropertyFromGroup('unspawnNotes', i, 'offsetX', 8)
                
            else
                runHaxeCode([[
                    var Note:Note=game.unspawnNotes[]]..i..[[];
                    Note.animation.addByPrefix('spaceScroll', "spacebar0");
                    Note.animation.play('spaceScroll',true);
                ]])
                setPropertyFromGroup('unspawnNotes', i, 'offsetX', -138)
			end
            if DisabledStrum then
                setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0)
                setPropertyFromGroup('unspawnNotes', i, 'blockHit', true)
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
                setPropertyFromGroup('unspawnNotes', i, 'noteData', 2)
            end
		end
        if Hellmode then
            setPropertyFromGroup('unspawnNotes',i,'hitHealth',0) 
        end
	end
    

    CreateCharacter('bfDT')
    setObjectOrder('OtherBoyfriend',getObjectOrder('boyfriendGroup')-1)
end
function onCountdownStarted()
    if not DisabledStrum then
        CreateStrum()
    else
        for i=0,3 do
            setPropertyFromGroup('opponentStrums',i,'x',(160 * 0.7) * i+50-278+((screenWidth / 2) * 1)+3000)
            if not middlescroll then
            setPropertyFromGroup('playerStrums',i,'x',(160 * 0.7) * i+50+42+((screenWidth / 2) * 0))
            end
        end
    end
end
local LastSuffix=''
local singAnim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
local LastStrumPress=0
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType=='SpaceNote' then
        
        if not isSustainNote or not isCovering then
            if LastSuffix~='-morph' then
                setProperty('boyfriend.idleSuffix','-cover')
                playAnim('boyfriend','transcover',true)
                setProperty('boyfriend.specialAnim',true)
                
                for i=0,getProperty('notes.length')-1 do
                    if getPropertyFromGroup('notes',i,'strumTime')-getSongPosition()<200 and getPropertyFromGroup('notes',i,'noteType')=='' and getPropertyFromGroup('notes',i,'mustPress') then
                        setPropertyFromGroup('notes',i,'noAnimation',true)
                    end
                end
            end
            if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
                setProperty('OtherBoyfriend.idleSuffix','-cover')
                runHaxeCode([[
                    getVar('OtherBoyfriend').playAnim('transcover',true);
                ]])
                setProperty('OtherBoyfriend.specialAnim',true)
            end
            LastStrumPress=getPropertyFromGroup('notes',membersIndex,'strumTime')
        end
        isCovering=true
        if botPlay then
            runTimer('ResetCovering',0.2)
        end
        
    else
        if Hellmode then
            addHealth(Lerp(0.023,0,ActualBlur/MaxBlurr))
        end
    end
    if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) and noteData<4 and not getPropertyFromGroup('notes',membersIndex,'noAnimation') then 
        local Suffix=''
        if isCovering then
            Suffix='-cover'
        end
        if LastStrumPress+200<getSongPosition() then
            runHaxeCode([[
                getVar('OtherBoyfriend').playAnim(']]..singAnim[noteData+1]..Suffix..[[',true);
                getVar('OtherBoyfriend').holdTimer=0;
            ]])
        end
        
    end
    
    local BlurrB=ActualBlur
    if shadersEnabled then
        BlurrB=getShaderFloat('Blurr','amount')
    else
        BlurrB=amount
    end
    local volumesong=Lerp(1,volumeMinVocals,BlurrB/MaxBlurr)

    runHaxeCode([[
        if(getVar("VocalsCus")!=null){
            getVar("VocalsCus").volume=]]..volumesong..[[;
        }
    ]])

end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) and noteData<4 then
        runHaxeCode([[
            getVar("OtherBoyfriend").playAnim(']]..singAnim[noteData+1]..[['+'miss',true);
        ]])
        
    end
    if noteData==4 and ActualBlur<MaxBlurr then
        if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
            runHaxeCode([[
                getVar("OtherBoyfriend").playAnim('singDOWN'+'miss',true);
            ]])
        end
        playAnim('boyfriend','singDOWNmiss'..LastSuffix,true)
        ActualBlur=ActualBlur+0.25
        runHaxeCode([[
            if(FlxG.sound.music!=null){
                FlxG.sound.music.volume=1;
            }
        ]])
    end
    if Hellmode then
        addHealth(-Lerp(getPropertyFromGroup('notes',membersIndex,'missHealth'),getPropertyFromGroup('notes',membersIndex,'missHealth')*19,ActualBlur/MaxBlurr))
    end
    runHaxeCode([[
        if(getVar("VocalsCus")!=null){
            getVar("VocalsCus").volume=0;
        }
    ]])
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='ResetCovering' then
        setProperty('boyfriend.idleSuffix',LastSuffix)
        characterDance('boyfriend')
        if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
            setProperty('OtherBoyfriend.idleSuffix','')
            runHaxeCode([[
                getVar('OtherBoyfriend').dance(); 
            ]])
        end
        isCovering=false
    end
    if tag=="ResetVocals" then
        ResetVocals()
    end
end
function onUpdate(elapsed)
    
    if getProperty('boyfriend.idleSuffix')~='-cover' and LastSuffix~=getProperty('boyfriend.idleSuffix') then
        LastSuffix=getProperty('boyfriend.idleSuffix')
    end
    for ProxNote=0,getProperty('notes.length')-1 do
        if ProxNote~= -1 and not DisabledStrum and not botPlay then
            local MustPress=getPropertyFromGroup('notes',ProxNote,'mustPress')
            local isSUS=getPropertyFromGroup('notes',ProxNote,'isSustainNote')
            local wasGood=getPropertyFromGroup('notes',ProxNote,'wasGoodHit')
            local Late=getPropertyFromGroup('notes',ProxNote,'tooLate')
            local CanHit=getPropertyFromGroup('notes',ProxNote,'canBeHit')
            local Notedata=getPropertyFromGroup('notes',ProxNote,'noteData')
            if keyJustPressed('space') then
                if not isSUS and not wasGood and not Late and CanHit and Notedata==4 and MustPress then
                    GoodSpaceHit(ProxNote)

                else
                    if ProxNote==getProperty('notes.length')-1 then
                        Pressed(true)
                    end
                end
            elseif keyPressed('space') then
                if isSUS and CanHit and not wasGood and not Late and Notedata==4 and MustPress then
                    GoodSpaceHit(ProxNote)
                else
                    
                    Pressed(false)
                end
            end
            
        end
        if keyReleased('space') and not DisabledStrum and not botPlay then
            runHaxeCode('getVar("SpaceBar").playAnim("static");')
            setProperty('SpaceBar.resetAnim',0)
            setProperty('boyfriend.idleSuffix',LastSuffix)
            characterDance('boyfriend')
            if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
                setProperty('OtherBoyfriend.idleSuffix','')
                runHaxeCode([[
                    getVar('OtherBoyfriend').dance(); 
                ]])
            end

            
            isCovering=false
        end
    end
    for i=0,getProperty('notes.length')-1 do
        if isCovering and getPropertyFromGroup('notes',i,'noteType')=='' and LastSuffix~='-morph' and getPropertyFromGroup('notes',i,'mustPress') then
            setPropertyFromGroup('notes',i,'animSuffix','-cover')
        elseif getPropertyFromGroup('notes',i,'mustPress') then
            setPropertyFromGroup('notes',i,'animSuffix',LastSuffix)
        end

    end
    if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then 
        if getProperty('OtherBoyfriend.holdTimer') > stepCrochet * (0.0011 / playbackRate) * getProperty('OtherBoyfriend.singDuration') and  stringStartsWith(getProperty('OtherBoyfriend.animation.curAnim.name'),'sing') and not stringEndsWith(getProperty('OtherBoyfriend.animation.curAnim.name'),'miss') then
            runHaxeCode([[
                getVar('OtherBoyfriend').dance(); 
            ]])
        end
    end
    if runHaxeCode([[return getVar("OtherBoyfriend")!=null || getVar("OtherBoyfriendicon")!=null;]]) then
        setProperty('OtherBoyfriendicon.x',getProperty('iconP1.x'))
        setProperty('OtherBoyfriendicon.y',getProperty('iconP1.y'))
        setProperty('OtherBoyfriendicon.flipX',getProperty('iconP1.flipX'))
        setProperty('OtherBoyfriendicon.scale.x',getProperty('iconP1.scale.x'))
        setProperty('OtherBoyfriendicon.scale.y',getProperty('iconP1.scale.y'))
    end
    
end
function ResetVocals()
    runHaxeCode([[
        if (FlxG.sound.music != null && getVar("VocalsCus")!=null && !game.startingSong)
		{
            getVar("VocalsCus").pause();

            if (Conductor.songPosition <= getVar("VocalsCus").length)
            {
                getVar("VocalsCus").time = Conductor.songPosition;
                getVar("VocalsCus").pitch = game.playbackRate;
            }
		    getVar("VocalsCus").play();
		}
    ]])
end
function onCustomSubstateCreate(name)
    if getProperty('paused') then
        runHaxeCode([[
            if(getVar("VocalsCus")!=null) {
                getVar("VocalsCus").pause();
            }
        ]])
    end
end
function onPause()
    runHaxeCode([[
        if(getVar("VocalsCus")!=null) {
			getVar("VocalsCus").pause();
		}
    ]])
end
function onResume()
    ResetVocals()
end
function onSongStart()
    runTimer('ResetVocals',0.2)
end

function onUpdatePost(elapsed)
    runHaxeCode([[
        if(getVar("VocalsCus")==null && !game.startingSong){
            var Vocals=game.vocals;
            game.vocals=new FlxSound();
            setVar("VocalsCus",Vocals);
        }
    ]])
    
    if ActualBlur<=0 then
        ActualBlur=0
    else
        local Mult=1
        if Hellmode then
            Mult=0.05
        end
        ActualBlur=ActualBlur-(0.0014 * ((elapsed) * 120)*Mult)
    end
    local BlurrA=ActualBlur
    if shadersEnabled then
        setShaderFloat('Blurr','iTime',getSongPosition())
        amount=getShaderFloat('Blurr','amount')
        setShaderFloat('Blurr','amount', Lerp(ActualBlur,amount,0.0221))
        BlurrA=getShaderFloat('Blurr','amount')
    else
        amount=Lerp(ActualBlur,amount,0.0221)
        BlurrA=amount
    end
    local volumesong=Lerp(1,volumeMinVocals,BlurrA/MaxBlurr)
    if BlurrA~=0 then
        runHaxeCode([[
            if(getVar("VocalsCus")!=null){
                getVar("VocalsCus").volume=]]..volumesong..[[;
            }
        ]])
    end
    local Targetvolumeinst=Lerp(1,volumeMinInst,BlurrA/MaxBlurr)
    local InstVolume=Lerp(getPropertyFromClass('flixel.FlxG','sound.music.volume'),Targetvolumeinst, (elapsed / (1 / 10)) * 0.1)
    runHaxeCode([[
        if(FlxG.sound.music!=null){
            FlxG.sound.music.volume=]]..InstVolume..[[;
        }
    ]])
end
function onEndSong()
    runHaxeCode([[
        if(FlxG.sound.music!=null){
            FlxG.sound.music.volume=0;
        }
    ]])
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function CreateStrum()
    addHaxeLibrary('StrumNote')
    runHaxeCode([[
       var NewStrum:StrumNote= new StrumNote(0,(ClientPrefs.downScroll ? FlxG.height - 150 : 50)+30, 4, 1);
       var Texture:String= "Bronzong_Gong_mechanic";
       NewStrum.frames= Paths.getSparrowAtlas(Texture);
       NewStrum.animation.addByPrefix('space', 'spacebar0');
       NewStrum.animation.addByPrefix('static', 'spacebar0');
       NewStrum.animation.addByPrefix('pressed', 'spacebar press', 24, false);
       NewStrum.animation.addByPrefix('confirm', 'spacebar confirm', 24, false);
       NewStrum.updateHitbox();
       NewStrum.playAnim('static', true);
       
       game.playerStrums.add(NewStrum);
       NewStrum.downScroll= ClientPrefs.downScroll;
       game.strumLineNotes.add(NewStrum);
       setVar("SpaceBar",NewStrum);
    ]])
    local Offset=100
    if middlescroll then
        Offset=268
    end
    for i=0,4 do
        setPropertyFromGroup('opponentStrums',i,'x',(160 * 0.7) * i+50+((screenWidth / 2) * 1)+3000)
        setPropertyFromGroup('playerStrums',i,'x',(160 * 0.7) * i+50+((screenWidth / 2) * 0)-40+Offset)
        if i>1 then
            setPropertyFromGroup('playerStrums',i,'x',(160 * 0.7) * i+50+((screenWidth / 2) * 0)+220+Offset)
        end
        if i==4 then
            setPropertyFromGroup('playerStrums',i,'x',(160 * 0.7) * 3+50+((screenWidth / 2) * 0)-60+Offset)
        end
    end
end
function Pressed(ifJustPressed)
    if runHaxeCode("return getVar(\"SpaceBar\") != null") then
        if getProperty('SpaceBar.animation.curAnim.name')~='confirm' then
            runHaxeCode('getVar("SpaceBar").playAnim("pressed", true);')
            setProperty('SpaceBar.resetAnim',0)
            if Hellmode and ifJustPressed then
                playAnim('boyfriend','singDOWNmiss'..LastSuffix,true)
                if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
                    runHaxeCode([[
                        getVar("OtherBoyfriend").playAnim('singDOWNmiss',true);
                    ]])
                end
                addHealth(-Lerp(0.05,1,ActualBlur/MaxBlurr))
            end
            if (not ghostTapping or Hellmode) and ifJustPressed then
                setProperty('totalPlayed',getProperty('totalPlayed')+1)
                addScore(-10)
                addMisses(1)
            end
        end
    end
end
function onGameOver()
    ActualBlur=0
    runHaxeCode([[
        if(getVar("VocalsCus")!=null){
            getVar("VocalsCus").pause();
        }
    ]])
end
function noteMissPress(direction)
    addHealth(-Lerp(0.05,0.05*5,ActualBlur/MaxBlurr))
end
function GoodSpaceHit(NoteID)

    if not getPropertyFromGroup('notes',NoteID,'isSustainNote') then
    setProperty('combo',getProperty('combo')+1)
    local ratingOffset=getPropertyFromClass('ClientPrefs','ratingOffset')
    local Rating= (getPropertyFromGroup('notes',NoteID,'strumTime') - getSongPosition() + ratingOffset)
    local List={}
    for i=0,getProperty('ratingsData.length')-1 do
        table.insert(List,getProperty('ratingsData['..i..'].hitWindow'))
    end
    RatingScore=math.abs(Rating)
    setPropertyFromGroup('notes',NoteID,'ratingMod',RatingScore)
    if RatingScore <= List[1] then
        setPropertyFromGroup('notes',NoteID,'rating','sick')
        setProperty('sicks',getProperty('sicks')+1)
    elseif RatingScore <= List[2] then
        setPropertyFromGroup('notes',NoteID,'rating','good')
        setProperty('goods',getProperty('goods')+1)
    elseif RatingScore <= List[3] then
        setPropertyFromGroup('notes',NoteID,'rating','bad')
        setProperty('bads',getProperty('bads')+1)
    elseif RatingScore <= List[4] then
        setPropertyFromGroup('notes',NoteID,'rating','shit')
        setProperty('shits',getProperty('shits')+1)
    else
        setPropertyFromGroup('notes',NoteID,'rating','shit')
        setProperty('shits',getProperty('shits')+1)
    end
    end
    callOnLuas('goodNoteHit',{NoteID,4,'SpaceNote',getPropertyFromGroup('notes',NoteID,'isSustainNote')},false,false)
    
    runHaxeCode([[
        if(getVar("SpaceBar") != null){
            getVar("SpaceBar").playAnim("confirm", true);
            getVar("SpaceBar").resetAnim=0;
        }
        
        
    ]])
    
    setPropertyFromGroup('notes',NoteID,'wasGoodHit',true)
    if not getPropertyFromGroup('notes',NoteID,'isSustainNote') then
        
        runHaxeCode([[
            var note:Note=game.notes.members[]]..NoteID..[[];
            if(note != null){
                note.kill();
		        game.notes.remove(note, true);
		        note.destroy();
            }
        ]])
    end
end
function onBeatHit()
    if runHaxeCode([[return getVar("OtherBoyfriend")!=null;]]) then
        if curBeat% getProperty('OtherBoyfriend.danceEveryNumBeats')==0 and getProperty('OtherBoyfriend.animation.curAnim')~=nil and not stringStartsWith(getProperty('OtherBoyfriend.animation.curAnim.name'),'sing') and not getProperty('OtherBoyfriend.stunned') then
            runHaxeCode([[
                getVar('OtherBoyfriend').dance(); 
            ]])
        end
    end

end
function CreateCharacter(CharName)
    addHaxeLibrary('HealthIcon')
    runHaxeCode([[
        var BF2:Boyfriend;
        BF2 = new Boyfriend(]]..getCharacterX('bf')..[[,]]..getCharacterY('bf')..[[,']]..CharName..[[');
        BF2.x+=BF2.positionArray[0];
        BF2.y+=BF2.positionArray[1];
        game.add(BF2);
        BF2.dance();
        setVar('OtherBoyfriend',BF2);
        var BF2icon:HealthIcon;
        BF2icon= new HealthIcon(BF2.healthIcon, true);
        game.add(BF2icon);
        BF2icon.camera=game.camHUD;
        setVar('OtherBoyfriendicon',BF2icon);
    ]])
    setObjectOrder('OtherBoyfriendicon',getObjectOrder('iconP1'))
    setObjectOrder('iconP1',getObjectOrder('iconP1')+1)
end