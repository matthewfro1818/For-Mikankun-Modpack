--Code made by Drawoon_
--if you use this please give me credit
local Path='Mechanics/'
function onCreate()
    initSaveData('HypnosPref')
    beatInterval=2--Pendelum Interval
    if getDataFromSave('HypnosPref','Hell mode',false) and (songName=='Monochrome' or songName=='Safety Lullaby' or songName=='Left Unchecked' or songName=='Lost Cause') then
        SetInterval(1.5)
    end
    Starter=false
    tranceInterval=0
    PendelumActive=not getDataFromSave('HypnosPref','Pussy mode',false)
    trance=0
    VolumeStatic=0
    psyshockCooldown=80
    pendulumOffset=0
    OffsetPendelum={}
    PendelumBotplay=false
    precacheSound('TranceStatic')
end
function StartPendulum()
    if PendelumActive then
        Starter=true
    end
end
function CreatePendelum(start)
    if PendelumActive then
    if dadName=='HypnoF1' then
        --Penledum
        pendulumOffset=-9
        makeAnimatedLuaSprite('ShadowPendelum',Path..'Pendelum',500,500)
        scaleObject('ShadowPendelum',1.3, 1.3)
        addAnimationByPrefix('ShadowPendelum','idle','Pendelum instance 1',24,true)
        setProperty('ShadowPendelum.origin.y',0)
        setProperty('ShadowPendelum.origin.x',65)
    
        setProperty('ShadowPendelum.alpha',0)
        addLuaSprite('ShadowPendelum',true)
        makeAnimatedLuaSprite('Pendelum',Path..'Pendelum',500,500)
        scaleObject('Pendelum',1.3, 1.3)
        addAnimationByPrefix('Pendelum','idle','Pendelum instance 1',24,true)
        setProperty('Pendelum.origin.y',0)
        setProperty('Pendelum.origin.x',65)
    
        addLuaSprite('Pendelum',true)
    else
    makeAnimatedLuaSprite('ShadowPendelum',Path..'Pendelum_Phase2',0,0)
    setObjectCamera('ShadowPendelum','other')
    addAnimationByPrefix('ShadowPendelum','idle','Pendelum Phase 2',24,true)
    setProperty('ShadowPendelum.origin.y',0)
    setProperty('ShadowPendelum.origin.x',65)
    screenCenter('ShadowPendelum','x')
    setProperty('ShadowPendelum.alpha',0)
    addLuaSprite('ShadowPendelum')
    makeAnimatedLuaSprite('Pendelum',Path..'Pendelum_Phase2',0,0)
    setObjectCamera('Pendelum','other')
    addAnimationByPrefix('Pendelum','idle','Pendelum Phase 2',24,true)
    setProperty('Pendelum.origin.y',0)
    setProperty('Pendelum.origin.x',65)
    screenCenter('Pendelum','x')
    addLuaSprite('Pendelum')
    end
    --Extra
    makeAnimatedLuaSprite('Correct',Path..'Extras',530, 370)
    setObjectCamera('Correct','other')
    addAnimationByPrefix('Correct','Tick','Checkmark',24,false)
    setProperty('Correct.alpha',0)
    addLuaSprite('Correct',true)
    makeAnimatedLuaSprite('Incorrect',Path..'Extras',500, 350)
    setObjectCamera('Incorrect','other')
    addAnimationByPrefix('Incorrect','X','X finished',24,false)
    addLuaSprite('Incorrect',true)
    setProperty('Incorrect.alpha',0)
    playSound('TranceStatic',0,'TranceSound')
    --Psyshock
    makeAnimatedLuaSprite('Psyshock',Path..'Psyshock',530, 370)
    scaleObject('Psyshock',0.85, 0.85)
    addAnimationByPrefix('Psyshock','Psyshock','Full Psyshock Particle',24,false)
    setProperty('Psyshock.alpha',0)
    addLuaSprite('Psyshock',true)
    
    makeAnimatedLuaSprite('Static',Path..'StaticHypno',0, 0)
    setObjectCamera('Static','other')
    setGraphicSize('Static',screenWidth,screenHeight)
    addAnimationByPrefix('Static','Idle','StaticHypno',24,true)
    setProperty('Static.alpha',0)
    addLuaSprite('Static',true)
    Starter=start
    end
end
function onGameOver()
    removeLuaSprite('Pendelum')
