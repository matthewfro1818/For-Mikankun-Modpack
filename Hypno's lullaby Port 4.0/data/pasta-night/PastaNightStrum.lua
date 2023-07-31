function onCreate()
    luaDebugMode=true
    luaDeprecatedWarnings=true
    addHaxeLibrary('Note')
    addHaxeLibrary('HealthIcon')
    addHaxeLibrary('Song')
    addHaxeLibrary('SwagSong','Song')
    addHaxeLibrary('Section')
    addHaxeLibrary('SwagSection','Section')
    addHaxeLibrary('Std')
    addHaxeLibrary('Math')
    addHaxeLibrary('FlxMath','flixel.math')
    addHaxeLibrary('FlxSort','flixel.util')
    runHaxeCode([[Note.swagWidth=160 * 0.7*0.9;]])
    setProperty('skipArrowStartTween',true)
    Player='LordX'

    
end
function onCreatePost()
    GenerateJson()  
end
function StartMechanic(player)
    Player=player
    for i=0,getProperty('unspawnNotes.length') - 1 do
        local NoteType=getPropertyFromGroup('unspawnNotes',i,'noteType') 
        if Player==NoteType then setPropertyFromGroup('unspawnNotes',i,'mustPress',true) end
        if NoteType=='Hypno' then
            if Player~=NoteType then
                setPropertyFromGroup('unspawnNotes',i,'noteData',getPropertyFromGroup('unspawnNotes',i,'noteData')+4)
            end
        elseif NoteType=='LordX' then
            if Player=='Hypno' then
                setPropertyFromGroup('unspawnNotes',i,'noteData',getPropertyFromGroup('unspawnNotes',i,'noteData')+4)
            end
        end
        setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
        setPropertyFromGroup('unspawnNotes',i,'noMissAnimation',true)
        
    end
end

local Character={MX='dad',LordX='gf',Hypno='boyfriend'}
local Selectin=true
local SelecterCharacters={'MX', 'LordX', 'Hypno'}
local curSelect=0
function onStartCountdown()
    if Selectin then
        playMusic('PastaNightSelect',1,true)
        setProperty('camGame.visible',false)
        setProperty('camHUD.visible',false)
        makeLuaSprite('SelectorShader')
        runHaxeCode([[
            FlxG.cameras.remove(game.camOther,false);
            var SelectorCam:FlxCamera =new FlxCamera(0, 0, 768,672,1);
            SelectorCam.x += (FlxG.width / 2 - SelectorCam.width / 2);
		    SelectorCam.y += (FlxG.height / 2 - SelectorCam.height / 2);
            setVar("SelectorCam",SelectorCam);
            FlxG.cameras.add(SelectorCam,false);
            FlxG.cameras.add(game.camOther,false);
            if(ClientPrefs.shaders){
                var shaderName="crt";
                game.initLuaShader(shaderName);
                var shader0 = game.createRuntimeShader(shaderName);
                SelectorCam.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("SelectorShader").shader = shader0;
            }
            
        ]])
        makeLuaSprite('bg','pasta/PastaSelect_BG')
        scaleObject('bg',3,3)
        setProperty('bg.x',getProperty('SelectorCam.width')/2-getProperty('bg.width')/2)
        setProperty('bg.y',getProperty('SelectorCam.height')/2-getProperty('bg.height')/2)
        SetSelecterCamera('bg')
        addLuaSprite('bg')
        local DisplacementList={-4,2,0}
        for i=1,#SelecterCharacters do
            for j=1,3 do
                local tag=SelecterCharacters[i]..j
                makeLuaSprite(tag,'pasta/PastaSelect_'..SelecterCharacters[i]..'_0'..tostring(j))
                if j==2 then
                    setProperty(tag..'.visible',false)
                end
                scaleObject(tag,3,3,false)
                setProperty(tag..'.x',getProperty('bg.x')+getProperty('bg.width')/2-getProperty(tag..'.width')/2)
                setProperty(tag..'.y',(176 * 3) - getProperty(tag..'.height') + (DisplacementList[i]*3))
                setProperty(tag..'.x',math.floor(getProperty(tag..'.x')+(i-2)*(3 * 45) + 3))
                SetSelecterCamera(tag)
                addLuaSprite(tag)
            end
        end
        makeLuaSprite('Arrow','pasta/PastaSelect_Arrow',0,124*3)
        scaleObject('Arrow',3,3,false)
        SetSelecterCamera('Arrow')
        addLuaSprite('Arrow')
        updateSelection(1)
        return Function_Stop
    else
        return Function_Continue
    end
