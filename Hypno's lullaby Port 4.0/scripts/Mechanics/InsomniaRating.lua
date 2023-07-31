function onCreate()
    addHaxeLibrary('HealthIcon')
    precacheSound('feraligatrWakes')
    initSaveData('HypnosPref')
    addHaxeLibrary('FlxSound','flixel.system')
    isHell=getDataFromSave('HypnosPref','Hell mode',false)
    DisabledMechanic=getDataFromSave('HypnosPref','Pussy mode',false)

    accuracyThreshold=0.9
    if isHell then
        accuracyThreshold=0.98
    end
end
function onCreatePost()
    runHaxeCode([[
        var iconFeraligatr:HealthIcon = new HealthIcon('feraligatr',false);
        game.add(iconFeraligatr);
        iconFeraligatr.cameras=[game.camHUD];
        iconFeraligatr.scale.x=0.5;
        iconFeraligatr.scale.y=0.5;
        setVar("iconFeraligatr",iconFeraligatr);
    ]])
    setObjectOrder('iconFeraligatr',getObjectOrder('iconP2')+1)
end
local accuracyBelow=false
local accuracyCameraMove=false
local forceZoom=0
local soundVolume=1
function onSoundFinished(tag)
    if tag=='accuracySound' then
        setHealth(0)
    end
end
function onGameOver()
    runHaxeCode([[
        if(getVar("VocalsCus")!=null){
            getVar("VocalsCus").pause();
        }
    ]])
end
function onUpdate(elapsed)
    setProperty('iconFeraligatr.x',getProperty('iconP2.x')-50)
    setProperty('iconFeraligatr.y',getProperty('iconP2.y')+30)
    scaleObject('iconFeraligatr',0.5*getProperty('iconP2.scale.x'),0.5*getProperty('iconP2.scale.y'),false)
    if rating<accuracyThreshold and hits>0 and not DisabledMechanic then

        if not accuracyBelow then
            accuracyBelow = true
            runTimer('StartAwake',0.5)
        end
        if accuracyCameraMove and luaSoundExists('accuracySound') then
            setProperty('iconFeraligatr.animation.curAnim.curFrame',1)
            local accuracySoundLength=runHaxeCode([[return game.modchartSounds.get("accuracySound").length; ]])
            forceZoom = Lerp(forceZoom, ((getSoundTime('accuracySound') / accuracySoundLength) / 1.5), elapsed * 2.4)
            setGlobalFromScript('scripts/Stuff/CameraMove','ExtraZoom',forceZoom)
            soundVolume = Lerp(soundVolume, 0.4, elapsed / (1 / 60))
            
            runHaxeCode([[
                if(getVar("VocalsCus")!=null){
                    getVar("VocalsCus").volume=]]..soundVolume..[[;
                }
                if(FlxG.sound.music!=null){
                    FlxG.sound.music.volume=]]..soundVolume..[[;
                }
            ]])
        end
    elseif not DisabledMechanic and not luaSpriteExists('FeraligatrEnd') then
        setProperty('iconFeraligatr.animation.curAnim.curFrame',0)
        if accuracyBelow then
            forceZoom = 0
            setGlobalFromScript('scripts/Stuff/CameraMove','ExtraZoom',forceZoom)
            pauseSound('accuracySound')
            setSoundTime('accuracySound',0)
            accuracyBelow = false
            accuracyCameraMove = false
            callScript('scripts/Stuff/CameraMove','fpSong')
        else
            soundVolume = Lerp(soundVolume, 1, elapsed / (1 / 60))
            runHaxeCode([[
                if(getVar("VocalsCus")!=null){
                    getVar("VocalsCus").volume=]]..soundVolume..[[;
                }
                if(FlxG.sound.music!=null){
                    FlxG.sound.music.volume=]]..soundVolume..[[;
                }
            ]])
        end
    end
end
function onUpdatePost(elapsed)
    runHaxeCode([[
        if(getVar("VocalsCus")==null && !game.startingSong){
            var Vocals=game.vocals;
            game.vocals=new FlxSound();
            setVar("VocalsCus",Vocals);
        }
    ]])
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    Accuary()
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    Accuary()
end
function Accuary()
    if not botPlay and not DisabledMechanic then
        local determine = (rating - accuracyThreshold);
        determine=determine * (1 / ((100 - (accuracyThreshold*100)) / 100));
        accuracyColor=getColorFromRGB(toInt(math.max(255 - (determine * 255), 0)), toInt(math.min(determine * 255, 255)), 0,true)
        if accuracyBelow then
            accuracyColor=getColorFromHex('FF0000')
        end
        setProperty('scoreTxt.color',accuracyColor)
        if luaTextExists('Accuary') then
            setProperty('Accuary.color',accuracyColor)
        end
    end
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end
function toInt(float)
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='StartAwake' then
        if accuracyBelow then
            accuracyCameraMove = true
            setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{getProperty('gf.x')+getProperty('gf.width')/2,getProperty('gf.y')+getProperty('gf.height')/3})
            playSound('feraligatrWakes',1,'accuracySound')
            
        end
    end
    if tag=="ResetVocals" then
        ResetVocals()
    end
end
function onCustomSubstateCreate(name)
    if getProperty('paused') then
        runHaxeCode([[
            if(getVar("VocalsCus")!=null) {
                getVar("VocalsCus").pause();
            }
        ]])
    end
end
function onPause()
    runHaxeCode([[
        if(getVar("VocalsCus")!=null) {
			getVar("VocalsCus").pause();
		}
    ]])
end
function onResume()
    ResetVocals()
end
function onSongStart()
    runTimer('ResetVocals',0.2)
end
function ResetVocals()
    runHaxeCode([[
        if (FlxG.sound.music != null && getVar("VocalsCus")!=null && !game.startingSong)
		{
            getVar("VocalsCus").pause();

            if (Conductor.songPosition <= getVar("VocalsCus").length)
            {
                getVar("VocalsCus").time = Conductor.songPosition;
                getVar("VocalsCus").pitch = game.playbackRate;
            }
		    getVar("VocalsCus").play();
		}
    ]])
end