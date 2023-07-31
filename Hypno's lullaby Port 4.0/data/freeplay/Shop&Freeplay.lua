local MenuStuff={'BUY','SELL','EXIT'}
local Dialogue={
    idleLines={ 
        "Don't worry, I got eternity. Can you say the same?",
        "Your nose is weird.",
        "You're ugly.",
        "Ever heard of NFTs? The suits are really out of line nowadays, huh?",
        "Pokemon? I just sell shitty games to snot riddled twerps like you. I don't play them.",
        "Nobody is gonna come to help you once you see me in different circumstances...",
        "Is it fun just sitting there like the fat lard you are?",
        "Don't sympathize with evil. Understanding it may be of use, however.",
        "Speaking ill of another man's hat is dishonorable. Yes, even the red man's.",
        "Sorry, I don't rap. Try your luck on someone else.",
        "No, you can't drink from my head. I know you see the handle but I'm not a mug."
    },
    pussyLines ={ 
        "So....you gonna turn off pussy mode or...???",
        ".........Coward.",
        "You smell weird, did the mechanics make you piss yourself?",
        "It's alright kid, not everyone's a champ.",
        "You'll be a man one day, just not today, I suppose."
    },
    hellLines={ 
        "Interesting.",
        "Nice knowing you bub, say hi to my mom when you're dead.",
        "I'd say you got this, but you probably don't.",
        "Ha ha... this should be fun to watch."
    },
    poorLines={
        "Come back with more green, chump.",
        "You tryna rip me off here, buddy?",
        "Count your money again, dipshit.",
        "This ain't a charity, pal.",
        "I'm trying to run a business here.",
        "You're joking, right?"
    }
}
local CanControl=true
function onCreate()
    --luaDebugMode=true
    initLuaShader('glitch')
    makeLuaSprite('Glitch')
    setSpriteShader('Glitch','glitch')
    initSaveData('UnlockData')
    initSaveData('SongWasPlay')
    initSaveData('ShopItems')
    initSaveData('ImportantData')
    initSaveData('HellPass')
    addHaxeLibrary('FlxFlicker','flixel.effects')
    precacheSound('confirmText')
    precacheSound('scrollMenu')
    initSaveData('HypnosPref')
    setDataFromSave('ImportantData','isFreeplay',true)
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
    precacheSound('cartridgeGuy')
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',true)
    makeLuaSprite('BGBlack',nil,0,0)
    makeGraphic('BGBlack',screenWidth,screenHeight,'000000')
    setObjectCamera('BGBlack','other')
    addLuaSprite('BGBlack')
    runTimer('Beat',(60 / 166),0)
    makeAnimatedLuaSprite('cartridgeGuy','menu/ShopFreeplay/CGShop_assets')
    playMusic('FreeplayMenu',0,true)
    soundFadeIn('',0.5, 0, 1)
    
    for i=0,2 do
        addAnimationByPrefix('cartridgeGuy','idle'..i,'CG_Idle0'..i..'0',24, false)
        addAnimationByPrefix('cartridgeGuy','idle'..i..'-alt','CG_Idle0'..i..'_Alt0',24, false)
    end
    addAnimationByPrefix('cartridgeGuy','scared','CG_Scared01',24, false)
    addAnimationByPrefix('cartridgeGuy','scaredloop','CG_Scared02_Loop',24, false)
    setObjectCamera('cartridgeGuy','other')
    scaleObject('cartridgeGuy',1.375,1.375)
    setProperty('cartridgeGuy.y',screenHeight-getProperty('cartridgeGuy.height'))
    addLuaShop('cartridgeGuy')

    makeLuaSprite('cartridgeLight','menu/ShopFreeplay/CandleLight')
    setProperty('cartridgeLight.x',getProperty('cartridgeGuy.x')+67-getProperty('cartridgeLight.width')/2)
    setProperty('cartridgeLight.y',getProperty('cartridgeGuy.y')+508-getProperty('cartridgeLight.height')/2)
    setObjectCamera('cartridgeLight','other')
    addLuaShop('cartridgeLight')

    makeAnimatedLuaSprite('shopSign','menu/ShopFreeplay/CGShopSign_assets',getProperty('cartridgeGuy.width')/3+16,screenHeight/8)
    addAnimationByPrefix('shopSign','signThing','ShopSign',24,false)
    setObjectCamera('shopSign','other')
    addLuaShop('shopSign')

    MakePauseBox('Dialogue',(screenWidth/2)-(17*3*9),screenHeight - ((screenHeight / 3) - (2*3*9)),24,6,3)
    MakePauseBox('Answer',(screenWidth/2)+(10*3*9),screenHeight - (screenHeight / 3),7,8,3)



    makeLuaSprite('White',nil,0,0)
    makeGraphic('White',screenWidth,screenHeight/8,'FFFFFF')
    setObjectCamera('White','other')
    addLuaSprite('White')

    makeLuaText('CartridgeTalk','',24*9,(screenWidth/2)-(16*3*9),screenHeight - ((screenHeight / 3) - (3*3*9)))
    setTextSize('CartridgeTalk',8)
    setTextFont('CartridgeTalk','poketext.ttf')
    scaleObject('CartridgeTalk',2.8,2.8)
    setTextAlignment('CartridgeTalk','left')
    setTextColor('CartridgeTalk','000000')
    setTextBorder('CartridgeTalk',0,'000000')
    setProperty('CartridgeTalk.antialiasing',false)
    setObjectCamera('CartridgeTalk','other')
    addTextShop('CartridgeTalk')

    for i=1,#MenuStuff do
        makeLuaText(MenuStuff[i],MenuStuff[i],7*9,(screenWidth/2)+(11*3*9),screenHeight-(screenHeight/ 3)+(3*9)+(8*2.8*(i-1)+5*(i-1)))
        setTextSize(MenuStuff[i],8)
        setTextFont(MenuStuff[i],'poketext.ttf')
        scaleObject(MenuStuff[i],2.8,2.8)
        setTextAlignment(MenuStuff[i],'left')
        setTextColor(MenuStuff[i],'000000')
        setTextBorder(MenuStuff[i],0,'000000')
        setProperty(MenuStuff[i]..'.antialiasing',false)
        setObjectCamera(MenuStuff[i],'other')
        addTextShop(MenuStuff[i])
    end

    makeLuaSprite('shopSelector','menu/selector',925, 514)
    scaleObject('shopSelector',3,3)
    setProperty('shopSelector.antialiasing',false)
    setObjectCamera('shopSelector','other')
    addLuaShop('shopSelector')

    MakeAlphabet('FreeplayTitle','Freeplay',screenWidth/2,screenHeight/16-32,'center',1,false)
    MakeAlphabet('ShopTitle','Shop',screenWidth/2,screenHeight/16-32,'center',1,false)

    makeAnimatedLuaSprite('RightPointer','menu/campaign_menu_UI_assets',0,0)
    addAnimationByPrefix('RightPointer','idle','arrow push right',0,true)
    setProperty('RightPointer.x',screenWidth-(64+getProperty('RightPointer.width')))
    setProperty('RightPointer.y',(screenHeight/2)-(getProperty('RightPointer.height')/2))
    setObjectCamera('RightPointer','other')
    addLuaShop('RightPointer')



    makeAnimatedLuaSprite('freeplayBlankPortrait','menu/ShopFreeplay/Freeplay/blank',screenWidth / 8,0)
    addAnimationByPrefix('freeplayBlankPortrait','idle','blank',24,true)
    setObjectCamera('freeplayBlankPortrait','other')
    setGraphicSize('freeplayBlankPortrait',getProperty('freeplayBlankPortrait.width')*0.75,getProperty('freeplayBlankPortrait.height')*0.75)
    screenCenter('freeplayBlankPortrait','y')
    addLuaFreeplay('freeplayBlankPortrait')

    makeAnimatedLuaSprite('LeftPointer','menu/campaign_menu_UI_assets',64,0)
    addAnimationByPrefix('LeftPointer','idle','arrow push left',0,true)
    setProperty('LeftPointer.y',(screenHeight/2)-(getProperty('LeftPointer.height')/2))
    setObjectCamera('LeftPointer','other')
    addLuaFreeplay('LeftPointer')

    MakeFreeplayList()


    
    shuffleCartridgeIdle(true)
    cartridgePlayIdle(true)
    changeShopDialogue()

    makeAnimatedLuaSprite('shopMoney','menu/ShopFreeplay/PokeDollarSign',800,-10)
    addAnimationByPrefix('shopMoney','idle','PokeDollarSign instance 1',24,true)
    scaleObject('shopMoney',0.6,0.6,false)
    setObjectCamera('shopMoney','other')
    addLuaShop('shopMoney')

    makeLuaText('currencyText',getDataFromSave('ImportantData','Money',0),500,880,23)
    setTextSize('currencyText',42)
    setTextFont('currencyText','poketext.ttf')
    setTextAlignment('currencyText','left')
    setTextColor('currencyText','000000')
    setTextBorder('currencyText',0,'000000')
    setObjectCamera('currencyText','other')
    addTextShop('currencyText')
    makeLuaSprite('ShopShader')
    if shadersEnabled then
        runHaxeCode([[
            var shaderName = "shopShader";
            
            game.initLuaShader(shaderName);
            var shader0 = game.createRuntimeShader(shaderName);
            game.camOther.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("ShopShader").shader = shader0;
    
    
        ]])
        setShaderFloat('ShopShader','effectTime',0.05)
    end
