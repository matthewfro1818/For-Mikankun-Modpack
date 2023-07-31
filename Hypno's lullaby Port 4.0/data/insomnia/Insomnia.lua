local Path='stage/Feralisleep/'
function onCreate()
    setProperty('skipCountdown',true)
    precacheSound(Path..'InsomniaEnd')
    precacheImage(Path..'Feraligatr Ending Animation')
    precacheImage(Path..'Silver Ending Animation')
    precacheImage(Path..'ZZZ Ending Animation')
end
function onUpdate(elapsed)
    for i=0,3 do 
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end

    if luaSpriteExists('FeraligatrEnd') then     
        if getProperty('FeraligatrEnd.animation.curAnim.finished') and getProperty('FeraligatrEnd.visible') then
            setProperty('FeraligatrEnd.visible',false)
            cameraFade('game','000000',0,true)
            runTimer('EndSong',1)
        elseif getProperty('FeraligatrEnd.animation.curAnim.curFrame')>=137 then
            setProperty('gf.visible',false)
            setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{getProperty('gf.x')+getProperty('gf.width')/2,getProperty('gf.y')+getProperty('gf.height')/3})
        end
    end
end
local IsGameover=true
function onGameOver()
    if IsGameover then
        makeLuaSprite("Back",nil,-500,-500)
        makeGraphic('Back',screenWidth*4,screenHeight*4,'000000')
        addLuaSprite('Back',true)
        openCustomSubstate('InsomniaGameover',true)
        IsGameover=not IsGameover
    end
    return Function_Stop
end
function onCustomSubstateCreate(name)
    if name=='InsomniaGameover' then
        MakeVideoSprite("InsomniaGameOver",0,0,'feraligatr')
    end
end
function onCustomSubstateUpdate(name, elapsed)
    if name=='InsomniaGameover' then
        if runHaxeCode([[return getVar("InsomniaGameOver")!=null;]]) then
            setGraphicSize('InsomniaGameOver',screenWidth,screenHeight)
        end
        if keyJustPressed('accept') then
            restartSong()
        end
        if keyJustPressed('back') then
            callScript('scripts/Stuff/PlayStuff.lua','toMenu')
        end
    end
end
function MakeVideoSprite(tag,x,y,VideoName)
    addHaxeLibrary('MP4Handler','vlc')
    runHaxeCode([[
        var filepath:String = Paths.video("]]..VideoName..[[");
        var Video:MP4Handler = new MP4Handler();
        Video.playVideo(filepath);
        Video.alpha=0;
        Video.volume=0;
        setVar("]]..tag..[["+"Video",Video);
        Video.readyCallback = function()
        {
            var VideoSprite:FlxSprite= new FlxSprite(]]..x..[[,]]..y..[[).loadGraphic(Video.bitmapData);
            CustomSubstate.instance.add(VideoSprite);
            setVar("]]..tag..[[",VideoSprite);
        }
        Video.finishCallback = function()
        {
            game.callOnLuas("onFinishedSpriteVideo",["]]..tag..[[","]]..VideoName..[["]);
            return;
        }
    ]])
end
function EarlyEndSong()
    ActiveEndCutscene()
end
function ActiveEndCutscene()
    setProperty('dad.visible',false)
    makeAnimatedLuaSprite('FeraligatrEnd',Path..'Feraligatr Ending Animation',getCharacterX('gf')-720,getCharacterY('gf')-360)
    addAnimationByPrefix('FeraligatrEnd','idle','Feraligatr',24,false)
    addLuaSprite('FeraligatrEnd',true)
    makeAnimatedLuaSprite('SilverEnd',Path..'Silver Ending Animation',getCharacterX('dad')-95,getCharacterY('dad')-15)
    addAnimationByPrefix('SilverEnd','idle','Silver instancia 1',24,false)
    addLuaSprite('SilverEnd',false)
    makeAnimatedLuaSprite('ZZZEnd',Path..'ZZZ Ending Animation',getCharacterX('gf')-720,getCharacterY('gf')-360)
    addAnimationByPrefix('ZZZEnd','idle','single Z fin',24,false)
    addLuaSprite('ZZZEnd',true)
    doTweenAlpha('HudFADE','camHUD',0,4*(stepCrochet/1000),'linear')
    playSound('InsomniaEnd',1,'InsomniaEnd')
end