end
function onCountdownStarted()
    Create3rStrum()
    StartMechanic(SelecterCharacters[curSelect])
    for i=1,4 do
        setPropertyFromGroup('opponentStrums',i-1,'alpha',0.5)
        setProperty('Strum'..i..'.alpha',0.5)
    end
    if Player=='Hypno' then
        UpdateStrumlinePosX(0,((screenWidth/3)*2))
        UpdateStrumlinePosX(1,((screenWidth/3)*0))
        UpdateStrumlinePosX(2,((screenWidth/3)*1))
    elseif Player=='MX' then
        UpdateStrumlinePosX(0,((screenWidth/3)*0))
        UpdateStrumlinePosX(1,((screenWidth/3)*1))
        UpdateStrumlinePosX(2,((screenWidth/3)*2))
    else
        UpdateStrumlinePosX(0,((screenWidth/3)*1))
        UpdateStrumlinePosX(1,((screenWidth/3)*0))
        UpdateStrumlinePosX(2,((screenWidth/3)*2))
    end
    SetHealthBar()
end
local totalElapsed=0
local canSelecter=true
function onUpdate(elapsed)
    
    if Selectin then
        totalElapsed =totalElapsed+ elapsed
		if shadersEnabled then
            setShaderFloat('SelectorShader','time',totalElapsed)
        end
        if keyJustPressed('left') then updateSelection(curSelect-1) end
        if keyJustPressed('right') then updateSelection(curSelect+1) end
        if keyJustPressed('accept') then
            canSelecter=false
            setProperty(SelecterCharacters[curSelect]..'3.visible',false)
            setProperty(SelecterCharacters[curSelect]..'2.visible',true)
            setProperty(SelecterCharacters[curSelect]..'1.visible',false)
            runTimer('StartingSong',0.5)
        end
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='StartingSong' then
        soundFadeOut('',0.0001,0)
        setProperty(SelecterCharacters[curSelect]..'2.visible',false)
        setProperty(SelecterCharacters[curSelect]..'1.visible',true)
        Selectin=false
        
        runTimer('StartPastaSong',0.5)
    end
    if tag=='StartPastaSong' then
        setProperty('camGame.visible',true)
        setProperty('camHUD.visible',true)
        setProperty('SelectorCam.visible',false)
        startCountdown()
    end
end
function updateSelection(pos)
    if canSelecter and curSelect~=pos then
        if pos>#SelecterCharacters then
            pos=1
        elseif pos<1 then
            pos=#SelecterCharacters
        end
        curSelect=pos
        for i=1,#SelecterCharacters do
            setProperty(SelecterCharacters[i]..'3.visible',true)
        end
        setProperty(SelecterCharacters[curSelect]..'3.visible',false)
        setProperty('Arrow.x',getProperty(SelecterCharacters[curSelect]..'1.x')+getProperty(SelecterCharacters[curSelect]..'1.width')/2-getProperty('Arrow.width')/2)
    end