end

local animationCycle=0
local cartridgeIdle=1
local animationCycleAmount=3

function cartridgePlayIdle(ignoreFinished)
	if ignoreFinished==nil then ignoreFinished=false end
	if getProperty('cartridgeGuy.animation.finished') or ignoreFinished then
	    playAnim('cartridgeGuy','idle'..cartridgeIdle,true)
		animationCycle=animationCycle+1
		if animationCycle > animationCycleAmount then
			playAnim('cartridgeGuy','idle'..cartridgeIdle..'-alt', true)
			shuffleCartridgeIdle()
        end
	end
end
function shuffleCartridgeIdle(newIdle)

	animationCycle = 0;
	animationCycleAmount = getRandomInt(3, 6)
	if newIdle then
		cartridgeIdle = getRandomInt(0,2,tostring(cartridgeIdle))
    end
end
local HellPasses={}
local FreeplaySongs={}
local OffsetsPortrait={
    frostbite={x=27,y=1},
    safetylullaby={x=106,y=74},
    leftunchecked={x=39,y=54},
    monochrome={x=1,y=0},
    missingno={x=12,y=0},
    brimstone={x=0,y=115},
    deathtoll={x=160,y=165},
    isotope={x=12,y=8},
    shitno={x=72,y=90}
}

function MakeFreeplayList()
    local txt=stringSplit(getTextFromFile('weeks/FreeplayList.txt'),'\n')

    --setDataFromSave('UnlockData','left uncheckedUnlock',true)
    --setDataFromSave('UnlockData','lost causeUnlock',true)
    
    for i=1,#txt do
        
        txt[i]=stringTrim(txt[i])
        local TheSong=string.gsub(string.lower(txt[i]),' ','-')
        HellPasses[i]=getDataFromSave('HellPass',string.lower(txt[i]),false)
        if checkFileExists('data/'..TheSong..'/'..TheSong..'.json') and getDataFromSave('SongWasPlay',string.lower(txt[i]),false) then
            MakeAlphabet(txt[i],string.upper(txt[i]),screenWidth * (2 / 3),(70 * (i+2)) + 30,'center',1,false)
            local Anim=string.gsub(string.lower(txt[i]),' ','-')
            

            if checkFileExists('images/menu/ShopFreeplay/Freeplay/'..Anim..'.png') then
                makeAnimatedLuaSprite(string.upper(txt[i]),'menu/ShopFreeplay/Freeplay/'..Anim,screenWidth / 8,0)
                addAnimationByPrefix(string.upper(txt[i]),'idle',Anim..'0',24,true)
                setObjectCamera(string.upper(txt[i]),'other')
                setGraphicSize(string.upper(txt[i]),getProperty(string.upper(txt[i])..'.width')*0.75,getProperty(string.upper(txt[i])..'.height')*0.75)
                screenCenter(string.upper(txt[i]),'y')
                addLuaFreeplay(string.upper(txt[i]))

                local TagOffsets=string.gsub(string.lower(txt[i]),' ','')
    
                if OffsetsPortrait[TagOffsets]~= nil then
                    local Offset={x=OffsetsPortrait[TagOffsets].x*getProperty(string.upper(txt[i])..'.scale.x'),y=OffsetsPortrait[TagOffsets].y*getProperty(string.upper(txt[i])..'.scale.y')}
                    SetOffset(string.upper(txt[i]),Offset.x,Offset.y)
                end
            else
                makeAnimatedLuaSprite(string.upper(txt[i]),'menu/ShopFreeplay/Freeplay/unknown',screenWidth / 8,0)
                addAnimationByPrefix(string.upper(txt[i]),'idle','unknown0',24,true)
                setObjectCamera(string.upper(txt[i]),'other')
                setGraphicSize(string.upper(txt[i]),getProperty(string.upper(txt[i])..'.width')*0.75,getProperty(string.upper(txt[i])..'.height')*0.75)
                screenCenter(string.upper(txt[i]),'y')
                addLuaFreeplay(string.upper(txt[i]))
            end
            

            playAnim(string.upper(txt[i]),'idle',true)
            setProperty(string.upper(txt[i])..'.alpha',0)
        else
            local Name=''
            for j=1,string.len(txt[i]) do
                if stringSplit(txt[i],'')[j]==' ' then
                    Name=Name..' '
                else
                    Name=Name..'?'
                end
            end
            MakeAlphabet(txt[i],Name,screenWidth * (2 / 3),(70 * (i+2)) + 30,'center',1,false)
            makeAnimatedLuaSprite(string.upper(txt[i]),'menu/ShopFreeplay/Freeplay/unknown',screenWidth / 8,0)
            addAnimationByPrefix(string.upper(txt[i]),'idle','unknown0',24,true)
            setObjectCamera(string.upper(txt[i]),'other')
            setGraphicSize(string.upper(txt[i]),getProperty(string.upper(txt[i])..'.width')*0.75,getProperty(string.upper(txt[i])..'.height')*0.75)
            screenCenter(string.upper(txt[i]),'y')
            addLuaFreeplay(string.upper(txt[i]))

            playAnim(string.upper(txt[i]),'idle',true)
            setProperty(string.upper(txt[i])..'.alpha',0)
        end
        if not getDataFromSave('UnlockData',txt[i]..'Unlock',false) then
            makeAnimatedLuaSprite(txt[i]..'Locked','menu/unlocked',screenWidth * (2 / 3),(70 * (i+2)) + 30)
            addAnimationByPrefix(txt[i]..'Locked','lock', 'lock', 24, true)
            addAnimationByPrefix(txt[i]..'Locked','unlock', 'unlock', 24, false)
            addOffset(txt[i]..'Locked','unlock',-4, 32)
            playAnim(txt[i]..'Locked','lock',true)
            setObjectCamera(txt[i]..'Locked','other')
            addLuaFreeplay(txt[i]..'Locked',true)
        end
        if i==1 then
            ActualSong=string.gsub(string.lower(txt[i]),' ','-')
        end
    end

    makeLuaSprite('HellMode','menu/hellmode',(screenWidth / 8),0)
    setObjectCamera('HellMode','other')
    scaleObject('HellMode',0.5,0.5)
    setProperty('HellMode.offset.x',getProperty('HellMode.offset.x')+35)
    setProperty('HellMode.offset.y',getProperty('HellMode.offset.y')+40)
    screenCenter('HellMode','y')
    addLuaFreeplay('HellMode')

    FreeplaySongs=txt
