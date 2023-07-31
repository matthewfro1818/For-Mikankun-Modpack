local language = 'eng'
function onCreate()
    if getPropertyFromClass('ClientPrefs','Gengo') == 'Jp' then
        language = 'jp'
    --end
    else
    --if getPropertyFromClass('ClientPrefs','Gengo') == 'Eng' then
        language = 'eng'
    end
    Dialouge={}
    Letter=1
    disabledHP=0.60
    SelectPosHori={725,935}
    SelectPosVerti={540,610}
    Selecthori=1
    SelectVerti=1
    Question=false
    hpdrain = disabledHP / 7.5
    Passed=false
    Protected=0
    PassedDialouge=0
    completeddialouge = false
    precacheSound('confirmText')
    makeLuaSprite('battletext','battletext',0,550)
    setProperty('battletext.antialiasing',false)
    setObjectCamera('battletext','other')
    makeLuaText('battlestext','',1000,30,590)
    setTextFont('battlestext','poketext.ttf')
    setTextAlignment('battlestext')
    setTextBorder('battlestext',0,'000000')
    setTextColor('battlestext','000000')
    setTextSize('battlestext',24)
    setObjectCamera('battlestext','other')

    makeLuaSprite('dontdie','language/'..language..'/dontdie',325,100)
    setProperty('dontdie.antialiasing',false)
    setObjectCamera('dontdie','other')

    makeLuaSprite('AnswerBox','language/'..language..'/questionareAnswerBox',170+getProperty('battletext.width')+20,500)
    setProperty('AnswerBox.antialiasing',false)
    setObjectCamera('AnswerBox','other')

    makeLuaSprite('ember','language/'..language..'/ember',0+getProperty('battletext.width')+20,550)
    scaleObject('ember', 0.55, 0.55)
    setProperty('ember.antialiasing',false)
    setObjectCamera('ember','other')

    makeLuaSprite('morningsun','language/'..language..'/morningsun',getProperty('ember.width')+getProperty('battletext.width')+20,550)
    scaleObject('morningsun', 0.55, 0.55)
    setProperty('morningsun.antialiasing',false)
    setObjectCamera('morningsun','other')

    makeLuaSprite('protect','language/'..language..'/protect',0+getProperty('battletext.width')+20,620)
    scaleObject('protect', 0.55, 0.55)
    setProperty('protect.antialiasing',false)
    setObjectCamera('protect','other')

    makeLuaSprite('flareblitz','language/'..language..'/flareblitz',getProperty('ember.width')+getProperty('battletext.width')+20,620)
    scaleObject('flareblitz', 0.55, 0.55)
    setProperty('flareblitz.antialiasing',false)
    setObjectCamera('flareblitz','other')

    makeLuaSprite('moveselector','moveselector',SelectPosHori[1],SelectPosVerti[1])
    setProperty('moveselector.antialiasing',false)
    scaleObject('moveselector',0.55,0.55)
    setObjectCamera('moveselector','other')

    makeLuaSprite('protectanim','protectanim',650, 112)
    setProperty('protectanim.antialiasing',false)
    scaleObject('protectanim',0.5,0.5)

    makeLuaSprite('HP','language/'..language..'/HP',-390, 12)
    setProperty('HP.antialiasing',false)
    scaleObject('HP',0.60,0.60)

    makeLuaSprite('HPbar-g','HPbar-g',-167, 163)
    setProperty('HPbar-g.antialiasing',false)
    scaleObject('HPbar-g',0.60,0.60)

    makeLuaSprite('HPbar-y','HPbar-y',-167, 163)
    setProperty('HPbar-y.antialiasing',false)
    scaleObject('HPbar-y',0.60,0.60)
    
    makeLuaSprite('HPbar-r','HPbar-r',-167, 163)
    setProperty('HPbar-r.antialiasing',false)
    scaleObject('HPbar-r',0.60,0.60)

    makeLuaSprite('HPotherside','language/'..language..'/HPotherside',390, -32)
    setProperty('HPotherside.antialiasing',false)
    scaleObject('HPotherside',0.45,0.45)

    makeLuaSprite('sprite','sprite',450, -32)
    setProperty('sprite.antialiasing',false)
    scaleObject('sprite',0.45,0.45)

    makeLuaSprite('haha','haha',450, -32)
    setProperty('haha.antialiasing',false)
    scaleObject('haha',0.45,0.45)

    makeLuaSprite('haha2','haha2',450, -32)
    setProperty('haha2.antialiasing',false)
    scaleObject('haha2',0.45,0.45)
    setProperty('haha2.visible',false)
