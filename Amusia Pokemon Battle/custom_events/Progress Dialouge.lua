--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Progress Dialouge' then
    Dialouge=stringSplit(value1,'/')

        addLuaSprite('TextBox',false)
        addLuaText('Text')
        if value2=='Question' then
        addLuaSprite('AnswerBox',false)
        addLuaSprite('Selector',false)
        Question=true
        elseif value2=='Passed' then
            Passed=true

        end
    Reset()
end
end
function onCreate()
    Dialouge={}
    Letter=1
    SelectPos={540,570}
    Select=1
    Question=false
    Passed=false
    PassedDialouge=0
    precacheSound('confirmText')
    makeLuaSprite('TextBox','questionareTextBox',170,500)
    setProperty('TextBox.antialiasing',false)
    setObjectCamera('TextBox','other')
    makeLuaText('Text','',1000,200,540)
    setTextFont('Text','poketext.ttf')
    setTextAlignment('Text')
    setTextBorder('Text',0,'000000')
    setTextColor('Text','000000')
    setTextSize('Text',24)
    setObjectCamera('Text','other')

    makeLuaSprite('AnswerBox','questionareAnswerBox',170+getProperty('TextBox.width')+20,500)
    setProperty('AnswerBox.antialiasing',false)
    setObjectCamera('AnswerBox','other')

    makeLuaSprite('Selector','selector',170+getProperty('TextBox.width')+40,SelectPos[1])
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
    Pass()
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
        playSound('errorMenu',1)
    else
        Question=false
        playSound('confirmText',1)
        playAnim('WigglesQuest','give')
        triggerEvent('Progress Dialouge',"Y/o/u/'/r/e/ /l/y/i/n/g/.",'Passed')
    end
end
function Pass()
    PassedDialouge=PassedDialouge+1
    playSound('confirmText',1)
    Passed=false
    if PassedDialouge==1 then
        playAnim('WigglesQuest','angry')
        triggerEvent('Progress Dialouge',"Y/o/u/./././ /c/a/n/ /s/i/n/g/.",'Passed')
    elseif PassedDialouge==2 then
        setProperty('WigglesQuest.visible',false)
        setProperty('WigglesQuestClose.visible',true)
        playAnim('WigglesQuestClose','glitch')
        triggerEvent('Progress Dialouge',"G/i/v/e/ /m/e/ /y/o/u/r/ /s/i/n/g/.",'Passed')
    elseif PassedDialouge==3 then
        triggerEvent('Progress Dialouge',"G/i/v/e/ /m/e/ /y/o/u/r/ /s/i/n/g/.",'Passed')
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


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'called' then
        if getProperty('haha2.visible') == true then
            health = getProperty('health')
            setProperty('health', health- 0);
        else
            setProperty('health', 0);
        end
        end
    end