end
function SetHealthBar()
    local noPlayers={}
    for i=1,3 do
        if Character[Player]~=Character[SelecterCharacters[i]] then
            table.insert(noPlayers,SelecterCharacters[i])
        end
    end
    runHaxeCode([[
        game.healthBar.createGradientBar([]]..getColorFromRGB(getProperty(Character[noPlayers[1]]..'.healthColorArray'),true)..[[,
        ]]..getColorFromRGB(getProperty(Character[noPlayers[2]]..'.healthColorArray'),true)..[[],
        []]..getColorFromRGB(getProperty(Character[Player]..'.healthColorArray'),true)..[[], 1, 90);
        game.healthBar.updateBar();
        game.addTextToDebug("Color",]]..getColorFromHex('FF0000')..[[);
    ]])
    runHaxeCode([[
        
        game.iconP1.changeIcon(game.]]..Character[Player]..[[.healthIcon);
        game.iconP2.changeIcon(game.]]..Character[noPlayers[2]]..[[.healthIcon);
        var iconP3= new HealthIcon(game.]]..Character[noPlayers[1]]..[[.healthIcon);
        iconP3.cameras=[game.camHUD];
        game.add(iconP3);
        setVar("iconP3",iconP3)
    ]])
    setObjectOrder('iconP2',getObjectOrder('healthBar')+1)
    setObjectOrder('iconP3',getObjectOrder('healthBar')+2)
    setObjectOrder('iconP1',getObjectOrder('healthBar')+3)
    local top=true
    
    for i=1,3 do
        local icon='iconP'..i
        if i~=1 then
            scaleObject(icon,1,1)
            setProperty(icon..'.y',getProperty('healthBar.y')-(getProperty(icon..'.height')/3)+(getProperty(icon..'.height')/6)*Selection(top,1,-1))
            top=false
        else
            if getProperty(icon..'.char')=='lord-x' or getProperty(icon..'.char')=='mx' then
                setProperty(icon..'.y',getProperty('healthBar.y')-(getProperty(icon..'.height')/2)-16)
            end
        end
    end
