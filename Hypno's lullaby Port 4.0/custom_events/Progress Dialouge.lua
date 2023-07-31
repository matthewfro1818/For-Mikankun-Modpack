--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Progress Dialouge' then
    Dialouge=stringSplit(value1,'')
        setGlobalFromScript('scripts/Stuff/HypnosPauseState.lua','CanPause',false)
        addLuaSprite('TextBox',false)
        addLuaText('Text')
        CanPauseQuest=false
        if value2=='Question' then
        addLuaSprite('AnswerBox',false)
        addLuaSprite('Selector',true)
        Question=true
        elseif value2=='Passed' then
            Passed=true

        end

    Reset()
end
end
function onPause()
    if not CanPauseQuest then
        return Function_Stop
    end
end
function onCreate()
    local Path='stage/Disabled/'
    Dialouge={}
    Letter=1
    CanPauseQuest=true
    SelectPos={540,570}
    Select=1
    Question=false
    Passed=false
    PassedDialouge=0
    precacheSound('confirmText')
    makeLuaSprite('TextBox',Path..'questionareTextBox',170,500)
    setProperty('TextBox.antialiasing',false)
    setObjectCamera('TextBox','other')
    makeLuaText('Text','',1000,200,540)
    setTextFont('Text','poketext.ttf')
    setTextAlignment('Text')
    setTextBorder('Text',0,'000000')
    setTextColor('Text','000000')
    setTextSize('Text',24)
    setObjectCamera('Text','other')

    makeLuaSprite('AnswerBox',Path..'questionareAnswerBox',170+getProperty('TextBox.width')+20,500)
    setProperty('AnswerBox.antialiasing',false)
    setObjectCamera('AnswerBox','other')

    makeLuaSprite('Selector','menu/selector',170+getProperty('TextBox.width')+40,SelectPos[1])
    setProperty('Selector.antialiasing',false)
    scaleObject('Selector',2,2)
    setObjectCamera('Selector','other')
    
    
end
function onStepHit()
if Dialouge[Letter]~=nil then
    setTextString('Text',getTextString('Text')..Dialouge[Letter])

    Letter=Letter+1
end

end
function Reset()
    Letter=1
setTextString('Text','')
end
function onUpdate(elapsed)
if Question then
if keyboardJustPressed('UP') or keyJustPressed('up') then
    Up()
end
if keyboardJustPressed('DOWN') or keyJustPressed('down') then
    Down()
end
if keyboardJustPressed('SPACE') or keyJustPressed('space') or keyJustPressed('accept') then
    Accept()
end
end

if Letter== #Dialouge+1 and Passed then
if keyboardJustPressed('SPACE') or keyJustPressed('space') or keyJustPressed('accept') then
    if Select==1 then
        PassYes()
    else
        PassNo()
    end
end
end
if getProperty('WigglesQuestClose.animation.curAnim.finished') and getProperty('WigglesQuestClose.animation.curAnim.name')=='glitch' then
    playAnim('WigglesQuestClose','loop')
end
end
function Up()
    if Select>1 then
        Select=Select-1
        setProperty('Selector.y',SelectPos[Select])
    end
end
function Down()
    if Select<2 then
        Select=Select+1
        setProperty('Selector.y',SelectPos[Select])
    end
end
function Accept()
    if Select==1 then
        playSound('confirmText',1)
    else
        Question=false
        playSound('confirmText',1)
        playAnim('WigglesQuest','give')
        triggerEvent('Progress Dialouge',"You're lying.",'Passed')
    end
end
function PassYes()
    PassedDialouge=PassedDialouge+1
    playSound('confirmText',1)
    if PassedDialouge==1 then

    else
        setProperty('paused',true)
        runHaxeCode([[
            FlxG.sound.music.volume=0;
            PlayState.instance.vocals.volume=0;
        ]])
        setProperty('WigglesQuestClose.visible',false)
        setProperty('QuestionareBackground.visible',false)
        setProperty('Selector.visible',false)
        setProperty('TextBox.visible',false)
        setProperty('Text.visible',false)
        setProperty('AnswerBox.visible',false)
    end
end
function PassNo()
    PassedDialouge=PassedDialouge+1
    playSound('confirmText',1)
    Passed=false
    if PassedDialouge==1 then
        playAnim('WigglesQuest','angry')
        triggerEvent('Progress Dialouge',"You... can sing.",'Passed')
    elseif PassedDialouge==2 then
        setProperty('WigglesQuest.visible',false)
        setProperty('WigglesQuestClose.visible',true)
        playAnim('WigglesQuestClose','glitch')
        triggerEvent('Progress Dialouge',"Give me your sing.",'Passed')
    elseif PassedDialouge==3 then
        triggerEvent('Progress Dialouge',"Give me your sing.",'Passed')
    else
        setProperty('paused',true)
        runHaxeCode([[
            FlxG.sound.music.volume=0;
            PlayState.instance.vocals.volume=0;
        ]])
        setProperty('WigglesQuestClose.visible',false)
        setProperty('QuestionareBackground.visible',false)
        setProperty('Selector.visible',false)
        setProperty('TextBox.visible',false)
        setProperty('Text.visible',false)
        setProperty('AnswerBox.visible',false)
    end

end