end
local SpritesList={}
function addLuaFreeplay(tag,front)
    table.insert(SpritesList,{tag=tag,x=getProperty(tag..'.x')})
    addLuaSprite(tag,front)
end
local ShopList={}
function addLuaShop(tag,front)
    table.insert(ShopList,{tag=tag,x=getProperty(tag..'.x')})
    addLuaSprite(tag,front)
end
function addTextShop(tag)
    table.insert(ShopList,{tag=tag,x=getProperty(tag..'.x')})
    addLuaText(tag)
end
function Selection(If,True,False)
    if If then
        return True
    else
        return False
    end
end
function SetOffset(tag,x,y)
    setProperty(tag..'.offset.x',getProperty(tag..'.offset.x')+x)
    setProperty(tag..'.offset.y',getProperty(tag..'.offset.y')+y)
end

local ActualSong=''
local Selecter=1
local Freeplay=false
local candleTime=0
local ShopIn=false
function onUpdate(elapsed)
    local fakeElapsed = clamp(elapsed, 0, 1)
    if Freeplay then
        FreeplayonUpdate(elapsed)
        if keyJustPressed('left') and not ShopIn and CanControl then
            Freeplay=false
            playAnim('shopSign','signThing',true)
            shuffleCartridgeIdle(true)
            cartridgePlayIdle(true)
            changeShopDialogue()
        end
    else
        ShoponUpdate(elapsed)
        if keyJustPressed('right') and not ShopIn and CanControl then
            Freeplay=true
            UpdateFreeplay=true
        end
    end
    if keyJustPressed('back') and not ShopIn and CanControl then
        setDataFromSave('ImportantData','isFreeplay',false)
        flushSaveData('ImportantData')
        callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
    end
    for i=1,#SpritesList do
        setProperty(SpritesList[i].tag..'.x',Lerp(getProperty(SpritesList[i].tag..'.x'),SpritesList[i].x+screenWidth*Selection(Freeplay,0,1),fakeElapsed / (1 / 15)))
    end
    if not zoomIn then
        for i=1,#FreeplaySongs do
            LerpText(FreeplaySongs[i],'x',(screenWidth * (2.1 / 3)+screenWidth*Selection(Freeplay,0,1)),fakeElapsed / (1 / 15))
        end
    end
    
    LerpText('FreeplayTitle','x',screenWidth/2+screenWidth*Selection(Freeplay,0,1),fakeElapsed / (1 / 15))
    LerpText('ShopTitle','x',screenWidth/2+screenWidth*Selection(Freeplay,-1,0),fakeElapsed / (1 / 15))
    for i=1,#ShopList do
        setProperty(ShopList[i].tag..'.x',Lerp(getProperty(ShopList[i].tag..'.x'),ShopList[i].x+screenWidth*Selection(Freeplay,-1,0),fakeElapsed / (1 / 15)))
    end
    candleTime =candleTime+180 * (fakeElapsed / 4)
	candleSine = 1 + (math.sin((math.pi * candleTime) / 180) / 3)
	scaleObject('cartridgeLight',candleSine, candleSine,false)

    
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
local UpdateFreeplay=false
local OneCaller=true
local FreeplayMoveColdown=false
local zoomIn=false
local endingFreeplay=false
local killThread=false
local aberrateValue = 0;
local aberrateTimeValue = 0.05
local speed= 0.055
local elapsedTotal=0
local prevY=0
local glitchValue=0
function FreeplayonUpdate(elapsed)
    local fakeElapsed = clamp(elapsed, 0, 1)
    if OneCaller then
        OneCaller=false
        UpdateFreeplay=true
    end
    if keyPressed('up') and CanControl then
        if moverCooldown<=0 then
            playSound('scrollMenu',0.5)
            Selecter=Selecter-1
            if Selecter<=0 then
                Selecter=#FreeplaySongs
            end
            UpdateFreeplay=true
            moverCooldown=moverCooldown+getPropertyFromClass('flixel.FlxG','updateFramerate')/ 4
        else
            moverCooldown=moverCooldown-1
        end
    elseif keyPressed('down') and CanControl then
        if moverCooldown<=0 then
            playSound('scrollMenu',0.5)
            Selecter=Selecter+1
            if Selecter>#FreeplaySongs then
                Selecter=1
            end
            UpdateFreeplay=true
            moverCooldown=moverCooldown+getPropertyFromClass('flixel.FlxG','updateFramerate')/ 4
        else
            moverCooldown=moverCooldown-1
        end
    else
        moverCooldown=0
    end
    ActualSong= string.gsub(FreeplaySongs[Selecter],' ','-')
    if keyJustPressed('accept') and CanControl then
        if checkFileExists('data/'..ActualSong..'/'..ActualSong..'.json') and getDataFromSave('UnlockData',FreeplaySongs[Selecter]..'Unlock',false) then
            setDataFromSave('ImportantData','isFreeplay',true)
            flushSaveData('ImportantData')
            playSound('confirmText')
            endingFreeplay=true
            CanControl=false
            runHaxeCode([[
                FlxFlicker.flicker(getVar("]]..FreeplaySongs[Selecter]..[["), 0.85, 0.06 * 2, true, false, function(flick:FlxFlicker)
                    {
                        game.callOnLuas("onFlickerComplete",[]);
                    });
    
            ]])
        else
            playSound('errorMenu')
            cameraShake('other',0.005, 0.06)
        end
    end
    if keyboardJustPressed("TAB") and CanControl then
        if checkFileExists('data/'..ActualSong..'/'..ActualSong..'.json') then
            setDataFromSave('ImportantData','isFreeplay',true)
            flushSaveData('ImportantData')
            playSound('confirmText')
            endingFreeplay=true
            CanControl=false
            runHaxeCode([[
                FlxFlicker.flicker(getVar("]]..FreeplaySongs[Selecter]..[["), 0.85, 0.06 * 2, true, false, function(flick:FlxFlicker)
                    {
                        game.callOnLuas("onFlickerComplete",[]);
                    });
    
            ]])
        else
            playSound('errorMenu')
            cameraShake('other',0.005, 0.06)
        end
    end
    local ActivePortair=string.upper(string.gsub(ActualSong,'-',' '))
    elapsedTotal =elapsedTotal+ fakeElapsed;
    local formula = math.sin((180 / math.pi) * ((elapsedTotal - (fakeElapsed * 120)) / 24)) / 12
    prevY=prevY+getProperty('freeplayBlankPortrait.y')
    setProperty('freeplayBlankPortrait.y',prevY + formula)
    prevY=prevY-(getProperty('freeplayBlankPortrait.y')+formula)
    setProperty(ActivePortair..'.y',getProperty('freeplayBlankPortrait.y'))
    setProperty('HellMode.y',getProperty('freeplayBlankPortrait.y'))
    if not endingFreeplay then
        updatePortraits(fakeElapsed)
    end
    if UpdateFreeplay and not killThread then
        local LerpEase=fakeElapsed / (1 / 15)
    for i=1,#FreeplaySongs do
    setProperty(FreeplaySongs[i]..'.targetY',(i - Selecter))
	local zDepth = math.abs(i - Selecter)
    local scaledY = remapToRange(getProperty(FreeplaySongs[i]..'.targetY'), 0, 1, 0, 1.3)
	local dilationFactor = (math.abs(i - Selecter) + 1) / 2
	local itemScale = Selection(i == Selecter,1,(0.95 / dilationFactor))
	local yPosition = (scaledY * (120 / dilationFactor)) + (screenHeight * 0.48);
	local itemAlpha = Selection(Freeplay,Selection((i == Selecter),1, 0.75 - (zDepth / 5)),0)
        LerpText(FreeplaySongs[i],'alpha',itemAlpha,LerpEase)
        for j=0,getProperty(FreeplaySongs[i]..'.letters.length')-1 do
            LerpLetter(FreeplaySongs[i],j,'y',yPosition,LerpEase)
            LerpLetter(FreeplaySongs[i],j,'scale.y',itemScale,LerpEase)
            LerpLetter(FreeplaySongs[i],j,'scale.x',itemScale,LerpEase)
            
            --local Tag=FreeplaySongs[i]..".letters["..j.."]"
            --local Ratio=(getProperty(Tag..'.scale.x')/getProperty(Tag..'.spawnScale.x'))
            --local placementX = getProperty(Tag..'.spawnPos.x')-getProperty(Tag..'.spawnPos.x')*Ratio
            --setProperty(Tag..'.offset.x',getProperty(Tag..'.letterOffset[0]')+getProperty(Tag..'.alignOffset')+placementX)
            --setProperty(Tag..'.x',getProperty(Tag..'.spawnPos.x')+placementX)
        end
        if luaSpriteExists(FreeplaySongs[i]..'Locked') then
            scaleObject(FreeplaySongs[i]..'Locked',getProperty(FreeplaySongs[i]..".letters[0].scale.x"),getProperty(FreeplaySongs[i]..".letters[0].scale.y"),false)
            setProperty(FreeplaySongs[i]..'Locked.alpha',getProperty(FreeplaySongs[i]..".letters[0].alpha"))
            setProperty(FreeplaySongs[i]..'Locked.y',getProperty(FreeplaySongs[i]..".letters[0].y")-(getProperty(FreeplaySongs[i]..'Locked.height')/4))
        end
    end
    for i=1,#FreeplaySongs do
        if FreeplaySongs[i]=='missingno' or FreeplaySongs[i]=='isotope' then
            for j=0,getProperty(FreeplaySongs[i]..'.letters.length')-1 do
                runHaxeCode([[
                    var Letter=getVar("]]..FreeplaySongs[i]..[[").letters[]]..j..[[];
                    if(Letter.shader==null){
                        Letter.shader=game.getLuaObject("Glitch").shader;
                    }
                ]])
                glitchValue=glitchValue + (fakeElapsed / (1 / 15)) / 15
                setShaderFloat('Glitch','prob',0.25 + math.abs(math.sin((fakeElapsed * 2) * math.pi)))
                setShaderFloat('Glitch','time',glitchValue / 2)
            end

        end
    end

    updatePortraits(fakeElapsed)
    
    end
    
    if getProperty(string.upper(string.gsub(ActualSong,'-',' '))..'.alpha')>0.99999 then
        UpdateFreeplay=false
    end
    if endingFreeplay then
        killThread = true
        local realElapsed = (fakeElapsed / (1 / 60))
        local Actual=string.upper(string.gsub(ActualSong,'-',' '))
        setProperty('freeplayBlankPortrait.alpha',Lerp(getProperty('freeplayBlankPortrait.alpha'),0,realElapsed / 6))
        setProperty(Actual..'.alpha',Lerp(getProperty(Actual..'.alpha'),0,realElapsed / 6))
        if HellPasses[Selecter] then
            setProperty('HellMode.alpha',getProperty(Actual..'.alpha'))
        end
        for i=1,#FreeplaySongs do
            if FreeplaySongs[Selecter]~=FreeplaySongs[i] then
                LerpText(FreeplaySongs[i],'alpha',0,realElapsed / 6)
                setProperty(FreeplaySongs[i]..'Locked.alpha',getProperty(FreeplaySongs[i]..'.alpha'))
            else
                if getProperty(FreeplaySongs[i]..'.x')>0.5 then
                LerpText(FreeplaySongs[i],'x',0,realElapsed / 6)
                end
            end
        end
        if zoomIn then
            if shadersEnabled then
                if aberrateTimeValue < 1.35 then
                    aberrateValue = aberrateValue + (fakeElapsed / (1 / 15)) * (speed * 1.12)
                    aberrateTimeValue = aberrateTimeValue + (fakeElapsed / (1 / 15)) * speed
                    speed = speed + 0.0003125 * (fakeElapsed / (1 / 160))

                    setShaderFloat('ShopShader','aberration',aberrateValue)
                    setShaderFloat('ShopShader','effectTime',aberrateTimeValue)
                end
                if aberrateTimeValue > 1 then
                    LerpText(FreeplaySongs[Selecter],'alpha',0,realElapsed)
                    if getProperty(FreeplaySongs[Selecter]..'.alpha') <= 0.01 then 
                        loadSong(ActualSong) 
                    end
                end
            else
                
                loadSong(ActualSong)
            end
        end
    end
