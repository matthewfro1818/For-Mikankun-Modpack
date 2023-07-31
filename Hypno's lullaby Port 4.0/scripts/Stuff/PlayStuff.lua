function onEndSong()
    return Function_Stop
end
local OneCall=false
local WasStarted=false
local FlipHealthbar=false
local curFrame=0
local NameShit=false
function onUpdate(elapsed)
    if getDataFromSave('HypnosPref','Hell mode',false) and botPlay then 
        setProperty("cpuControlled",false)
        setProperty("botplayTxt.visible",false)
    elseif getTextString('botplayTxt')~='BOTPLAY\n'..BotPlayTxt then
        setTextString('botplayTxt','BOTPLAY\n'..BotPlayTxt)
    end
    
    --[[local State=''
    if not getDataFromSave('ImportantData','isFreeplay',false) then
        State='Story mode'
    else
        State='Freeplay'
    end ]]
    --changePresence(State,songName.." ("..difficultyName..")")
    if getSongPosition()>=songLength-100 and not OneCall and WasStarted then
        OneCall=true
        callOnLuas('EarlyEndSong',{})
    end
    if NameShit then
        if curFrame % math.floor(6 * (framerate / 120)) == 0 then
            UserLetter={}
            ActualChar=''
            newName=''
            local Song=getPropertyFromClass('PlayState','SONG.song')
            for i=1,string.len(Song) do 
                local Removes=''
                for j=1,#UserLetter do
                    if j==#UserLetter then
                        Removes=Removes..UserLetter[j]
                    else
                        Removes=Removes..UserLetter[j]..','
                    end
                end
                local Random=getRandomInt(1,string.len(Song),Removes)
                ActualChar=stringSplit(Song,'')[Random]
                table.insert(UserLetter,Random)
                newName=newName..ActualChar
            end
            SetSongName(newName)
            
            
        end
        curFrame=curFrame+1
    end
    if luaSpriteExists('MoneyBag') then
        if getProperty('MoneyBag.animation.curAnim.finished') then
            setProperty('MoneyBag.visible',false)
            runTimer('EndingSong',0.01)

        end
    end
end
function SetSongName(newName)
    runHaxeCode("setVar('songName','"..newName.."')")
    runHaxeCode([[
        Application.current.window.title="Friday Night Funkin': Hypno's Lullaby Port (Song: ]]..newName..'-'..difficultyName..[[)";
    ]])
end
function onUpdatePost(elapsed)
    setProperty('iconP1.flipX',FlipHealthbar)
    setProperty('iconP2.flipX', FlipHealthbar)
    setProperty('healthBar.flipX',FlipHealthbar)
    if FlipHealthbar then
        local healthBarWidth= getProperty('healthBar.width')
        local healthBarX = getProperty('healthBar.x')
        local healthBarPercent = getProperty('healthBar.percent')
        local XoffsetP2=healthBarX+(healthBarWidth*healthBarPercent*0.01)+(150 *getProperty('iconP1.scale.x') - 150) / 2 - 26
        local XoffsetP1=healthBarX+(healthBarWidth*healthBarPercent*0.01)-(150 *getProperty('iconP2.scale.x')) / 2 - 26* 2
        setProperty('iconP2.x',XoffsetP2)
        setProperty('iconP1.x',XoffsetP1) 
    end
end
function SongNameShit()
    NameShit=not NameShit
end
function FlipHealthBar()
    FlipHealthbar = not FlipHealthbar
end
function StartGeneralVideo(VideoName)
	addHaxeLibrary('MP4Handler','vlc')
	runHaxeCode([[
		var filepath:String = Paths.video("]]..VideoName..[[");
	  var video:MP4Handler = new MP4Handler();
	  video.playVideo(filepath);
      
	  video.finishCallback = function()
	  {

		 game.callOnLuas("onFinishedVideo",["]]..VideoName..[["]);
		 return;
	  }
	]])
end
function EarlyEndSong()
    if getDataFromSave('HypnosPref','Hell mode',false) and not botPlay then
        setDataFromSave('HellPass',string.lower(songName),true)
        flushSaveData('HellPass')
    end
	if (songName=='left-unchecked' or songName=='Left Unchecked') and not getDataFromSave('ImportantData','isFreeplay') then
	    StartGeneralVideo('leftunchecked')
        return
    elseif songPath=='frostbite' or songPath=='insomnia' then
        return
    else
        onDoBag()
        return
	end
end
function onFinishedVideo(VideoName)
	onDoBag()