end
function onUpdate(elapsed)
    if Starter and PendelumActive and luaSpriteExists('Pendelum') then
    local convertedTime = ((getSongPosition() / (crochet * beatInterval)) * math.pi)
    setProperty('Pendelum.angle',(math.sin(convertedTime) * 32)+pendulumOffset)
    local pendulumTimeframe = math.floor(((convertedTime / math.pi) - math.floor(convertedTime / math.pi)) * 1000) / 1000
	local reach = 0.2
    if pendulumTimeframe < reach or pendulumTimeframe > (1 - reach) then

            if not alreadyHit then
                canHitPendulum = true
            end
       
    else
        alreadyHit=false
        if canHitPendulum then
            if tranceInterval % 2 ==0  then
                BadPendelum()
            end  
            tranceInterval=tranceInterval+1
            canHitPendulum=false
        end
    end
    if keyJustPressed('space') and not alreadyHit and PendelumActive and Starter then
        if canHitPendulum then
        alreadyHit=true
        canHitPendulum=false
        GoodPendelum()
        else
            BadPendelum()
        end
    end
    if (botPlay or PendelumBotplay) and not alreadyHit and canHitPendulum and PendelumActive and Starter then
        alreadyHit=true
        canHitPendulum=false
        GoodPendelum()
    end
    end
    if PendelumActive then
    if luaSpriteExists('Correct') then
        if getProperty('Correct.animation.curAnim.finished') then
            setProperty('Correct.alpha',0)
        end
    end
    if luaSpriteExists('Incorrect') then
        if getProperty('Incorrect.animation.curAnim.finished') then
            setProperty('Incorrect.alpha',0)
        end
    end
    if luaSpriteExists('Psyshock') then
        if getProperty('Psyshock.animation.curAnim.finished') then
            setProperty('Psyshock.alpha',0)
        end
    end
    end
    if PendelumActive and Starter then
        trance=trance-(((curBpm / 200) / 1000) * (elapsed / (1 / 90)))
        setProperty('Static.alpha',trance/2)
    if trance>1 then
        VolumeStatic=(trance - 1) / 2
        setSoundVolume('TranceSound',VolumeStatic)
    else
        VolumeStatic=0
    end
    if trance>2 then
        trance=2
        setHealth(-1)
    end
    if trance < -0.25 then
		trance = -0.25
    end
        if boyfriendName=='LullabyGF' then
            if trance >= 0.8 then
                if trance >= 1.6 then
		            setProperty('boyfriend.idleSuffix','-Hypno')
                else
                    setProperty('boyfriend.idleSuffix','-LowHypno')
                end
            else
                setProperty('boyfriend.idleSuffix','')
            end
        end
    end
    if dadName=='HypnoF1' then
    PositionPendelum(getProperty('dad.animation.curAnim.name'),getProperty('dad.animation.curAnim.curFrame'))
    end
end
function PositionPendelum(Anim,Frame)
    OffsetPendelum={}
    if stringEndsWith(Anim,'UP') then
        if Frame==0 then
            OffsetPendelum={638,-300}
        elseif Frame==1 then
            OffsetPendelum={675,-267}
        elseif Frame==2 then
            OffsetPendelum={681,-257}
        elseif Frame==3 then
            OffsetPendelum={694,-249}
        elseif Frame==4 then
            OffsetPendelum={696,-241}
        elseif Frame==5 then
            OffsetPendelum={705,-237}
        elseif Frame==6 or  Frame==7 then
            OffsetPendelum={709,-236}  
        elseif Frame>=8 then
            OffsetPendelum={711,-234}
        end
    elseif stringEndsWith(Anim,'idle') then
        if Frame==0 or Frame==1 then
            OffsetPendelum={814,264}
        elseif Frame==2 or Frame==3 then
            OffsetPendelum={813,270}
        elseif Frame==4 then
            OffsetPendelum={813,266}
        elseif Frame==5 then
            OffsetPendelum={813,263}
        elseif Frame==6 then
            OffsetPendelum={814,255}
        elseif Frame==7 then
            OffsetPendelum={811,251}
        elseif Frame==8 or  Frame==9 then
            OffsetPendelum={809,249}
        elseif Frame>=10 then
            OffsetPendelum={808,248}
        end
    elseif stringEndsWith(Anim,'LEFT') then
        if Frame==0 then
            OffsetPendelum={775,336}
        elseif Frame==1 then
            OffsetPendelum={790,351}
        elseif Frame==2 then
            OffsetPendelum={826,366}
        elseif Frame==3 or  Frame==4 then
            OffsetPendelum={830,378}
        elseif Frame==5 or  Frame==6 then
            OffsetPendelum={831,393}
        elseif Frame>=7 then
            OffsetPendelum={832,396}
        end
    elseif stringEndsWith(Anim,'Psyshock') then
        if Frame==0 then
            OffsetPendelum={737,386}
        elseif Frame==1 then
            OffsetPendelum={713,396}
        elseif Frame==2 then
            OffsetPendelum={706,394}
        elseif Frame==3 then
            OffsetPendelum={708,392}
        elseif Frame==4 or  Frame==5 then
            OffsetPendelum={709,391}
        elseif Frame==6 then
            OffsetPendelum={709,405}
        elseif Frame>=7 then
            OffsetPendelum={703,416}
        end
    elseif stringEndsWith(Anim,'DOWN') then
        if Frame==0 then
            OffsetPendelum={700,222}
        elseif Frame==1 then
            OffsetPendelum={705,237}
        elseif Frame==2 then
            OffsetPendelum={692,220}
        elseif Frame==3 or Frame==4 then
            OffsetPendelum={687,213}
        elseif Frame==5 then
            OffsetPendelum={690,220}
        elseif Frame==6 then
            OffsetPendelum={689,227}
        elseif Frame==7 then
            OffsetPendelum={680,242}
        elseif Frame==8 then
            OffsetPendelum={679,243}
        elseif Frame>=9 then
            OffsetPendelum={673,253}
        end
    elseif stringEndsWith(Anim,'RIGHT') then
        if Frame==0 or Frame==1 or Frame==2 then
            OffsetPendelum={866,609}
        elseif Frame==3 then
            OffsetPendelum={858,612}
        elseif Frame==4 then
            OffsetPendelum={881,610}
        elseif Frame==5 or  Frame==4 then
            OffsetPendelum={901,597}
        elseif Frame==6 or  Frame==6 then
            OffsetPendelum={903,590}
        elseif Frame>=7 then
            OffsetPendelum={908,586}
        end
    end
    if PendelumActive then
        setProperty('Pendelum.x',getProperty('dad.x')+OffsetPendelum[1])
        setProperty('Pendelum.y',getProperty('dad.y')+OffsetPendelum[2])
        setProperty('ShadowPendelum.x',getProperty('dad.x')+OffsetPendelum[1])
        setProperty('ShadowPendelum.y',getProperty('dad.y')+OffsetPendelum[2])
    end
