local Anim={
{'singUP'},
{'singLEFT','singRIGHT'},
{'singLEFT','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singUP','singRIGHT'},
{'singLEFT','singUP','singRIGHT','singLEFT','singDOWN','singRIGHT'},
{'singLEFT','singUP','singRIGHT','singUP','singLEFT','singDOWN','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT','singLEFT','singDOWN','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT','singUP','singLEFT','singDOWN','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT','singUP','singDOWN','singLEFT','singDOWN','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT','singLEFT','singUP','singRIGHT','singLEFT','singDOWN','singUP','singRIGHT'},
{'singLEFT','singDOWN','singUP','singRIGHT','singLEFT','singDOWN','singUP','singRIGHT','singLEFT','singDOWN','singUP','singRIGHT'}
}
function onCreatePost()
    local LastNoteStrumBf=nil
    local LastNoteStrumDad=nil
    local LastNoteStrumBf2=nil
    local LastNoteStrumDad2=nil
    local LastNoteStrumBf3=nil
    local LastNoteStrumDad3=nil
    local Index={bf=nil,dad=nil,bf2=nil,dad2=nil,bf3=nil,dad3=nil}
    for i = 0, getProperty('unspawnNotes.length')-1 do
        local ActualStrum=GetUnSpawn( i, 'strumTime')
        if not GetUnSpawn( i, 'opponentSing') then
            if LastNoteStrumBf==ActualStrum and GetUnSpawn(i, 'character') == 0 then
                if GetUnSpawn( i, 'isSustainNote') and not GetUnSpawn( Index.bf, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.bf, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            elseif LastNoteStrumBf2==ActualStrum and GetUnSpawn(i, 'character') == 1 then
                if GetUnSpawn( i, 'isSustainNote') and not GetUnSpawn( Index.bf2, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.bf2, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            elseif LastNoteStrumBf3==ActualStrum and GetUnSpawn(i, 'character') == 2 then
                if GetUnSpawn( i, 'isSustainNote') and not GetUnSpawn( Index.bf3, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.bf3, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            end
        else
            if LastNoteStrumDad==ActualStrum and GetUnSpawn(i, 'character') == 0 then
                if GetUnSpawn(i, 'isSustainNote') and not GetUnSpawn(Index.dad, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.dad, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            elseif LastNoteStrumDad2==ActualStrum and GetUnSpawn(i, 'character') == 1 then
                if GetUnSpawn(i, 'isSustainNote') and not GetUnSpawn(Index.dad2, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.dad2, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            elseif LastNoteStrumDad3==ActualStrum and GetUnSpawn(i, 'character') == 3 then
                if GetUnSpawn(i, 'isSustainNote') and not GetUnSpawn(Index.dad3, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.dad3, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            end
        end
        if not GetUnSpawn( i, 'opponentSing') then
            if GetUnSpawn(i, 'character') == 0 then
                LastNoteStrumBf=GetUnSpawn( i, 'strumTime')
                Index.bf=i
            elseif GetUnSpawn(i, 'character') == 1 then
                LastNoteStrumBf2=GetUnSpawn( i, 'strumTime')
                Index.bf2=i
            elseif GetUnSpawn(i, 'character') == 2 then
                LastNoteStrumBf3=GetUnSpawn( i, 'strumTime')
                Index.bf3=i
            end
        else
            if GetUnSpawn(i, 'character') == 0 then
                LastNoteStrumDad=GetUnSpawn(i, 'strumTime')
                Index.dad=i
            elseif GetUnSpawn(i, 'character') == 1 then
                LastNoteStrumDad2=GetUnSpawn(i, 'strumTime')
                Index.dad2=i
            elseif GetUnSpawn(i, 'character') == 2 then
                LastNoteStrumDad3=GetUnSpawn(i, 'strumTime')
                Index.dad3=i
            end
        end
    end
end
function GetUnSpawn(id,var)
    return getPropertyFromGroup('unspawnNotes', id, var)
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote,char)
    if getPropertyFromGroup('notes', membersIndex, 'noAnimation') then
        OtherCharacterGhostAnim('boyfriend',Anim[mania+1][noteData+1],char)
    end
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote,char)
    if getPropertyFromGroup('notes', membersIndex, 'noAnimation') then
        OtherCharacterGhostAnim('dad',Anim[mania+1][noteData+1],char)
    end
end

function CharacterGhostAnim(Character,SingAnim)
    local Ghost=getProperty('unspawnNotes.length')
    makeAnimatedLuaSprite('Ghost'..Ghost,getProperty(Character..'.imageFile'),getProperty(Character..'.x'),getProperty(Character..'.y'))
    local AnimStuff=getProperty(Character..'.animationsArray')
    local ArrayPos=FindAnimArray(AnimStuff,SingAnim)
    setGraphicSize('Ghost'..Ghost,getProperty('Ghost'..Ghost..'.width')*getProperty(Character..'.scale.x'),getProperty('Ghost'..Ghost..'.height')*getProperty(Character..'.scale.y'))
    addAnimationByPrefix('Ghost'..Ghost,AnimStuff[ArrayPos]['anim'],AnimStuff[ArrayPos]['name'],AnimStuff[ArrayPos]['fps'],AnimStuff[ArrayPos]['loop'])
    addOffset('Ghost'..Ghost,SingAnim,AnimStuff[ArrayPos]['offsets'][1],AnimStuff[ArrayPos]['offsets'][2])
    addLuaSprite('Ghost'..Ghost)
    local Color=getProperty(Character..'.healthColorArray')
    setProperty('Ghost'..Ghost..'.color',getColorFromRGB(Color[1]+ 50,Color[2]+ 50,Color[3]+ 50,true))
    setProperty('Ghost'..Ghost..'.alpha',0.8)
    if not lowQuality then
        setBlendMode('Ghost'..Ghost,'HARDLIGHT')
    end
    setObjectOrder('Ghost'..Ghost,getObjectOrder(Character..'Group')-1)
    playAnim('Ghost'..Ghost,SingAnim,true)
    if (SingAnim == 'singLEFT') then
        doTweenX('Ghost'..Ghost..'Xmove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.x')-125,0.75,'linear')
    elseif (SingAnim == 'singDOWN') then
        doTweenY('Ghost'..Ghost..'Ymove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.y')+125,0.75,'linear')
    elseif (SingAnim == 'singUP') then
        doTweenY('Ghost'..Ghost..'Ymove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.y')-125,0.75,'linear')
    elseif (SingAnim == 'singRIGHT') then
        doTweenX('Ghost'..Ghost..'Xmove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.x')+125,0.75,'linear')
    end
    doTweenAlpha('Ghost'..Ghost,'Ghost'..Ghost,0,0.75,'linear')
