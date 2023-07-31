local canPassDialogue=false
local DialogueEnd=false
function onStartCountdown()
    if not DialogueEnd then
        return Function_Stop
    else
        return Function_Continue
    end

end
function onCreate()
    runTimer('Open',0.7)
    TextDialogue=getTextFromFile('data/mando/Dialoguee.txt')
end
function onUpdate(elapsed)
    if keyJustPressed('space') then
        OpenDialogue()
    end
end
function GetDialogueStuff(Pos,Stuff)
    
    local StuffDialogue={}
    local Dialogue=stringSplit(TextDialogue,'Talk+')
    table.remove(Dialogue, 1)
    Dialogue[Pos]=stringSplit(Dialogue[Pos],'::')
    table.remove(Dialogue[Pos])
    table.remove(Dialogue[Pos])
    Dialogue[Pos]=stringSplit(Dialogue[Pos],'+')[2]
    if stringEndsWith(Dialogue[Pos],']') then
        Dialogue[Pos]=stringSplit(Dialogue[Pos],']')[1]
    end

    local Position=stringSplit(TextDialogue,'Talk+')
    table.remove(Position, 1)
    Position[Pos]=stringSplit(Position[Pos],'+')[1]

    local Emotion=stringSplit(TextDialogue,'Talk+')
    table.remove(Emotion, 1)
    Emotion[Pos]=stringSplit(Emotion[Pos],'::')[2]
    StuffDialogue={Text=Dialogue[Pos],Pos=Position[Pos],Emotion=Emotion[Pos]}
    return StuffDialogue[Stuff]
