function onCreate()
    addHaxeLibrary('Note')
    addHaxeLibrary('FlxTypedGroup','flixel.group')
    addHaxeLibrary('FlxSort','flixel.util')
    addHaxeLibrary('FlxRect','flixel.math')
    addHaxeLibrary('Array')
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ReverseNotes' and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then

            setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
            setPropertyFromGroup('unspawnNotes',i,'noMissAnimation',true)
		end
	end
    runHaxeCode([[
        var ReverseNotes:FlxTypedGroup = new FlxTypedGroup();
        ReverseNotes.cameras=[game.camHUD];
        game.add(ReverseNotes);
        setVar("ReverseNotes",ReverseNotes);
        game.addTextToDebug("Work",]]..getColorFromHex('FF0000')..[[);
    ]])
end
function onBeatHit()
    runHaxeCode([[
        getVar("ReverseNotes").sort(FlxSort.byY, ClientPrefs.downScroll ? FlxSort.ASCENDING : FlxSort.DESCENDING);
    ]])
end
local ColorAnim={'purple', 'blue', 'green', 'red'}
function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    if noteType=='ReverseNotes' and not getPropertyFromGroup('notes', membersIndex, 'mustPress') then
        local CurAnim=stringEndsWith(getPropertyFromGroup('notes',membersIndex,'animation.curAnim.name'),'end')
        runHaxeCode([[
            var note:Note=game.notes.members[]]..membersIndex..[[];
            var NextSus=note.nextNote==null ? false : note.nextNote.isSustainNote;
            var MultAlpha=1;
            game.notes.remove(note, true);
            if(ClientPrefs.middleScroll){
                MultAlpha=0.35;
            }
            if(!note.isSustainNote && note.tail.length > 0){
                note.offsetX += note.width/2;
                note.animation.addByPrefix('purpleholdend', 'pruple end hold');
                note.animation.addByPrefix("]]..ColorAnim[noteData+1]..[[" + 'holdend',']]..ColorAnim[noteData+1]..[[ hold end');
                note.animation.play("]]..ColorAnim[noteData+1]..[["+"holdend",true);
                note.updateHitbox();
                note.flipY = ClientPrefs.downScroll;
                note.offsetX -= note.width/2;
                note.x +=note.offsetX;
                note.isSustainNote=true;
                note.alpha=0.6*MultAlpha;
                
            }
            else if(note.isSustainNote && note.parent != null && ]]..tostring(CurAnim)..[[){
                note.animation.play("]]..ColorAnim[noteData+1]..[["+"Scroll",true);
                note.x = game.strumLineNotes.members[note.noteData].x;
                note.flipY = false;
                note.isSustainNote=false;
                note.scale.x=0.7;
                note.scale.y=0.7;
                note.alpha=1*MultAlpha;
                note.updateHitbox();
            } 
            else if(note.isSustainNote){
                note.alpha=0.6*MultAlpha;
            }

            note.visible=false;
            getVar("ReverseNotes").insert(0, note);
        ]])
    end
end
--(0.45 * (Conductor.songPosition - Notes.strumTime) * game.songSpeed * Notes.multSpeed)
function GetFromRevNote(index,data)
    return getProperty('ReverseNotes.members['..index..'].'..data)
end
function SetFromRevNote(index,data,set)
    setProperty('ReverseNotes.members['..index..'].'..data,set)
end

function onUpdatePost(elapsed)
    local fakeCrochet = (60 / curBpm) * 1000
    for i = 0, getProperty('ReverseNotes.length')-1 do
        
        if runHaxeCode([[return getVar("ReverseNotes").members[]]..i..[[] !=null;]]) then
            local Direction=Selection(downscroll,-1,1)
            local StrumY=getPropertyFromGroup('opponentStrums',GetFromRevNote(i,'noteData'),'y')
            local Angle=getPropertyFromGroup('opponentStrums',GetFromRevNote(i,'noteData'),'direction')* math.pi / 180
            SetFromRevNote(i,'distance',(0.45 * (getSongPosition()- GetFromRevNote(i,'strumTime')) *getProperty('songSpeed') * GetFromRevNote(i,'multSpeed')))
            SetFromRevNote(i,'y',StrumY+(math.sin(Angle)*GetFromRevNote(i,"distance")*Direction))


            if GetFromRevNote(i,'isSustainNote') and not downscroll then
                if not downscroll then
                    if stringEndsWith(GetFromRevNote(i,'animation.curAnim.name'),'end') then
                        SetFromRevNote(i,'y',GetFromRevNote(i,'y')+10.5 * (fakeCrochet / 400) * 1.5 * getProperty('songSpeed') + (46 * (getProperty('songSpeed') - 1))+16)
                    end
                    SetFromRevNote(i,'y',GetFromRevNote(i,'y')-(getPropertyFromClass('Note','swagWidth') / 2) - (60.5 * (getProperty('songSpeed') - 1)))
                else
                    if stringEndsWith(GetFromRevNote(i,'animation.curAnim.name'),'end') then
                        SetFromRevNote(i,'y',GetFromRevNote(i,'y')+10.5 * (fakeCrochet / 400) * 1.5 * getProperty('songSpeed') + (46 * (getProperty('songSpeed') - 1)))
                        SetFromRevNote(i,'y',GetFromRevNote(i,'y')-46 * (1 - (fakeCrochet / 600)) * getProperty('songSpeed')+16)
                    end
                end



            end
            if math.abs(GetFromRevNote(i,"distance"))>2000 and GetFromRevNote(i,"visible") then
                runHaxeCode([[
                    var note:Note=getVar("ReverseNotes").members[]]..i..[[];
                    if(note != null){
                    note.kill();
                    getVar("ReverseNotes").remove(note, true);
                    note.destroy();
                }
                ]])
            end
            
        end
    end

end
function onUpdate(elapsed)
    for ProxNote=0,getProperty('ReverseNotes.length')-1 do
        if runHaxeCode([[return getVar("ReverseNotes").members[]]..ProxNote..[[] !=null;]]) then
            local MustPress=GetFromRevNote(ProxNote,'mustPress')
            local isSUS=GetFromRevNote(ProxNote,'isSustainNote')
            local wasGood=GetFromRevNote(ProxNote,'wasGoodHit')
            local OppHit=GetFromRevNote(ProxNote,'hitByOpponent')
            local Notedata=GetFromRevNote(ProxNote,'noteData')
            
            if not MustPress and wasGood and not OppHit then
                local SingAnim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
                SetFromRevNote(ProxNote,'visible',true)
                --debugPrint(ProxNote)
                local time = 0.15
                if isSUS and not stringEndsWith(GetFromRevNote(ProxNote,'animation.curAnim.name'),'end') then
                    time=time+ 0.15
                end
                runHaxeCode([[
                    var Strum=game.opponentStrums.members[]]..math.abs(Notedata)..[[];
                    Strum.playAnim('confirm', true);
                    Strum.resetAnim=]]..time..[[;
                ]])
                setProperty('vocals.volume',1)
                playAnim('dad',SingAnim[Notedata+1],true)
                setProperty('dad.holdTimer',0)
                SetFromRevNote(ProxNote,'hitByOpponent',true)
                callOnLuas('opponentNoteHit',{ProxNote,Notedata,'ReverseNotes',isSUS})
            end
        end
    end
end



function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType=='ReverseNotes' then
        
    end
end
function Selection(If,True,False)
    if If then
        return True
    else
        return False
    end
end