end
local canDied=true
function onDoBag()
    setProperty('inCutscene',true)
    canDied=false
    setGlobalFromScript('scripts/Stuff/HypnosPauseState','CanPause',false)
    if not getDataFromSave('ImportantData','isFreeplay',false) then
        local Multiply=1
        if getDataFromSave('HypnosPref','Pussy mode',false) then
            Multiply=0.5
        elseif getDataFromSave('HypnosPref','Hell mode',false) then
            Multiply=2
        end
        local moneyFromDaSong =0
        if not botPlay then
            moneyFromDaSong= 100+toInt((math.floor(rating * 100) / 100) * 150*Multiply)
        end
        EndSong()
        return
    end
    runHaxeCode([[
        var camBag:FlxCamera =new FlxCamera();
        camBag.bgColor=0x00;
        setVar("camBag",camBag);
        FlxG.cameras.add(camBag,false);
    ]])
    makeLuaSprite('bagBlackscreen')
    makeGraphic('bagBlackscreen',screenWidth * 4, screenHeight * 4,'000000')
    SetBagCamera('bagBlackscreen')
    setProperty('bagBlackscreen.alpha',0)
    addLuaSprite('bagBlackscreen')
    if luaSoundExists('TranceSound') then
        stopSound('TranceSound')
    end
    doTweenAlpha('CamHUD','camHUD',0,0.25,'linear')
    doTweenAlpha('StartMoney','bagBlackscreen',1, 0.35)

    
end
function SetBagCamera(tag)
    runHaxeCode([[
        var Object=game.getLuaObject("]]..tag..[[");
		if(Object!=null && getVar("camBag")!=null){
			Object.camera = getVar("camBag");
		}
    ]])
end
function onGameOver()
    if not canDied then
        return Function_Stop
    end
end
function toMenu()
    if getDataFromSave('ImportantData','isTesting',false) then
        loadSong("testing-menu",0)
    elseif not getDataFromSave('ImportantData','isFreeplay') then
        loadSong("story",0)
    else
        loadSong("freeplay",0)
    end
end
function EndSong()
    if getDataFromSave('ImportantData','isTesting',false) then
        loadSong("testing-menu",0)
    elseif NextSong~=nil and not getDataFromSave('ImportantData','isFreeplay',false) then
        runTimer('EmergencyTimer',4,2)
        loadSong(NextSong)
    elseif not getDataFromSave('ImportantData','isFreeplay',false) then
        loadSong("story",0)
    else
        loadSong("freeplay",0)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='EmergencyTimer' then
        if loopsLeft==0 then
            if getDataFromSave('ImportantData','isTesting',false) then
                loadSong("testing-menu",0)
            elseif not getDataFromSave('ImportantData','isFreeplay') then
                loadSong("story",0)
            else
                loadSong("freeplay",0)
            end
        else
            runHaxeCode([[
                Application.current.window.title="Friday Night Funkin': Psych Engine";
                game.addTextToDebug("Song not found",]]..getColorFromHex('FF0000')..[[);
            ]])
        end
    end
    if tag=='EndingSong' then

        stopSound('moneySound')
        EndSong()
    end
    if tag=='MoneyAdd' then
        playSound('MoneyBagGet',1,'moneySound')
        local Multiply=1
        if getDataFromSave('HypnosPref','Pussy mode',false) then
            Multiply=0.5
        elseif getDataFromSave('HypnosPref','Hell mode',false) then
            Multiply=2
        end
        local moneyFromDaSong =0
        if not botPlay then
            moneyFromDaSong= 100+toInt((math.floor(rating * 100) / 100) * 150*Multiply)
        end
        
        makeLuaText('moneyGainText',"+0",100,1132, 670)
        setTextSize('moneyGainText',36)
        setTextString('moneyGainText',"+"..tostring(moneyFromDaSong))
        setDataFromSave('ImportantData','Money',getDataFromSave('ImportantData','Money',0)+moneyFromDaSong)
        flushSaveData('ImportantData')

        setTextFont('moneyGainText','poke.ttf')
        setTextColor('moneyGainText','FFDC44')
        setTextAlignment('moneyGainText','center')
        setTextBorder('moneyGainText',1.5,'331D00')
        setScrollFactor('moneyGainText',1,1)
        SetBagCamera('moneyGainText')
        addLuaText('moneyGainText')
        setProperty('moneyGainText.scale.x',1.5)
        setProperty('moneyGainText.scale.y',1.5)
        doTweenX('MoneyTextX','moneyGainText.scale',1,0.7,'expoOut')
        doTweenY('MoneyTextY','moneyGainText.scale',1,0.7,'expoOut')
    end
    if tag=='EndSong' then
        onDoBag()
    end
end
function onTweenCompleted(tag)
    if tag=='StartMoney' then
        makeAnimatedLuaSprite('MoneyBag','UI/normal/moneybag',1130, -40)
        addAnimationByPrefix('MoneyBag','getCoin', 'Moneybag final', 24, false)
        SetBagCamera('MoneyBag')
        addLuaSprite('MoneyBag')
        runTimer('MoneyAdd',0.5)
    end
    if stringStartsWith(tag,'MoneyText') then
        doTweenAlpha('AlphaMoneyText','moneyGainText',0,0.35,'expoInOut')
        doTweenY('PosMoneyTextY','moneyGainText',getProperty('moneyGainText.y')+50,0.35,'expoInOut')
    end
    if tag=='AlphaMoneyText' then
        removeLuaSprite('moneyGainText',true)
    end