end
function onUpdatePost(elapsed)
    local mult=Lerp(0.4,getProperty('iconP2.scale.x'),boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
    scaleObject('iconP2',mult,mult)
    
    local Xoffset=getProperty('healthBar.x')+((-getProperty('healthBar.width')*getProperty('healthBar.percent')*0.01)+getProperty('healthBar.width'))-(150*mult)/2 - 26*2
    if getProperty('iconP1.char')=='lord-x' or getProperty('iconP1.char')=='mx' or getProperty('iconP1.char')=='hypno-cards' then
        getProperty('iconP1.x',getProperty('iconP1.x')+24)
    end
    setProperty('iconP2.x',Xoffset-8)	
    if runHaxeCode('return getVar("iconP3")!=null;') then
        setProperty('iconP3.animation.curAnim.curFrame',getProperty('iconP2.animation.curAnim.curFrame'))	
        scaleObject('iconP3',mult,mult)	
        setProperty('iconP3.x',Xoffset+8)	
    end
    
end

function Selection(If,True,False)
    if If then
        return True
    else
        return False
    end
end
function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function getColorFromRGB(RGB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RGB[1],RGB[2],RGB[3])
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end
function GenerateJson()
    runHaxeCode([[
        var SongData:SwagSong;
        SongData= Song.loadFromJson('pasta-night-Real', 'pasta-night');
        var Notedata:Array<SwagSection>=SongData.notes;
        for (Section in Notedata)
		{
			for (songNotes in Section.sectionNotes)
			{
                if(songNotes[1]!=-1){
                    var Strum:Float =songNotes[0];
                    var NoteData:Int = Std.int(songNotes[1] % 4);
                    var Line="Hypno";
                    if (songNotes[1] <= 3) Line="MX";
                    else if (songNotes[1] <= 7) Line="LordX";
                    else if(songNotes[1] > 7) Line="Hypno";
                    
                    var LastNote:Note;
                    if (game.unspawnNotes.length > 0) LastNote = game.unspawnNotes[Std.int(game.unspawnNotes.length - 1)];
                    else LastNote = null;
                    var NewNote:Note = new Note(Strum, NoteData, LastNote);
                    NewNote.sustainLength = songNotes[2];
                    NewNote.gfNote = false;
                    NewNote.noteType = Line;
                    NewNote.scrollFactor.set();
                    var Length:Float = NewNote.sustainLength;
                    Length=Length / Conductor.stepCrochet;
                    game.unspawnNotes.push(NewNote);
                    var floor:Int = Math.floor(Length);
                    if(floor > 0) {
                        for (susNote in 0...floor+1)
                        {
                            LastNote = game.unspawnNotes[Std.int(game.unspawnNotes.length - 1)];
                            var NewSustan:Note = new Note(Strum + (Conductor.stepCrochet * susNote) + (Conductor.stepCrochet / FlxMath.roundDecimal(]]..getProperty('songSpeed')..[[, 2)), NoteData, LastNote, true);
                            NewSustan.mustPress=NewNote.mustPress;
                            NewSustan.gfNote = false;
                            NewSustan.noteType = Line;
                            NewSustan.scrollFactor.set();
                            NewNote.tail.push(NewSustan);
                            NewSustan.parent = NewNote;
                            game.unspawnNotes.push(NewSustan);
                        }
                    }

                }
            }
        }
        

        game.addTextToDebug(SongData.song,]]..getColorFromHex('FF0000')..[[);
    ]])

    runHaxeCode([[
        game.unspawnNotes.sort(function(Obj1:Note, Obj2:Note){
            return FlxSort.byValues(FlxSort.ASCENDING, Obj1.strumTime, Obj2.strumTime);
        });
    ]])
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    CharacterAnim(noteType,noteData)
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    CharacterAnim(noteType,noteData)
end
function CharacterAnim(notetype,notedata)
    local singAnim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
    playAnim(Character[notetype],singAnim[(notedata%4)+1],true)
    setProperty(Character[notetype]..'.holdTimer',0)
end
function SetSelecterCamera(tag)
    runHaxeCode([[
        game.getLuaObject("]]..tag..[[").camera=getVar("SelectorCam");
    ]])
end
--0boyfriend 1dad 2gf
function UpdateStrumlinePosX(id,x)
    local noteWidth=getPropertyFromClass('Note','swagWidth')
    local offset=0
    local PosX=x+5
    if id==0 then
        for i=0,3 do
            setPropertyFromGroup('playerStrums',i,'x',PosX+((noteWidth+offset)*i))
        end
    elseif  id==1 then
        for i=0,3 do
            setPropertyFromGroup('opponentStrums',i,'x',PosX+((noteWidth+offset)*i))
        end
    elseif  id==2 then
        for i=1,4 do
            setProperty('Strum'..i..'.x',PosX+((noteWidth+offset)*(i-1)))
        end
    end
end
function onStepHit()
    --Repair Notes spawn
    runHaxeCode([[
        for (curNote in game.unspawnNotes){
            var time=game.spawnTime;
            if(game.songSpeed<1) time /=game.songSpeed;
            if(curNote!=null){
                if(curNote.multSpeed<1) time /=curNote.multSpeed;
                if(curNote.strumTime-Conductor.songPosition<time && !curNote.spawned){
                    game.notes.insert(0, curNote);
                    curNote.spawned=true;
                    var index = game.unspawnNotes.indexOf(curNote);
                    game.callOnLuas('onSpawnNote', [game.notes.members.indexOf(curNote), curNote.noteData, curNote.noteType, curNote.isSustainNote]);
                    game.unspawnNotes.splice(index, 1);
                }
            }
        }
    ]])
end
function Create3rStrum()
    addHaxeLibrary('StrumNote')
    for i=1,4 do
        runHaxeCode([[
            var NewStrum:StrumNote= new StrumNote(0,ClientPrefs.downScroll ? FlxG.height - 150 : 50, 3+]]..i..[[, 0);
            
            NewStrum.playAnim('static', true);
            game.opponentStrums.add(NewStrum);
            NewStrum.downScroll= ClientPrefs.downScroll;
            game.strumLineNotes.insert(3+]]..i..[[, NewStrum);
            setVar("Strum]]..i..[[",NewStrum);
         ]])
    end
end