end



function onEvent(eventName, value1, value2)
if eventName=='battle' then
    hpdrain = disabledHP / 7.5
    if hpdrain > 0.03 then
        hpdrain = 0.03
    end
    runTimer('thing', 0.05, 0)
    Protected=0
    Dialouge=stringSplit(value1,'/')
    setProperty('sprite.visible',true)
    addLuaSprite('haha',false)
    setProperty('battletext.visible',true)
    setProperty('battletext.visible',true)
    setProperty('moveselector.visible',true)
    setProperty('flareblitz.visible',true)
    setProperty('ember.visible',true)
    setProperty('protect.visible',true)
    setProperty('morningsun.visible',true)
    setProperty('battlestext.visible',true)
    setProperty('protectanim.visible',false)
        addLuaSprite('battletext',true)
        addLuaText('battlestext')
        if value2=='Question' then
        addLuaSprite('HP',false)
        addLuaSprite('HPpony',false)
        addLuaSprite('HPponyotherside',false)
        addLuaSprite('HPotherside',false)
        addLuaSprite('ember',false)
        addLuaSprite('protect',false)
        addLuaSprite('morningsun',false)
        addLuaSprite('HPbar-r',false)
        addLuaSprite('HPbar-rp',false)
        addLuaSprite('HPbar-y',false)
        addLuaSprite('HPbar-yp',false)
        addLuaSprite('HPbar-g',false)
        addLuaSprite('HPbar-gp',false)
        addLuaSprite('flareblitz',false)
        addLuaSprite('moveselector',false)
        Question=true
        elseif value2=='Passed' then
            Passed=true

        end
    Reset()
end
end

function onStepHit()
    if curStep < 800 then
    scaleObject('HPbar-g', disabledHP, 0.60)
    scaleObject('HPbar-y', disabledHP, 0.60)
    scaleObject('HPbar-r', disabledHP, 0.60)
    if disabledHP < 0.345 then
        setProperty('HPbar-y.visible',true)
        setProperty('HPbar-g.visible',false)
    if disabledHP < 0.20 then
        setProperty('HPbar-y.visible',false)
        setProperty('HPbar-r.visible',true)
        setProperty('haha2.visible',true)
    end
    end
end
    if curStep > 800 then
        scaleObject('HPbar-g', disabledHP*0.75, 0.45)
        scaleObject('HPbar-y', disabledHP*0.75, 0.45)
        scaleObject('HPbar-r', disabledHP*0.75, 0.45)
        if disabledHP < 0.345 then
            setProperty('HPbar-y.visible',true)
            setProperty('HPbar-g.visible',false)
        end
        if disabledHP < 0.20 then
            setProperty('HPbar-y.visible',false)
            setProperty('HPbar-r.visible',true)
            setProperty('haha2.visible',true)
end
end
end

function onBeatHit()
if curStep < 800 then
    setProperty('HP.visible',true)
    setProperty('HPotherside.visible',false)
else if curStep > 800 then
    scaleObject('HPbar-g', disabledHP*0.75, 0.45)
    scaleObject('HPbar-y', disabledHP*0.75, 0.45)
    scaleObject('HPbar-r', disabledHP*0.75, 0.45)
    doTweenX('protecttX', 'protectanim', 210, 0.1, linear)
    doTweenY('protecttY', 'protectanim', 163, 0.1, linear)
    scaleObject('protectanim', -0.8, -0.8)
    doTweenX('hpnormalbartweenX', 'HPbar-g', 905, 0.1, linear)
    doTweenY('hpnormalbartweenY', 'HPbar-g', 84, 0.1, linear)
    doTweenX('hpynormalbartweenX', 'HPbar-y', 905, 0.1, linear)
    doTweenY('hpynormalbartweenY', 'HPbar-y', 84, 0.1, linear)
    doTweenX('hprnormalbartweenX', 'HPbar-r', 905, 0.1, linear)
    doTweenY('hprnormalbartweenY', 'HPbar-r', 83, 0.1, linear)
    setProperty('HPotherside.visible',true)
    setProperty('HP.visible',false)
end
end
end

function Reset()
    Letter=1
setTextString('battlestext','')
end
function onUpdate(elapsed)
if Question then
if keyboardJustPressed('UP') or keyJustPressed('up') then
    Up()