end
function onDestroy()
    cancelTimer('EmergencyTimer')
end
function toInt(float)
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
end
function onSongStart()
    local Week={"hypnos-lullaby-v2-port"}
    if songName=='Safety Lullaby' or songName=='Left Unchecked' or songName=='Lost Cause' then
        Week=stringSplit(getTextFromFile('weeks/HypnoWeek.txt'),',')
    elseif songName=='Frostbite' or songName=='Insomnia' or songName=='Monochrome' then
        Week=stringSplit(getTextFromFile('weeks/LostSilverWeek.txt'),',')
    elseif songName=='Missingno' or songName=='Brimstone' then
        Week=stringSplit(getTextFromFile('weeks/GlitchWeek.txt'),',')
    end
    --debugPrint(Week)
    for i=1,#Week do
        if songName==Week[i] then
            NextSong=Week[i+1]
        end
    end
    --debugPrint(NextSong)
    WasStarted=true
end
local BotTXT={
    safetylullaby={'you took the safety part too seriously'},
    leftunchecked={'its not that hard anymore i fixed it', 'the pendulums not tweened anymore please'},
    lostcause={'youre the lost cause', 'i know youre in botplay to stare at her ass'},
    frostbite={'those psych engine ports go crazy','did you get a brain freeze?',"Freakachu's in your insides rip your skin off do it now"},
    insomnia={'a mimir mode','dont fall asleep','did you fall asleep on your keyboard?','you really didnt wanna wake him up'},
    monochrome={'hes an 11 year old corpse', 'did you need more time to type?'},
    missingno={'mew was under the truck', 'i hope your pc actually crashes'},
    brimstone={'brimstone betadciu type beat','you probably played the leaked build',"Buryman has more life than your will to fucking play",'ge ge ge-get your hands back on your keyboard'},
    amusia={'i am unamused', 'do you even have a sing?'},
    bygonepurpose={'scrimblini', 'you should jump off like alexis'},
    dissension={'why should I play fair?'},
    deathtoll={'go to hell', "take a bath in the magma", "lmao are you scared of an old dude?","i have the high ground anakin"},
    isotope={'we forgot to scrap it', 'Am I a joke to you?'},
    purin={'hyperrealistic?!','purin',"Hang out a bit with Nurse Joy", 'do NOT put your dick in those holes'},
    pastanight={'guess you got counterpicked', 'maybe the kiddie table is for you'},
    shinto={'peak 10/10 expreiuenc',"It's a her you fucking idiot"},
    shitno={'why is it so cold','you got cold feet'}
}
function onCreate()
    --luaDebugMode=true
    initSaveData('ImportantData')
    initSaveData('UnlockData')
    initSaveData('HypnosPref')
    initSaveData('SongWasPlay')
    initSaveData('HellPass')
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    runHaxeCode([[
        var Icon:Image=Image.fromFile(Paths.modFolders('images/window_icon/icon16.png'));
        Application.current.window.setIcon(Icon);
    ]])
    precacheImage('UI/normal/moneybag')
    
    
    if getDataFromSave('HypnosPref',"Forever UI",true) then
        addLuaScript('scripts/Stuff/ForeverHud.lua')
    end
    if getDataFromSave('HypnosPref',"Forever Jumgement",true) then
        addLuaScript('scripts/Stuff/LuaHypnosRating.lua')
    end
    if getDataFromSave('HypnosPref',"Forever Splashes",true) then
        addLuaScript('scripts/Stuff/NoteSplashes.lua')
    end
    addLuaScript('scripts/Stuff/HypnosPauseState.lua')
	addLuaScript('scripts/Stuff/CameraMove.lua')
    
    
    
    if getDataFromSave('HypnosPref','Pussy mode',false) then
        difficultyName='Pussy'
    elseif getDataFromSave('HypnosPref','Hell mode',false) then
        difficultyName='Hell'
    end

    local Songname=string.gsub(string.lower(songName),' ','')
    BotPlayTxt=BotTXT[Songname][getRandomInt(1,#BotTXT[Songname])]
    setDataFromSave('SongWasPlay',string.lower(songName),true)
    flushSaveData('SongWasPlay')
    --debugPrint(getDataFromSave('ImportantData','isFreeplay',false))
    if not getDataFromSave('ImportantData','isFreeplay',false) then
        setDataFromSave('UnlockData',string.lower(songName).."Unlock",true)
        flushSaveData('UnlockData')
    end
end
function onCreatePost()
    if getProperty('songName')=='songName' then
        SetSongName(songName)
    end
    local State=''
    if not getDataFromSave('ImportantData','isFreeplay',false) then
        State='Story mode'
    else
        State='Freeplay'
    end 
    changePresence(State,songName.." ("..difficultyName..")")
end
function onGameOver()
    if not songName=='Frostbite' then
    removeLuaScript('scripts/Stuff/CameraMove.lua')
    end
end
function onGameOverConfirm(isNotGoingToMenu)
    if not isNotGoingToMenu then
        toMenu()
    end
end