end
function onFlickerComplete()
    zoomIn=true
end
local activeAlpha=1
local LastSelecter=1
function updatePortraits(elapsed)
    local LastPortair=string.upper(string.gsub(FreeplaySongs[LastSelecter],'-',' '))
    local ActualPortair=string.upper(string.gsub(ActualSong,'-',' '))
    if Selecter~=LastSelecter then
        activeAlpha=0
        if getProperty(LastPortair..'.alpha')<=0.00015 then
            LastPortair=ActualPortair
            activeAlpha=1
            LastSelecter=Selecter
        end
    end
    setProperty(LastPortair..'.alpha',Lerp(getProperty(LastPortair..'.alpha'),activeAlpha,(elapsed / (1 / 60)) * 0.25))
    
    if not HellPasses[Selecter] then
        setProperty('HellMode.alpha',0)
    else
        setProperty('HellMode.alpha',getProperty(LastPortair..'.alpha'))
    end
end
function remapToRange(value,min1,max1,min2,max2)
    return min2 + ((value-min1)/(max1-min1)) * (max2 - min2)
end
function clamp(value,min,max)
	return math.max(min, math.min(max, value))
end
local SelectDialogue=1
local textCooldown=0
local chordProgression=1
local currentShopDialogue=''
local timeToChange=0
local inCutscene=false
local playIntro=false
function onCustomSubstateCreate(name)
    if name=='Shop' and not ShopIn then
        ShopIn=true
        changeShopDialogue('What do you want?')
    end
