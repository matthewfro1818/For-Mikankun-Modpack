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
    SelectPosHori={725,935}
    SelectPosVerti={540,610}
    ponytaHP=0.65
    Selecthori=1
    SelectVerti=1
    Question=false
    Passed=false
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
    makeLuaSprite('HPpony','language/'..language..'/HPpony',410, -50)
    setProperty('HPpony.antialiasing',false)
    scaleObject('HPpony',0.45,0.45)

    makeLuaSprite('HPbar-gp','HPbar-gp',1036, 63)
    setProperty('HPbar-gp.antialiasing',false)
    scaleObject('HPbar-gp',0.45,0.45)

    makeLuaSprite('HPbar-yp','HPbar-yp',1036, 63)
    setProperty('HPbar-yp.antialiasing',false)
    scaleObject('HPbar-yp',0.45,0.45)

    makeLuaSprite('HPbar-rp','HPbar-rp',1036, 63)
    setProperty('HPbar-rp.antialiasing',false)
    scaleObject('HPbar-rp',0.45,0.45) 

    makeLuaSprite('HPponyotherside','language/'..language..'/HPponyotherside',-250, 12)
    setProperty('HPponyotherside.antialiasing',false)
    scaleObject('HPponyotherside',0.65,0.65)
    
end

function onStepHit()
if curStep < 800 then
    scaleObject('HPbar-gp', ponytaHP * 0.72, 0.45)
    scaleObject('HPbar-yp', ponytaHP * 0.72, 0.45)
    scaleObject('HPbar-rp', ponytaHP * 0.72, 0.45)
    if ponytaHP < 0.34 then
        setProperty('HPbar-gp.visible',false)
    end
    if ponytaHP < 0.22 then
        setProperty('HPbar-yp.visible',false)
        setProperty('HPbar-rp.visible',true)
    else if ponytaHP > 0.34 then
        setProperty('HPbar-gp.visible',true)
    else if ponytaHP > 0.22 then
        setProperty('HPbar-yp.visible',true)
    end
    end
end
end
if curStep > 800 then
    scaleObject('HPbar-gp', ponytaHP, 0.65)
    scaleObject('HPbar-yp', ponytaHP, 0.65)
    scaleObject('HPbar-rp', ponytaHP, 0.65)
    if ponytaHP < 0.345 then
        setProperty('HPbar-gp.visible',false)
    end
    if ponytaHP < 0.216 then
        setProperty('HPbar-yp.visible',false)
        setProperty('HPbar-rp.visible',true)
    else if ponytaHP > 0.345 then
        setProperty('HPbar-gp.visible',true)
    else if ponytaHP > 0.216 then
        setProperty('HPbar-yp.visible',true)
    end
    end
    end
end
if getProperty 'sprite.visible' == false then
    health = getProperty('health')
    ponytaHP = ponytaHP + 0.35
    setProperty('health', health+ 0.5);
    setProperty('sprite.visible', true)
end
if getProperty 'haha.visible' == false then
    ponytaHP = ponytaHP - 0.085
    setProperty('haha.visible', true)
end
if ponytaHP > 0.65 then
    ponytaHP = 0.65
end
end


function onEvent(eventName, value1, value2)
if eventName=='disabled attacks' then
    health = getProperty('health')
    runTimer('thing', 0.05, 0)
    runTimer('movewait', 1, 1)
    Dialouge=stringSplit(value1,'/')
    setProperty('battletext.visible',true)
    setProperty('battlestext.visible',true)
        addLuaSprite('battletext',true)
        addLuaText('battlestext')
            if value2 == 'Succsesful' and getProperty 'protectanim.visible' == false then 
            ponytaHP = ponytaHP- 0.12
            setProperty('health', health- 0.2);
            playSound('pokemonhit')
            triggerEvent('Player flash')
        else
            setProperty('health', health- 0);
            end
        Reset()
end
end

function onBeatHit()
    if curStep < 800 then
        setProperty('HPpony.visible',true)
        setProperty('HPponyotherside.visible', false)
    else if curStep > 800 then
        scaleObject('HPbar-gp', ponytaHP* 0.72, 0.65)
        scaleObject('HPbar-yp', ponytaHP* 0.72, 0.65)
        scaleObject('HPbar-rp', ponytaHP* 0.72, 0.65)
        doTweenX('hpbartweenX', 'HPbar-gp', 100, 0.1, linear)
        doTweenY('hpbartweenY', 'HPbar-gp', 153, 0.1, linear)
        doTweenX('hpybartweenX', 'HPbar-yp', 100, 0.1, linear)
        doTweenY('hpybartweenY', 'HPbar-yp', 153, 0.1, linear)
        doTweenX('hprbartweenX', 'HPbar-rp', 100, 0.1, linear)
        doTweenY('hprbartweenY', 'HPbar-rp', 153, 0.1, linear)
        setProperty('HPponyotherside.visible',true)
        setProperty('HPpony.visible',false)
    end
    end
    if ponytaHP < 0 then
        setProperty('health', 0);
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


function onTimerCompleted(tag)
    if tag == 'movewait' then
        triggerEvent('battle force close')
    else if tag == 'thing' then
        if Dialouge[Letter]~=nil then
            setTextString('battlestext',getTextString('battlestext')..Dialouge[Letter])
            Letter=Letter+1
        end
        end
    end
end