end

function OtherCharacterGhostAnim(Character,SingAnim,char)
    local Ghost=getProperty('unspawnNotes.length')
    makeAnimatedLuaSprite('Ghost'..Ghost,getProperty(Character..'.otherCharacters['..char..']'..'.imageFile'),getProperty(Character..'.otherCharacters['..char..']'..'.x'),getProperty(Character..'.otherCharacters['..char..']'..'.y'))
    local AnimStuff=getProperty(Character..'.otherCharacters['..char..']'..'.animationsArray')
    local ArrayPos=FindAnimArray(AnimStuff,SingAnim)
    setGraphicSize('Ghost'..Ghost,getProperty('Ghost'..Ghost..'.width')*getProperty(Character..'.otherCharacters['..char..']'..'.scale.x'),getProperty('Ghost'..Ghost..'.height')*getProperty(Character..'.otherCharacters['..char..']'..'.scale.y'))
    addAnimationByPrefix('Ghost'..Ghost,AnimStuff[ArrayPos]['anim'],AnimStuff[ArrayPos]['name'],AnimStuff[ArrayPos]['fps'],AnimStuff[ArrayPos]['loop'])
    addOffset('Ghost'..Ghost,SingAnim,AnimStuff[ArrayPos]['offsets'][1],AnimStuff[ArrayPos]['offsets'][2])
    
    setProperty('Ghost'..Ghost..'.flipX',getProperty(Character..'.otherCharacters['..char..']'..'.flipX'))
    
    addLuaSprite('Ghost'..Ghost)
    local Color=getProperty(Character..'.otherCharacters['..char..']'..'.healthColorArray')
    setProperty('Ghost'..Ghost..'.color',getColorFromRGB(Color[1]+ 50,Color[2]+ 50,Color[3]+ 50,true))
    setProperty('Ghost'..Ghost..'.alpha',0.8)
    if not lowQuality then
        setBlendMode('Ghost'..Ghost,'HARDLIGHT')
    end
    setObjectOrder('Ghost'..Ghost,getObjectOrder(Character..'Group')-1)
    
    playAnim('Ghost'..Ghost,SingAnim,true)

    if (SingAnim == 'singLEFT') then
        doTweenX('Ghost'..Ghost..'Xmove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.x')-125,0.75,'linear')
    elseif (SingAnim == 'singDOWN') then
        doTweenY('Ghost'..Ghost..'Ymove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.y')+125,0.75,'linear')
    elseif (SingAnim == 'singUP') then
        doTweenY('Ghost'..Ghost..'Ymove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.y')-125,0.75,'linear')
    elseif (SingAnim == 'singRIGHT') then
        doTweenX('Ghost'..Ghost..'Xmove','Ghost'..Ghost,getProperty('Ghost'..Ghost..'.x')+125,0.75,'linear')
    end

    doTweenAlpha('Ghost'..Ghost,'Ghost'..Ghost,0,0.75,'linear')
end

function onTweenCompleted(tag)
    if stringStartsWith(tag,'Ghost') then
        removeLuaSprite('Ghost'..stringSplit(tag,'Ghost')[2],false)
    end
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    if RR>255 then RR="255" end
    if GG>255 then GG="255" end
    if BB>255 then BB="255" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end
function FindAnimArray(array,Anim)
    for i=1,#array do
        if array[i]['anim']==Anim then
            return i
        end
    end
end