end
function onCustomSubstateDestroy(name)
    if name=='Shop' then
        ShopIn=false
        changeShopDialogue()
    end
end
local SongGo=''
function GoToSong(name)
    closeCustomSubstate()
    inCutscene= true
    SongGo=name
    runTimer('GotoFreeplay',0.25)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='Beat' then
        callOnLuas('onBeatHit')
    end
    if tag=='GotoFreeplay' then
        Freeplay=true
        CanControl=false
        runTimer('GetSelecter',0.5)
    end
    if tag=='GetSelecter' then
        local index=1
        for i=1,#FreeplaySongs do
            if FreeplaySongs[i]==SongGo then
                index=i
            end
        end
        runTimer('MoveTo',0.1,math.abs(Selecter-index))
    end
    if tag=='MoveTo' then
        local SelectTo=1
        UpdateFreeplay=true
        for i=1,#FreeplaySongs do
            if FreeplaySongs[i]==SongGo then
                SelectTo=i
            end
        end
        if Selecter>SelectTo then
            Selecter=Selecter-1
        elseif Selecter<SelectTo then
            Selecter=Selecter+1
        end
        if Selecter==SelectTo then
            cancelTimer('MoveTo')
            runTimer('Unlocking',1)
        end
    end
    if tag=='Unlocking' then
        playAnim(SongGo..'Locked','unlock',true)
        runTimer('DarkLocker',0.1)
        runTimer('GiveControl',1)
    end
    if tag=='DarkLocker' then
        makeAnimatedLuaSprite(SongGo..'LockedDark','menu/darkunlocked',getProperty(SongGo..'Locked.x'),getProperty(SongGo..'Locked.y'))
        addAnimationByPrefix(SongGo..'LockedDark','lock', 'lock', 24, true)
        addAnimationByPrefix(SongGo..'LockedDark','unlock', 'unlock', 24, false)
        addOffset(SongGo..'LockedDark','unlock',-4, 32)
        playAnim(SongGo..'LockedDark','unlock',true, false, 12)
        setObjectCamera(SongGo..'LockedDark','other')
        addLuaFreeplay(SongGo..'LockedDark',true)
        doTweenY('LockedDarkScaleY',SongGo..'LockedDark.scale',1.5,0.25,'expoOut')
        doTweenX('LockedDarkScaleX',SongGo..'LockedDark.scale',1.5,0.25,'expoOut')
        doTweenAlpha('LockedDarkAlpha',SongGo..'LockedDark',0,0.25,'expoOut')
        doTweenAlpha('Locked',SongGo..'Locked',0,0.5,'circOut')
    end
    if tag=='GiveControl' then
        CanControl=true
        inCutscene=false
    end
