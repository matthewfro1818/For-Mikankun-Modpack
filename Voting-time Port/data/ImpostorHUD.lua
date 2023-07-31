function onCreate()
    Text=getTextFromFile('data/'..songPath..'/info.txt')
    makeLuaText('CreditsTxt',Text,0,12,212)
    setTextAlignment('CreditsTxt','left')
    setTextSize('CreditsTxt',24)
    setObjectCamera('CreditsTxt','other')
    addLuaText('CreditsTxt')
    makeLuaSprite('CreditsBG',nil,getProperty('CreditsTxt.x')-12,getProperty('CreditsTxt.y')-12)
    makeGraphic('CreditsBG',getProperty('CreditsTxt.width')+24,getProperty('CreditsTxt.height')+24,'FFFFFF')
    setProperty('CreditsBG.alpha',0.4)
    setObjectCamera('CreditsBG','other')
    addLuaSprite('CreditsBG')
    TasksPosX(-getProperty('CreditsBG.width'))
end
function TasksPosX(x)
    setProperty('CreditsTxt.x',x)
    setProperty('CreditsBG.x',x)
end 
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
 end
local Credits=false
function onUpdate(elapsed)
    setProperty('timeTxt.visible',false)
    setProperty('timeBar.alpha',0)
    if getProperty('timeBar.percent')>0 and  (not hideHud or not hideTime) then
        setProperty('TimeBar.visible',true)
        setGraphicSize('TimeBar',(getProperty('TimeBarBG.width')-8)*(getProperty('timeBar.percent')/100),getProperty('TimeBarBG.height')-8)
    end
    if not Credits and startedCountdown then

        TasksPosX(Lerp(getProperty('CreditsBG.x'),0,0.1))
    else
        TasksPosX(Lerp(getProperty('CreditsBG.x'),-getProperty('CreditsBG.width'),0.1))
    end
    if curBeat >= 2 then
        if getProperty('CreditsBG.x')>-0.9 then
            Credits=true
        end
    end
end
function onCreatePost()
    if not hideHud or not hideTime then
        makeLuaSprite('TimeBarBG','timeBar',42+(screenWidth/2)- 585,getProperty('timeBar.y'))
        setObjectCamera('TimeBarBG','hud')
        addLuaSprite('TimeBarBG')
        
        makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+3.5,getProperty('TimeBarBG.y')+4)
        makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'44d844')
        setObjectCamera('TimeBar','hud')
        addLuaSprite('TimeBar')
        setProperty('TimeBar.visible',false)
        makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,getProperty('TimeBarBG.y')+2)
        setTextBorder('TimeTxt',1,'000000')
        setTextSize('TimeTxt',12)
        addLuaText('TimeTxt')
    end
end