end
if keyboardJustPressed('LEFT') or keyJustPressed('left') then
    Left()
end
if keyboardJustPressed('RIGHT') or keyJustPressed('right') then
    Right()
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
end
function Left()
    if Selecthori>1 then
        Selecthori=Selecthori-1
        setProperty('moveselector.x',SelectPosHori[Selecthori])
    end
end
function Right()
    if Selecthori<2 then
        Selecthori=Selecthori+1
        setProperty('moveselector.x',SelectPosHori[Selecthori])
    end
end
function Up()
    if SelectVerti>1 then
        SelectVerti=SelectVerti-1
        setProperty('moveselector.y',SelectPosVerti[SelectVerti])
    end
end
function Down()
    if SelectVerti<2 then
        SelectVerti=SelectVerti+1
        setProperty('moveselector.y',SelectPosVerti[SelectVerti])
    end
end
function Accept()
    if getProperty('moveselector.visible') then
        hpdrain = disabledHP / 10
    if Selecthori==1 and SelectVerti==1 then
        playSound('confirmText',1)
        triggerEvent('battle',"P/O/N/Y/T/A /u/s/e/d /E/M/B/E/R/!",'Passed')
        runTimer('movewait', 1, 1)
        playSound('pokemonhit')
        disabledHP = disabledHP - 0.022
        setProperty('flareblitz.visible',false)
        setProperty('ember.visible',false)
        setProperty('protect.visible',false)
        setProperty('morningsun.visible',false)
        setProperty('moveselector.visible',false)
        triggerEvent('Opponent flash')
        Question=false
        completeddialouge= true
        hpdrain = hpdrain - 0.01
    elseif Selecthori==1 and SelectVerti==2 then
        playSound('confirmText',1)
        triggerEvent('battle',"P/O/N/Y/T/A /u/s/e/d /P/R/O/T/E/C/T/!",'Passed')
        runTimer('movewait', 1, 1)
        Protected = 1
        setProperty('flareblitz.visible',false)
        setProperty('ember.visible',false)
        setProperty('protect.visible',false)
        setProperty('morningsun.visible',false)
        setProperty('moveselector.visible',false)
        Question=false
        completeddialouge= true
        addLuaSprite('protectanim',true )
        setProperty('protectanim.visible',true)
        hpdrain = hpdrain - hpdrain
    elseif Selecthori==2 and SelectVerti==1 then
        playSound('confirmText',1)
        triggerEvent('battle',"P/O/N/Y/T/A /u/s/e/d /M/O/R/N/I/N/G /S/U/N/!",'Passed')
        runTimer('movewait', 1, 1)
        playSound('healing')
        setProperty('flareblitz.visible',false)
        setProperty('ember.visible',false)
        setProperty('protect.visible',false)
        setProperty('morningsun.visible',false)
        setProperty('moveselector.visible',false)
        setProperty('sprite.visible',false)
        Question=false
        completeddialouge= true
    elseif Selecthori==2 and SelectVerti==2 then
        playSound('confirmText',1)
        triggerEvent('battle',"P/O/N/Y/T/A /u/s/e/d /F/L/A/R/E /B/L/I/T/Z/!",'Passed')
        runTimer('movewait', 1, 1)
        playSound('pokemonhit')
        disabledHP = disabledHP - 0.066
        setProperty('flareblitz.visible',false)
        setProperty('ember.visible',false)
        setProperty('protect.visible',false)
        setProperty('morningsun.visible',false)
        setProperty('moveselector.visible',false)
        setProperty('haha.visible',false)
        triggerEvent('Opponent flash')
        Question=false
        completeddialouge= true
        hpdrain = hpdrain - 0.025
    end
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if Protected == 1 then
    health = getProperty('health')
    setProperty('health', health+ 0.0422111211111111111111111111111111111111111111111111111111111111);
    end
end

function onTimerCompleted(tag)
    if tag == 'movewait' then
        triggerEvent('battle force close')
    elseif tag == 'thing' then
        if Dialouge[Letter]~=nil then
            setTextString('battlestext',getTextString('battlestext')..Dialouge[Letter])
            Letter=Letter+1
        end
    end
end

function opponentNoteHit()
    if curStep < 1823 then
        health = getProperty('health')
        setProperty('health', health- hpdrain);
        triggerEvent('Screen Shake', '0.03, 0.01', '0.03, 0.01')
    end
end