--[[
    Code made by Drawoon_
]]
function onCreate()
    initSaveData('HypnosPref')
    addLuaScript('scripts/Stuff/Character.lua')
    makeAnimatedLuaSprite('Hand', 'characters/Buryman/WA_assets', getCharacterX('dad')-786, getCharacterY('dad')-166)
    addAnimationByPrefix('Hand', 'Idle', 'WH_Idle', 24,true )
    addAnimationByPrefix('Hand', 'Intro', 'WH_Intro', 24,false )
    addAnimationByPrefix('Hand', 'ToGF', 'WH_ToGF', 24,false )
    setGraphicSize('Hand', getProperty('Hand.width')*6,getProperty('Hand.height')*6)
    setProperty('Hand.antialiasing',false)
    addLuaSprite('Hand',false)
    setProperty('Hand.visible',false)

    makeAnimatedLuaSprite('Pokeball','characters/Missingno/missingnopokeball_assets',getCharacterX('bf')-500, getCharacterY('bf')+100)
    addAnimationByPrefix('Pokeball','throw', 'Ball_Throw', 24, false)
    addAnimationByPrefix('Pokeball','idle', 'Ball_Idle_Normal', 24, false)
    addAnimationByPrefix('Pokeball','break1', 'Ball_Idle_Break01', 24, false)
    addAnimationByPrefix('Pokeball','break2', 'Ball_Idle_Break02', 24, false)
    addAnimationByIndices('Pokeball','burst1', 'Ball_FinalBurst', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35', 24)
    addAnimationByIndices('Pokeball','burst2', 'Ball_FinalBurst', '36, 37, 38, 39, 40, 41, 42, 43, 44', 24)
    addAnimationByPrefix('Pokeball','full-break1', 'Ball_Break01', 24, false)
    addAnimationByPrefix('Pokeball','full-break2', 'Ball_Break02', 24, false)
    scaleObject('Pokeball',6,6)
    setProperty('Pokeball.antialiasing',false)
    addLuaSprite('Pokeball',true)
    setProperty('Pokeball.visible',false)

    phase=0


   makeLuaSprite('Shadow','stage/Buried/shadow',getCharacterX('dad')-786,getCharacterY('dad')-226)
   setGraphicSize('Shadow',getProperty('Shadow.width')*6,getProperty('Shadow.height')*6)
 setProperty('Shadow.antialiasing',false)
 addLuaSprite('Shadow',false)
 setProperty('Shadow.visible',false)
 
 
end
function onEvent(name, value1, value2)
    if name=='Spawn' then
        if value1=='Missingno' then

            missingno()
        elseif value1=='ApparitionGF' then
            apparitionGF(value2)
        elseif value1=='Gengar' then
            gengar()
        
        elseif value1=='Leanmonster' then
            leanmonster()
        end
    end
    if name=='ChangeSingCharacter' then
        local Character=value1
        local Portair=value2
        if Portair=='DAD' then
            local Prefix=''
            if Character=='Gengar' then
                Prefix='-gengar'
            elseif stringStartsWith(Character,'Apparition') then
                Prefix='-gf'
            elseif Character=='Muk' then
                Prefix='-muk'
            end
            callScript('scripts/Stuff/HypnosPauseState.lua','ChangeSuffix',{'right',Prefix})
        else
            local Prefix=''
            if Character=='Missingno' then 
                Prefix='-missingno'
            end
            callScript('scripts/Stuff/HypnosPauseState.lua','ChangeSuffix',{'left',Prefix})
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
 
end
function missingno()
    CharPlayAnim('boyfriend', 'throw' ,true)
end
function gengar()
	setProperty('gengarEntrace.visible',true)
    playAnim('gengarEntrace','entrance')
end
function leanmonster()
    setProperty('Muk.visible',true)
    CharPlayAnim('Muk','Intro',true)
end
function apparitionGF(tag)
    if tag=='Hand' then
        handY=getProperty('Hand.y')
    setProperty('Shadow.visible',true)
    setProperty('Hand.visible',true)
    playAnim('Hand','Intro',true)
    elseif tag=='Apparition' then
        apparitionX = getProperty('Hand.x')+230
        apparitionY = handY + 250
        playAnim('Hand','ToGF',true)
        if luaSpriteExists('Pendelum') then
            setProperty('Pendelum.alpha',0)
            setProperty('Pendelum.visible',true)
            StartPendelum()
            doTweenAlpha('PendelumSpawn','Pendelum',1,5,'linear')
        end
    end
    

  
end
function onUpdate(elapsed)

local gengarEntraceAnim=getProperty('gengarEntrace.animation.curAnim.name')
local missingnoAnim=getProperty('Pokeball.animation.curAnim.name')
local missingnoFinished=getProperty('Pokeball.animation.curAnim.finished')

if getProperty('gengarEntrace.animation.curAnim.finished') and gengarEntraceAnim=='entrance' and getProperty('gengarEntrace.visible') then
    scaleObject('gengarEntrace',3.3,3.3)
    playAnim('gengarEntrace','exit',true)
elseif getProperty('gengarEntrace.animation.curAnim.finished') and gengarEntraceAnim=='exit' and getProperty('gengarEntrace.visible') then
     setProperty('gengarEntrace.visible',false)
     setProperty('Gengar.visible',true)
end
if missingnoFinished and getProperty('Pokeball.visible') then
    if missingnoAnim=='throw' then
        playAnim('Pokeball', 'break1' ,true)
    else
        if phase==0 then
            playAnim('Pokeball', 'break1' ,true)
        elseif phase==1 then
            playAnim('Pokeball', 'break1' ,true)
        elseif phase==2 then
            playAnim('Pokeball', 'full-break1' ,true)
        elseif phase==3 then
            playAnim('Pokeball', 'break1' ,true)
        elseif phase==4 then
            playAnim('Pokeball', 'break1' ,true)
        elseif phase==5 then
            playAnim('Pokeball', 'break1' ,true)
        elseif phase==6 then
            playAnim('Pokeball', 'full-break2' ,true)
        elseif phase==7 then
            playAnim('Pokeball', 'break2' ,true)
        elseif phase==8 then
            playAnim('Pokeball', 'break2' ,true)
        elseif phase==9 then
            playAnim('Pokeball', 'burst1' ,true)
        elseif phase==10 then
            playAnim('Pokeball', 'burst2' ,true)
            setProperty('Missingno.visible',true)
        else
            setProperty('Pokeball.visible',false)
        end
        phase=phase+1
    end
end
if getProperty('boyfriend.animation.curAnim.finished') then
    if getProperty('boyfriend.animation.curAnim.name')=='throw' then
        CharPlayAnim('boyfriend', 'throw2' ,true)
        playAnim('Pokeball', 'throw' ,true)
        setProperty('Pokeball.visible',true)
    end
end
if  getProperty('Hand.visible') then
    setProperty('Hand.y',handY + math.sin((180 / math.pi) * ((getSongPosition() / 1000) / 48)) * 32)
    setProperty('Shadow.x',getProperty('Hand.x'))
end
if getProperty('Hand.animation.curAnim.name') == 'ToGF' or getProperty('Apparition.visible') then
    setProperty('Apparition.y',apparitionY + math.sin((180 / math.pi) * ((getSongPosition() / 1000) / 48)) * 32)
    setProperty('Apparition.x',apparitionX + math.cos((180 / math.pi) * ((getSongPosition() / 1000) / 48)) * 32)
    setProperty('Shadow.x',getProperty('Apparition.x') - (getProperty('Shadow.width') / 2) + (getProperty('Shadow.width') / 9))
    setProperty('Shadow.y',Lerp(getProperty('Shadow.y'), apparitionY - 48, elapsed * 0.4))
else 
    if getProperty('Hand.visible') then
        setProperty('Shadow.y',handY-100)
    end
end
if getProperty('Hand.animation.curAnim.finished') then
    if getProperty('Hand.animation.curAnim.name') == 'ToGF' then
        setProperty('Hand.visible',false)
        setProperty('Apparition.visible',true)
        if getDataFromSave('HypnosPref','Hell mode',false) then
            
            
        end
    else
        playAnim('Hand','Idle',true)
    end
end


end
function AddCharacter(Name,tag,tYpe,PosX,PosY)
     callScript('scripts/Stuff/Character.lua','CreateCharacter',{Name,tYpe,PosX,PosY,tag})
     setProperty(tag..'.visible',false)
end
function onCreatePost()
    --Make all the characters
    AddCharacter('ApparitionGF','Apparition','DAD',getProperty('dad.x'),getProperty('dad.y'))
    AddCharacter('Leanmonster','Muk','DAD',getProperty('dad.x')-870+600,getProperty('dad.y')-100+400)
    AddCharacter('Gengar','Gengar','DAD',getProperty('dad.x')-400-345-50,getProperty('dad.y')-326+425-100)
    AddCharacter('ba_Missingno','Missingno','BF',getProperty('dad.x')-700+160,getProperty('boyfriend.y')+475-1275)
end
function CharPlayAnim(Char,anim,force)
    playAnim(Char,anim,force)
    setProperty(Char..'.specialAnim',true)
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
 end