--That Code is Made by Drawoon_

function onCreatePost()
    if not middlescroll then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes',i,'x',(160 * 0.7) * (i%4)+50+42+((screenWidth / 2) * 1))
            if i>3 then
                setPropertyFromGroup('strumLineNotes',i,'x',(160 * 0.7) *(i%4)+50+42+((screenWidth / 2) * 0))
            end
        end
    else
        for i=0,3 do
            setPropertyFromGroup('strumLineNotes',i,'alpha',0.35)
        end
    end
    
end
function onUpdate(elapsed)


    setShaderFloat('ShaderCont','time',getSongPosition() / (stepCrochet * 8))
 
    IntensitySnow=getProperty('ShaderCont.y')
    AmountSnow=toInt(getProperty('ShaderCont.x'))
    setShaderFloat('ShaderCont','intensity',IntensitySnow)
    setShaderInt('ShaderCont','amount',AmountSnow)
end
local WasTrigger=false
function onGameOver()
    setGlobalFromScript('scripts/Stuff/CameraMove','cameraCentred',false)
    if not WasTrigger then
        WasTrigger=true
        if not isRunning('scripts/Stuff/CameraMove') then
            addLuaScript('scripts/Stuff/CameraMove')
        end
        
        setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',true)
        setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{0,600})
        
        setProperty('camHUD.visible',false)
        openCustomSubstate('FrostbiteGameOver',false)
    end
    return Function_Stop
end
local IsGameOver=false
function onCustomSubstateCreate(name)
    if name=='FrostbiteGameOver' then
        IsGameOver=true
        
        doTweenAlpha('FGm','Freakachu',0,1,'QuadInout')
        local BackSprites={'Back','Charizard','Blastoise','Pokemon'}
        for i=1,#BackSprites do
        doTweenColor("Back"..i,BackSprites[i],'0A0A0A',1,'QuadInout')
        end
        MakeVideoSprite("FrostbiteGameOver",getProperty('boyfriend.x')-500,getProperty('boyfriend.y')-50,'frostbite')
        
        playSound('MtSilverStart',1,'StartGameOver')
    end
end
function onPause()
    if IsGameOver then
        return Function_Stop
    end
end
function lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
local RedTween=true
function onCustomSubstateUpdate(name, elapsed)
    if name=='FrostbiteGameOver' then
        setProperty('paused',true)
        setProperty('persistentUpdate',true)
        runHaxeCode([[
            FlxG.sound.music.volume=0;
            game.vocals.volume=0;
            FlxG.sound.music.pause();
            PlayState.instance.vocals.pause();
            game.KillNotes();
        ]])
        if keyJustPressed('accept') and not EndGame then
            pauseSound('StartGameOver')
            playSound('MtSilverEnd',1,'EndGameOver')
            EndGame=true
        end
        if keyJustPressed('back') then
            callScript('scripts/Stuff/PlayStuff','toMenu')
        end
        if EndGame then
            stopSound('LoopGameOver')
        end
        if getSoundTime('StartGameOver')>=2500 and RedTween then
            RedTween=false
            doTweenColor("FogGM",'Fog','0x6CFC0000',2.75,'expoIn')
            if getProperty('Fog.alpha')<0.5 then
                doTweenAlpha("FogGMAlpha",'Fog',0.5,1.25,'expoIn')
            end
        end
        setProperty('defaultCamZoom',lerp(1.2,getProperty('camGame.zoom'),0.95))
        setProperty('camGame.zoom',getProperty('defaultCamZoom'))
        if runHaxeCode("return getVar(\"FrostbiteGameOver\")!=null") then
            setObjectOrder('FrostbiteGameOver',getObjectOrder('boyfriendGroup')+1)
            --setProperty('FrostbiteGameOver.alpha',1)
            scaleObject('FrostbiteGameOver',0.6,0.6)
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
        
        setVar("]]..tag..[["+"Video",Video);
        Video.readyCallback = function()
        {
            Video.volume=0;
            var VideoSprite:FlxSprite= new FlxSprite(]]..x..[[,]]..y..[[).loadGraphic(Video.bitmapData);
            game.add(VideoSprite);
            setVar("]]..tag..[[",VideoSprite);
        }
        Video.finishCallback = function()
        {
            game.callOnLuas("onFinishedSpriteVideo",["]]..tag..[[","]]..VideoName..[["]);
            return;
        }
    ]])
end
local EndGame=false
function onSoundFinished(tag)
    if tag=='EndGameOver' then
        restartSong()
    end
    if tag=='LoopGameOver' and EndGame then
        playSound('MtSilverLoop',1,'LoopGameOver')
    end
    if tag=='StartGameOver' then
        playSound('MtSilverLoop',1,'LoopGameOver')
    end
end
function onCreate()
    setProperty('skipCountdown',true)
    addCharacterToList('Red_Dead', 'dad')
    healthBarWidth= getProperty('healthBar.width')
    setProperty('iconP1.flipX',true)
    healthBarX = getProperty('healthBar.x')
    AmountSnow=100
    IntensitySnow=0.2
    makeLuaSprite("ShaderCont",nil,AmountSnow,IntensitySnow)

  


if shadersEnabled then
    runHaxeCode([[
        var shaderName = "snowfall";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        //game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("ShaderCont").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        
        shader0.setFloat('intensity', 0.2);
        shader0.setInt('amount', 100);
        shader0.setFloat('time', 1);
    ]])
end
    
end
function onEvent(tag,v1,v2)
if tag =='SnowFall_amount' then
    if v2=='' then
        setProperty('ShaderCont.x',tonumber(v1))
    else
        doTweenX('Amount','ShaderCont',tonumber(v1),(tonumber(v2)*stepCrochet)/1000,'linear')
    end
end
if tag =='SnowFall_intensity' then
    if v2=='' then
        setProperty('ShaderCont.y',tonumber(v1))
    else
        doTweenY('Intensity','ShaderCont',tonumber(v1),(tonumber(v2)*stepCrochet)/1000,'linear')
    end
end
--130.435=stepCrochet
end
function toInt(float)
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
end