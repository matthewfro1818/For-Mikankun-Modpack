--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Force dialouge end' then
    if getProperty('AnswerBox.visible') then
        playSound('confirmText',1)
    setProperty('paused',true)
    runHaxeCode([[
        FlxG.sound.music.volume=0;
        PlayState.instance.vocals.volume=0;
    ]])
    setProperty('WigglesQuestClose.visible',false)
    setProperty('WigglesQuest.visible',false)
    setProperty('QuestionareBackground.visible',false)
    setProperty('Selector.visible',false)
    setProperty('TextBox.visible',false)
    setProperty('Text.visible',false)
    setProperty('AnswerBox.visible',false)
    end
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