end
--Use this for change Interval in song
function SetInterval(new)
    beatInterval=new
end
function GoodPendelum()
    trance=trance-0.075
    setProperty('ShadowPendelum.alpha',0.5)
    setProperty('ShadowPendelum.angle',getProperty('Pendelum.angle'))
    runHaxeCode([[
        FlxTween.tween(game.getLuaObject('ShadowPendelum'), {alpha: 0}, Conductor.stepCrochet / 1000, {
            ease: FlxEase.linear,
            startDelay: Conductor.stepCrochet / 1000,
            onComplete: function(twn:FlxTween)
            {
                game.callOnLuas("onTweenCompleted",["ShadowPendelum"]);
            }
        });
    ]])
    setProperty('Correct.alpha',1)
    playAnim('Correct','Tick',true)

end
function BadPendelum()
    trance=trance+0.115
    setProperty('Incorrect.alpha',1)
    playAnim('Incorrect','X',true)

end
function onSoundFinished(tag)
    if tag=='TranceSound' then
        if  getHealth()>0 then
    playSound('TranceStatic',VolumeStatic,'TranceSound')
        end
    end
end
function onStepHit()
   if PendelumActive and getHealth()>0 and Starter then
       if getSongPosition()>20000 or songName~='Left Unchecked' then
            if psyshockCooldown<=0 then
                Psyshock()
                if dadName=='HypnoF1' then
                    playAnim('dad','Psyshock')
                    setProperty('dad.specialAnim',true)
                    psyshockCooldown=PsyshockCalculate(110, 65)
                else
                    psyshockCooldown=PsyshockCalculate(75,40)
                end
            else
                psyshockCooldown=psyshockCooldown-1
            end
       end
   end
end
function Psyshock()
    local Pos={x=825,y=-75}
    setProperty('Psyshock.flipX',false)
    if dadName == 'HypnoF2' then
        Pos={x=625,y=200}
    elseif dadName == 'Abomination_Hypno' then
        Pos={x=-100,y=200}
        setProperty('Psyshock.flipX',true)
    elseif dadName == 'Jigglypuff' then
        setProperty('Psyshock.visible',false)
    elseif boyfriendName=='Hypno' then
        setProperty('Psyshock.flipX',true)
    end
    setProperty('Psyshock.x',getProperty('dad.x')+Pos.x)
    setProperty('Psyshock.y',getProperty('dad.y')+Pos.y)
    setProperty('Psyshock.alpha',1)

playAnim('Psyshock','Psyshock')
playSound('Psyshock',0.6)
if flashingLights then cameraFlash('other','0xFFFFAFC1',1) end
trance =trance+ 0.25
end
function PsyshockCalculate(Start,Ending)
    local t=Start + (getSongPosition() / songLength) * (Ending - Start)
    local Result=stringSplit(t,'.')
    return tonumber(Result[1])
end
function onEndSong()
    PendelumActive=false
end