end
function onTweenCompleted(tag)
    if tag=='LockedDarkAlpha' then
        removeLuaSprite(SongGo..'LockedDark',false)
    end
    if tag=='Locked' then
        removeLuaSprite(SongGo..'Locked',false)
    end
end
function ShoponUpdate(elapsed)
    if keyJustPressed('up') and not ShopIn then
        playSound('scrollMenu',0.5)
        SelectDialogue=SelectDialogue-1
        if SelectDialogue<=0 then
            SelectDialogue=#MenuStuff
        end
        setProperty('shopSelector.y',getProperty(MenuStuff[SelectDialogue]..'.y')+7)
    end
    if keyJustPressed('down') and not ShopIn then
        playSound('scrollMenu',0.5)
        SelectDialogue=SelectDialogue+1
        if SelectDialogue>#MenuStuff then
            SelectDialogue=1  
        end
        setProperty('shopSelector.y',getProperty(MenuStuff[SelectDialogue]..'.y')+7)
    end
    if keyJustPressed('accept') and not ShopIn then
        playSound('confirmText')
        if MenuStuff[SelectDialogue]=='BUY' then
            openCustomSubstate('Shop',false)
        elseif MenuStuff[SelectDialogue]=='SELL' then
            
            if #getDataFromSave('ShopItems','BoughtItems',{})<1 then
                changeShopDialogue('Sell? You literally have nothing on you, what the hell is wrong with your brain.')
            elseif #getDataFromSave('ShopItems','BoughtItems',{})>=1 then
                changeShopDialogue("Why would I buy your shit back, I'm trying to get rid of it you moron.")
            end
        elseif MenuStuff[SelectDialogue]=='EXIT' then
            callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
        end
    end
    if chordProgression < string.len(currentShopDialogue) then
        
        if chordProgression==1 then
            setTextString('CartridgeTalk','')
        end
		if textCooldown <= 0 then
            setTextString('CartridgeTalk',getTextString('CartridgeTalk')..stringSplit(currentShopDialogue,'')[chordProgression])
			chordProgression=chordProgression+1
			if not inCutscene then playSound('cartridgeGuy', 0.1) end
			textCooldown =textCooldown+toInt(getPropertyFromClass('flixel.FlxG','updateFramerate') / 16)
				
		else
			textCooldown=textCooldown-1
        end
			
	else
        setTextString('CartridgeTalk',currentShopDialogue)
		timeToChange = timeToChange - (elapsed / (1 / 60))
		if timeToChange <= 0 and not playIntro then
			changeShopDialogue()
        end
    end