end
function GetCharacter(Pos)
    local PosInt=0
    Character=stringSplit(TextDialogue,'/')
    table.remove(Character, #Character)
    table.remove(Character, 1)
    if Pos=='Center' then
        PosInt=2
    elseif Pos=='Left' then
        PosInt=1
    elseif Pos=='Right' then
        PosInt=3
    else
        PosInt=getRandomInt(1,3)
    end
    return Character[PosInt]
end
function onCustomSubstateCreate(name)
    if name=='DialogueV4' then
        ActualDialogue=1
        FirstTalk={Center=false,Left=false,Right=false}
        makeLuaSprite('BackDialogue',nil,0,0)
        makeGraphic('BackDialogue',screenWidth,screenHeight,'FFFFFF')
        setProperty('BackDialogue.alpha',0.3)
        addLuaSpriteSubstate('BackDialogue')
        MakeCharacter('Left',GetCharacter('Left'))
        MakeCharacter('Right',GetCharacter('Right'))
        MakeCharacter('Center',GetCharacter('Center'))
        makeAnimatedLuaSprite('Tablet','dialogueV4/dialogueBox',0,425)
        addAnimationByIndicesLoop('Tablet','Boyfriend','dialog frame','0',0)
        addAnimationByIndicesLoop('Tablet','Girlfriend','dialog frame','1',0)
        addAnimationByIndicesLoop('Tablet','Red','dialog frame','2',0)
        addAnimationByIndicesLoop('Tablet','Green','dialog frame','3',0)
        addAnimationByIndicesLoop('Tablet','Yellow','dialog frame','4',0)
        addAnimationByIndicesLoop('Tablet','White','dialog frame','5',0)
        addAnimationByIndicesLoop('Tablet','Missingno','dialog frame','6',0)
        addAnimationByIndicesLoop('Tablet','Maroon','dialog frame','7',0)
        addAnimationByIndicesLoop('Tablet','Grey','dialog frame','8',0)
        addAnimationByIndicesLoop('Tablet','Purple','dialog frame','9',0)
        addAnimationByIndicesLoop('Tablet','','dialog frame','10',0)
        addAnimationByIndicesLoop('Tablet','Pink','dialog frame','11',0)
        playAnim('Tablet',GetName(getProperty(GetCharacter(GetDialogueStuff(1,'Pos')))))
        screenCenter('Tablet','x')
        addLuaSpriteSubstate('Tablet')
        MakeChat(GetDialogueStuff(1,'Text'),GetDialogueStuff(1,'Pos'), GetDialogueStuff(1,'Emotion'))
        playSound('lights down',1,'DialogueMusic')
    end
end
function onCustomSubstateUpdate(name, elapsed)
    if name=='DialogueV4' then
        --[[if keyJustPressed('space') then
            closeCustomSubstate()
            stopSound('DialogueMusic')
            DialogueEnd=true
            startCountdown()
        end]]
        if keyJustPressed('accept') and canPassDialogue then
            canPassDialogue=false
            if GetDialogueStuff(ActualDialogue,'Text')==nil then
                closeCustomSubstate()
                stopSound('DialogueMusic')
                DialogueEnd=true
                startCountdown()
            end
            setProperty('Bubble'..tostring(ActualDialogue-1)..'.visible',false)
            setProperty('BubbleIcon'..tostring(ActualDialogue-1)..'.visible',false)
            setProperty('BubbleTxtName'..tostring(ActualDialogue-1)..'.visible',false)
            setProperty('BubbleTxt'..tostring(ActualDialogue-1)..'.visible',false)
            setProperty('Bubble'..ActualDialogue..'.y',getProperty('Bubble'..ActualDialogue..'.y')+119)
            setProperty('BubbleIcon'..ActualDialogue..'.y',getProperty('BubbleIcon'..ActualDialogue..'.y')+119)
            setProperty('BubbleTxtName'..ActualDialogue..'.y',getProperty('BubbleTxtName'..ActualDialogue..'.y')+119)
            setProperty('BubbleTxt'..ActualDialogue..'.y',getProperty('BubbleTxt'..ActualDialogue..'.y')+119)
            MakeChat(GetDialogueStuff(ActualDialogue,'Text'),GetDialogueStuff(ActualDialogue,'Pos'),GetDialogueStuff(ActualDialogue,'Emotion'))
        end
    end
end
function addLuaSpriteSubstate(tag)
    runHaxeCode([[
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
   ]])
end
function addLuaTextSubstate(tag)
    runHaxeCode([[
        game.getLuaObject("]]..tag..[[",true).cameras=null;
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[[",true));
    ]])
end
function MakeCharacter(Pos,CharName)
    local PosDefault={}
    if Pos=='Center' then
        PosDefault={500,210}
    elseif Pos=='Right' then
        PosDefault={850,210}
    else
        PosDefault={200,210}
    end
    runHaxeCode([[
        var Char:Character;
        Char = new Character(]]..PosDefault[1]..[[,]]..PosDefault[2]..[[,']]..CharName..[[');
        Char.x +=Char.positionArray[0];
        Char.y +=Char.positionArray[1];
        Char.alpha = 0;
        CustomSubstate.instance.add(Char);
        setVar(']]..Pos..[[',Char);
    ]])
end
function MakeChat(Text,Pos,Anim)
    ActualDialogue=ActualDialogue+1
    TalkerPos={Pos=Pos,Anim=Anim,Text=Text}
    makeLuaSprite('Bubble'..ActualDialogue,'dialogueV4/bubble',0,480)
    screenCenter('Bubble'..ActualDialogue,'x')
    setProperty('Bubble'..ActualDialogue..'.x',getProperty('Bubble'..ActualDialogue..'.x')+20)
    addLuaSpriteSubstate('Bubble'..ActualDialogue)
    makeAnimatedLuaSprite('BubbleIcon'..ActualDialogue,nil,getProperty('Bubble'..ActualDialogue..'.x'),getProperty('Bubble'..ActualDialogue..'.y')-20)
    scaleObject('BubbleIcon'..ActualDialogue,0.9,0.9)
    loadGraphic('BubbleIcon'..ActualDialogue,"icons/icon-"..getProperty(Pos..'.healthIcon'),150,150)
    addLuaTextSubstate('BubbleIcon'..ActualDialogue)
    makeLuaText('BubbleTxtName'..ActualDialogue,GetName(getProperty(Pos..'.curCharacter')),0,getProperty('Bubble'..ActualDialogue..'.x')+150,getProperty('Bubble'..ActualDialogue..'.y'))
    setTextSize('BubbleTxtName'..ActualDialogue,32)
    setTextFont('BubbleTxtName'..ActualDialogue,'LiberationSans-Bold.ttf')
    addLuaTextSubstate('BubbleTxtName'..ActualDialogue)
    makeLuaText('BubbleTxt'..ActualDialogue,'',screenWidth*0.6,getProperty('Bubble'..ActualDialogue..'.x')+150,getProperty('Bubble'..ActualDialogue..'.y')+37)
    setTextAlignment('BubbleTxt'..ActualDialogue)
    setTextSize('BubbleTxt'..ActualDialogue,24)
    addLuaTextSubstate('BubbleTxt'..ActualDialogue)
    setTextColor('BubbleTxt'..ActualDialogue,'000000')
    setTextBorder('BubbleTxt'..ActualDialogue,0,'000000')
    setTextFont('BubbleTxt'..ActualDialogue,'LiberationSans-Regular.ttf')
    runTimer('TxtSpeak',(stepCrochet/1000)/2,0)
    playAnim('Tablet',GetName(getProperty(Pos..'.curCharacter')))
    
end
function onCustomSubstateDestroy(name)
    if name=='DialogueV4' then
    end
end
function OpenDialogue()
    openCustomSubstate('DialogueV4',true)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='TxtSpeak' then
        setTextString('BubbleTxt'..ActualDialogue,getTextString('BubbleTxt'..ActualDialogue)..stringSplit(TalkerPos['Text'],'')[(-loopsLeft)])
        if -loopsLeft%2==0 then
            if not FirstTalk[TalkerPos['Pos']] then
                FirstTalk[TalkerPos['Pos']]=true
                doTweenAlpha('Character',TalkerPos['Pos'],1,0.5,'Linear')
                if TalkerPos['Pos']=='Left' then
                    setProperty(TalkerPos['Pos']..'.x',getProperty(TalkerPos['Pos']..'.x')-50)
                    doTweenX('CharacterX',TalkerPos['Pos'],getProperty(TalkerPos['Pos']..'.x')+50,0.5,'Linear')
                elseif TalkerPos['Pos']=='Center' then
                    setProperty(TalkerPos['Pos']..'.y',getProperty(TalkerPos['Pos']..'.y')+50)
                    doTweenY('CharacterY',TalkerPos['Pos'],getProperty(TalkerPos['Pos']..'.y')-50,0.5,'Linear')
                else
                    setProperty(TalkerPos['Pos']..'.x',getProperty(TalkerPos['Pos']..'.x')+50)
                    doTweenX('CharacterX',TalkerPos['Pos'],getProperty(TalkerPos['Pos']..'.x')-50,0.5,'Linear')
                end
            end
            playAnim(TalkerPos['Pos'],TalkerPos['Anim'])
        end
        if TalkerPos['Pos']=='Right' then
            playSound('bf-text',1)
        elseif TalkerPos['Pos']=='Center' then
            playSound('gf-text',1)
        else
            playSound('i-text',1)
        end
        if -loopsLeft >= #stringSplit(TalkerPos['Text'],'') then
            cancelTimer('TxtSpeak')
            canPassDialogue=true
        end
    end
    if tag=='Open' then
        OpenDialogue()
    end
end
function GetName(CharName)
    if CharName=='DsusBF' then
        return "Boyfriend"
    elseif CharName=='DsusGF' then
        return "Girlfriend"
    elseif CharName=='DsusRed' then
        return "Red"
    elseif CharName=='DsusGreen' then
        return "Green"
    elseif CharName=='DsusWhite' then
        return "White"
    elseif CharName=='DsusYellow' then
        return "Yellow"
    else
        return "Missingno"
    end
end
function onSoundFinished(tag)
    if tag=='DialogueMusic' and not DialogueEnd then
        playSound('lights down',1,'DialogueMusic')
    end
end
