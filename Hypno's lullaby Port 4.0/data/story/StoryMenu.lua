local Path="menu/Story/"
local WeeksName={}
local Name={}
local WeekDefault={
    {weekFile='HypnoWeek',week="Hypno's Lullaby"},
    {weekFile='LostSilverWeek',week="Lost Silver"},
    {weekFile='GlitchWeek',week="Missingno"}
}
local Selecter=1
function onCreate()
    --luaDebugMode=true
    
    initSaveData('UnlockData')
    setDataFromSave('UnlockData','HypnoWeek',true)
    flushSaveData('UnlockData')
    playMusic('HYPNO_MENU',0.7,true)
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    for i=1,#WeekDefault do
        if getDataFromSave('UnlockData',WeekDefault[i].weekFile,false) then
            makeAnimatedLuaSprite(WeekDefault[i].weekFile,Path..WeekDefault[i].weekFile)
            addAnimationByPrefix(WeekDefault[i].weekFile,'idle',WeekDefault[i].weekFile..'0',24,true)
            addAnimationByPrefix(WeekDefault[i].weekFile,'Play',WeekDefault[i].weekFile..'Confirm0',24,false)
            scaleObject(WeekDefault[i].weekFile,0.6,0.6)
            setObjectCamera(WeekDefault[i].weekFile,'other')
            screenCenter(WeekDefault[i].weekFile,'xy')
            addLuaSprite(WeekDefault[i].weekFile)
            playAnim(WeekDefault[i].weekFile,'idle',true)
            table.insert(WeeksName,WeekDefault[i].weekFile)
            table.insert(Name,WeekDefault[i].week)
        end
    end
    makeAnimatedLuaSprite('Gameboy',Path..'CampaignBoy',0,480)
    addAnimationByIndicesLoop('Gameboy','idle','allcombined',GetPoints(1, 16),24)
    addAnimationByIndices('Gameboy','Play','allcombined',GetPoints(17, 72),24)
    addAnimationByIndices('Gameboy','Play-alt','allcombined',GetPoints(89, 72),24)
    setObjectCamera('Gameboy','other')
    scaleObject('Gameboy',0.6,0.6)
    screenCenter('Gameboy','x')
    addLuaSprite('Gameboy',true)
    playAnim('Gameboy','idle')

    makeLuaSprite('White',nil,0,0)
    makeGraphic('White',screenWidth,screenHeight/8,'FFFFFF')
    setObjectCamera('White','other')
    addLuaSprite('White')
    makeLuaText('WeekTxt',Name[1],0,0,screenHeight/16)
    setObjectCamera('WeekTxt','other')
    setTextAlignment('WeekTxt','left')
    setTextSize('WeekTxt',24)
    setTextColor('WeekTxt','000000')
    setTextBorder('WeekTxt',0)
    setTextFont('WeekTxt','poketext.ttf')
    addLuaText('WeekTxt')
    setProperty('WeekTxt.y',(screenHeight/16)-getProperty('WeekTxt.height')/2)
    setProperty('WeekTxt.x',(screenWidth/2)-(getProperty('WeekTxt.width')/2))
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isFreeplay',false)
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
end
local displacementX = 0
local displacementY = 0
local isloadingSong=false
local Charging=false
local TimerMissingno=false
local MovesMades=0
function onUpdate(elapsed)
    
    local BeforeSelecter=Selecter
    if keyJustPressed('back') and not isloadingSong then
        callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
    end
    if keyJustPressed('left') and not isloadingSong then
        Selecter=Selecter-1
        if Selecter<1 then
            Selecter=#WeeksName
        end
        MovesMades=MovesMades+1
        if not TimerMissingno then
            TimerMissingno=true
            runTimer('TimeForMissingno',2)
        end
    end
    if keyJustPressed('right') and not isloadingSong then
        Selecter=Selecter+1
        if Selecter>#WeeksName then
            Selecter=1
        end
        MovesMades=MovesMades+1
        if not TimerMissingno then
            TimerMissingno=true
            runTimer('TimeForMissingno',2)
        end
    end
    if TimerMissingno and MovesMades> 25 and not getDataFromSave('UnlockData','GlitchWeek',false) then
        setDataFromSave('UnlockData','GlitchWeek',true)
        flushSaveData('UnlockData')
        makeAnimatedLuaSprite('GlitchWeek',Path..'GlitchWeek')
        addAnimationByPrefix('GlitchWeek','idle','GlitchWeek0',24,true)
        addAnimationByPrefix('GlitchWeek','Play','GlitchWeekConfirm0',24,false)
        scaleObject('GlitchWeek',0.6,0.6)
        setObjectCamera('GlitchWeek','other')
        screenCenter('GlitchWeek','xy')
        addLuaSprite('GlitchWeek')
        playAnim('GlitchWeek','idle',true)
        table.insert(WeeksName,'GlitchWeek')
        table.insert(Name,"Missingno")
    end
    if keyJustPressed('accept') and not isloadingSong then
        local Suffix=''
        if WeeksName[Selecter]=='GlitchWeek' then
            displacementX = 32
			displacementY = -16
            setProperty(WeeksName[Selecter]..'.x',getProperty(WeeksName[Selecter]..'.x')+32)
            setProperty(WeeksName[Selecter]..'.y',getProperty(WeeksName[Selecter]..'.y')-16)
            Suffix='-alt'
        end
        isloadingSong=true
        playAnim('Gameboy','Play'..Suffix)
        playAnim(WeeksName[Selecter],'Play')
    end
    if luaSpriteExists(WeeksName[Selecter]) then
        if getProperty(WeeksName[Selecter]..'.animation.curAnim.finished') and isloadingSong and not Charging then
            setProperty(WeeksName[Selecter]..'.visible',false)
            Charging=true
            soundFadeOut('',0.25, 0)
            runTimer('FadeOut',0.25)
        end
    end
    setTextString('WeekTxt',Name[Selecter])
    setProperty('WeekTxt.y',(screenHeight/16)-getProperty('WeekTxt.height')/2)
    setProperty('WeekTxt.x',(screenWidth/2)-(getProperty('WeekTxt.width')/2))
    for i=1,#WeeksName do
        local RealI=i-1

        setProperty(WeeksName[i]..'.x',getProperty('Gameboy.x')+getProperty('Gameboy.width')/2-getProperty(WeeksName[i]..'.width')/2)
        setProperty(WeeksName[i]..'.y',-225)
        if WeeksName[Selecter]=='GlitchWeek' then
            setProperty(WeeksName[Selecter]..'.x',getProperty(WeeksName[Selecter]..'.x')+displacementX)
            setProperty(WeeksName[Selecter]..'.y',getProperty(WeeksName[Selecter]..'.y')+displacementY)
        end
        setProperty(WeeksName[i]..'.angle',Lerp(getProperty(WeeksName[i]..'.angle'),-((i - Selecter) * 60),elapsed / (1 / 15)))
        setProperty(WeeksName[i]..'.x',getProperty(WeeksName[i]..'.x')-math.sin(getProperty(WeeksName[i]..'.angle')*(math.pi/180))*550)
        setProperty(WeeksName[i]..'.y',getProperty(WeeksName[i]..'.y')+math.cos(getProperty(WeeksName[i]..'.angle')*(math.pi/180))*550)
        if Selecter==i then
        setProperty(WeeksName[i]..'.alpha',1)
        else
            setProperty(WeeksName[i]..'.alpha',0.5)
        end
    end

        
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='FadeOut' then
        playSound('GameboyStartup',0.25,'Startweek')
    end
    if tag=='TimeForMissingno' then
        TimerMissingno=false
        MovesMades=0
    end
end
function onSoundFinished(tag)
    if tag=='Startweek' then
        callScript('scripts/Stuff/GeneralMenuStuff','LoadWeek',{WeeksName[Selecter],1})
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function GetPoints(First,TotalAdd)
    List=First
    for i=1,TotalAdd-1 do
        List=List..','..tonumber((First - 1) + i)
    end
    return List
end