end
local lastShopDialogue={}
local Dialogues={}
function changeShopDialogue(dialogue)
    if not inCutscene then
        if ShopIn then
            if dialogue ~= nil then
                currentShopDialogue = dialogue
                if dialogue=='poorDialogue' then
                    
                    Dialogues=Dialogue.poorLines
                    if #lastShopDialogue == #Dialogues then lastShopDialogue = {} end
                    local LastStrings=''
                    for i=1,#lastShopDialogue do
                        if i==#lastShopDialogue then
                            LastStrings=LastStrings..lastShopDialogue[i]
                        else
                            LastStrings=LastStrings..lastShopDialogue[i]..','
                        end
                    end
                    local randomizeDialogue = getRandomInt(1, #Dialogues, LastStrings)
                    currentShopDialogue = Dialogues[randomizeDialogue]
                    table.insert(lastShopDialogue,randomizeDialogue)
                end
            else

            end
            chordProgression = 1
        else
            
            if getDataFromSave('HypnosPref','Pussy mode',false) then
                Dialogues=Dialogue.pussyLines
            elseif getDataFromSave('HypnosPref','Hell mode',false) then
                Dialogues=Dialogue.hellLines
            else
                Dialogues=Dialogue.idleLines
            end
            
            if #lastShopDialogue == #Dialogues then lastShopDialogue = {} end
            local LastStrings=''
            for i=1,#lastShopDialogue do
                if i==#lastShopDialogue then
                    LastStrings=LastStrings..lastShopDialogue[i]
                else
                    LastStrings=LastStrings..lastShopDialogue[i]..','
                end
            end
            local randomizeDialogue = getRandomInt(1, #Dialogues, LastStrings)
            chordProgression = 1
            

            if dialogue ~= nil then 
                currentShopDialogue = dialogue
            else
                currentShopDialogue = Dialogues[randomizeDialogue]
                table.insert(lastShopDialogue,randomizeDialogue)
            end

            
            timeToChange = timeToChange + 10 * 60
        end
    end
    
    
end
function toInt(float)
    if float<=math.floor(float)+0.5 then
        return math.floor(float)
    else
        return math.ceil(float)
    end
 end
local CurBeat=0
function onBeatHit()
    CurBeat=CurBeat+1 
    if CurBeat%2==0 and not Freeplay then
        cartridgePlayIdle()
    end

end
function SetPropertyText(Tag,property,newVar)
    setProperty(Tag..'.'..property,newVar)
end
function MakeAlphabet(Tag,Text,X,Y,alignment,Scale,inMenu)
    callScript('scripts/Stuff/GeneralMenuStuff','MakeAlphabet',{Tag,Text,X,Y,alignment,Scale,inMenu})
end
function LerpLetter(Tag,index,property,toVar,Ratio)
    local LetterTab=Tag..".letters["..index.."]"
    setProperty(LetterTab..'.'..property,Lerp(getProperty(LetterTab..'.'..property),toVar,Ratio))
    --updateHitbox(LetterTab)
end
function LerpText(Tag,property,toVar,Ratio)
    setProperty(Tag..'.'..property,Lerp(getProperty(Tag..'.'..property),toVar,Ratio))
    --updateHitbox(Tag)
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
local TextBox={}
--{tag="",WidthBlock=3,HeightBlock=3}
function MakePauseBox(tag,PosX,PosY,WidthInBlock,HeightInBlock,scale)
    local Image='9slicetextbox'
    local ScaleInterval=9
    local BoxPause={}
    for i=0,8 do
        makeLuaSprite(tag..'BoxPause'..i,nil,0,0)
        
        loadGraphic(tag..'BoxPause'..i,'menu/Pause/'..Image,ScaleInterval,ScaleInterval)
        setGraphicSize(tag..'BoxPause'..i,ScaleInterval*scale,ScaleInterval*scale)
        addAnimation(tag..'BoxPause'..i,'idle',{i},0,true)
        setProperty(tag..'BoxPause'..i..'.antialiasing',false)
        
        if i==1 or i==7 then
            setGraphicSize(tag..'BoxPause'..i,(WidthInBlock-2)*ScaleInterval*scale,ScaleInterval*scale)
        elseif i==3 or i==5 then
            setGraphicSize(tag..'BoxPause'..i,ScaleInterval*scale,(HeightInBlock-2)*ScaleInterval*scale)
        elseif i==4 then
            setGraphicSize(tag..'BoxPause'..i,(WidthInBlock-2)*ScaleInterval*scale,(HeightInBlock-2)*ScaleInterval*scale)
        end
        BoxPause[i+1]=tag..'BoxPause'..i
        
    end 
    local Width=WidthInBlock*ScaleInterval*scale
    local Height=HeightInBlock*ScaleInterval*scale
    for i=1,#BoxPause do
        setProperty(BoxPause[i]..'.x',PosX)
        setProperty(BoxPause[i]..'.y',PosY)
        if i~=1 and i~=4 and i~=7 then
            setProperty(BoxPause[i]..'.x',getProperty(BoxPause[i-1]..'.x')+getProperty(BoxPause[i-1]..'.width'))
        end
        if i~=1 and i~=2 and i~=3 then
            setProperty(BoxPause[i]..'.y',getProperty(BoxPause[i-3]..'.y')+getProperty(BoxPause[i-3]..'.height'))
        end
        setObjectCamera(BoxPause[i],'other')
        addLuaShop(BoxPause[i])
    end
    
    table.insert(TextBox,{tag=tag,WidthBlock=WidthInBlock,HeightBlock=HeightInBlock,Boxes=BoxPause,scale=scale})
end