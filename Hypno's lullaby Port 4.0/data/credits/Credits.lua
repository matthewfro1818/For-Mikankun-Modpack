local CreditsTagList={}
local CreditsInfo={}
local VerticalSelection=1
function onCreate()
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
    precacheSound('scrollMenu')
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    makeLuaSprite('TVshader')
    playMusic('creditsTheme',0.5,true)

    runHaxeCode([[
        FlxG.cameras.remove(game.camOther,false);
        var camBack:FlxCamera =new FlxCamera(0, 0, FlxG.width, FlxG.height);
        camBack.bgColor=0x00;
        setVar("camBack",camBack);
        
        var camTV:FlxCamera =new FlxCamera(0, 0, 912, 513);
        camTV.bgColor=0x00;
        camTV.x = FlxG.width / 2 - camTV.width / 2;
		camTV.y = (FlxG.height / 2 - camTV.height / 2) - 64;
        setVar("camTV",camTV);
        
        FlxG.cameras.add(camBack,false);
        FlxG.cameras.add(camTV,false);
        FlxG.cameras.add(game.camOther,false);
        

        var shaderName = "monitor";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        camTV.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("TVshader").shader = shader0;

    ]])

    makeAnimatedLuaSprite('TV','menu/Credits/CREDITS_TV')
    addAnimationByPrefix('TV','CREDITS TV', 'CREDITS TV')
    SetCamera('TV',"camBack")
    screenCenter('TV','xy')
    setProperty('TV.y',getProperty('TV.y')+16)
    addLuaSprite('TV')

    MakeBack(screenWidth/2-10,0)

    makeLuaSprite('White',nil,0,0)
    makeGraphic('White',1280, 720,'FFFFFF')
    setProperty('White.alpha',0.25)
    SetCamera('White','camTV')
    addLuaSprite('White')

    local NameList = stringSplit(getTextFromFile('images/menu/Credits/iconorder.txt'),'\n')
    for i=1,#NameList do
        local Person=stringTrim(NameList[i])
        local Tag=string.gsub(Person,' ','_')
        makeLuaSprite(Tag,'menu/Credits/icon/'..Tag,300,200)
        setGraphicSize(Tag,getProperty(Tag..'.width')*3/5,getProperty(Tag..'.height')*3/5)
        SetCamera(Tag,'camTV')
        addLuaSprite(Tag)
        table.insert(CreditsTagList,Tag)
        if checkFileExists('images/menu/Credits/icon/'..Tag..'.txt') then
            local Info=getTextFromFile('images/menu/Credits/icon/'..Tag..'.txt')
            
            local Quote=string.gsub(stringTrim(stringSplit(stringSplit(Info,'quote:')[2],'profession:')[1]),'\\n','\n')
            local Profession=string.gsub(stringTrim(stringSplit(stringSplit(Info,'profession:')[2],'description:')[1]),'\\n','\n')
            local Description=string.gsub(stringTrim(stringSplit(Info,'description:')[2]),'\\n','\n')
            
            CreditsInfo[Tag]={name=Person,quote=Quote,profession=Profession,description=Description}
        else
            CreditsInfo[Tag]={name=Person,quote="Quote no found",profession="Profession no found",description="Description no found"}
        end
        if i~=VerticalSelection then
            setProperty(Tag..'.alpha',0.3)
        end
    end
    makeLuaSprite('InfoBox','menu/Credits/box',0,0)
    SetCamera('InfoBox','camTV')
    addLuaSprite('InfoBox')

    local point = 200;

    makeAnimatedLuaSprite('UpArrow','menu/campaign_menu_UI_assets',0,32)
    addAnimationByPrefix('UpArrow','idle', 'arrow push left', 0, false)
    setProperty('UpArrow.angle',90)
    setProperty('UpArrow.x',point-getProperty('UpArrow.width')/2)
    SetCamera('UpArrow','camTV')
    addLuaSprite('UpArrow')

    makeAnimatedLuaSprite('DownArrow','menu/campaign_menu_UI_assets',0,0)
    addAnimationByPrefix('DownArrow','idle', 'arrow push left', 0, false)
    setProperty('DownArrow.angle',-90)
    setProperty('DownArrow.y',getProperty('camTV.height')-getProperty('DownArrow.height')-32)
    setProperty('DownArrow.x',point-getProperty('DownArrow.width')/2)
    SetCamera('DownArrow','camTV')
    addLuaSprite('DownArrow')
    
    makeLuaText('topText','goober',0,0,32)
    setTextSize('topText',32)
    setTextColor('topText','FFFFFF')
    setTextBorder('topText',0,'FFFFFF')
    SetCamera('topText','camTV')
    addLuaText('topText')

    makeLuaText('professionText','idea person',485 - 32,0,0)
    setTextSize('professionText',24)
    setTextAlignment('professionText','center')
    setTextColor('professionText','FFFFFF')
    setTextBorder('professionText',0,'FFFFFF')
    setProperty('professionText.autoSize',false)
    SetCamera('professionText','camTV')
    addLuaText('professionText')

    makeLuaText('stupidQuote','I like men',485 - 32,0,0)
    setTextSize('stupidQuote',16)
    setTextAlignment('stupidQuote','center')
    setTextColor('stupidQuote','FFFFFF')
    setTextBorder('stupidQuote',0,'FFFFFF')
    setProperty('stupidQuote.autoSize',false)
    SetCamera('stupidQuote','camTV')
    addLuaText('stupidQuote')

    makeLuaText('descriptionText','this person is completely useless to the team and will not contribute at all whatsoever. I don\'t know what else to say, they are completely fucking useless',485 - 32,384 + 16,0)
    setTextSize('descriptionText',20)
    setTextAlignment('descriptionText','left')
    setTextColor('descriptionText','FFFFFF')
    setTextBorder('descriptionText',0,'FFFFFF')
    SetCamera('descriptionText','camTV')
    addLuaText('descriptionText')
    updateText()
end
function onCreatePost()
    debugPrint("B")
    MakeButton('UpButton','UpArrow')
    MakeButton('DownButton','DownArrow')
end
function updateText()
    local PersonData=CreditsInfo[CreditsTagList[VerticalSelection]]
    setTextString('topText',PersonData.name)
    setProperty('topText.x',384 + ((485 / 2) - (getProperty('topText.width') / 2)))
    
    setTextString('professionText',PersonData.profession)
    setProperty('professionText.x',384 + ((485 / 2) - (getProperty('professionText.width') / 2)))
    setProperty('professionText.y',getProperty('topText.y')+getProperty('topText.height'))

    setTextString('stupidQuote','"'..PersonData.quote..'"')
    setProperty('stupidQuote.x',384 + ((485 / 2) - (getProperty('stupidQuote.width') / 2)))
    setProperty('stupidQuote.y',getProperty('professionText.y')+getProperty('professionText.height')+8)

    setTextString('descriptionText','"'..PersonData.description..'"')
    setProperty('descriptionText.y',getProperty('stupidQuote.y')+getProperty('stupidQuote.height')+16)

end
local Back=0
function MakeBack(x,y)
    Back=Back+1
    if Back>7 and (Back-6)~=1 then
        removeLuaSprite('BackMenu'..tostring(Back-6))
    end
    makeLuaSprite('BackMenu'..Back,'menu/pokemon_yellow_noise',x,y)
    SetCamera('BackMenu'..Back,'camTV')
    addLuaSprite('BackMenu'..Back)
    setObjectOrder('BackMenu'..Back,0)
    
end
local Frame=0
function onUpdatePost(elapsed)
    Frame=Frame+(elapsed/256)
    setProperty('BackMenu1.y',-200+math.sin((180 / math.pi) * (Frame))*200)
    setProperty('BackMenu1.x',getProperty('BackMenu1.x')+(24/framerate))
    for i=2,Back do
        if luaSpriteExists('BackMenu'..i) then
            setProperty('BackMenu'..i..'.y',getProperty('BackMenu1.y'))
            setProperty('BackMenu'..i..'.x',getProperty('BackMenu'..tostring(i-1)..'.x')-getProperty('BackMenu1.width'))
        end
    end
    
    if getProperty('BackMenu'..tostring(Back)..'.x')>=screenWidth/2 then
        MakeBack(getProperty('BackMenu'..Back..'.x')-getProperty('BackMenu1.width'),0)
    end
    if getProperty('BackMenu'..tostring(Back)..'.x')<=screenWidth/2 and getProperty('BackMenu'..tostring(Back)..'.x')>=0 then
        MakeBack(getProperty('BackMenu'..Back..'.x')-getProperty('BackMenu1.width'),0)
    end
end
local moverCooldown=0
function onUpdate(elapsed)
    if keyJustPressed('back') then
        callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
    end

    local newSelection = VerticalSelection

    local directionVertical = Selection((keyPressed('up') or onButtonPress('UpButton')),-2,0) + Selection((keyPressed('down') or onButtonPress('DownButton')),2,0)
    local directionHorizontal = Selection(keyPressed('left'),-1,0) + Selection(keyPressed('right'),1,0)
    if math.abs(directionVertical) > 0 then
    
        if moverCooldown <= 0 then
            newSelection = newSelection + directionVertical
            local even = Selection((newSelection % 2) == 0,1,0)
            
            if newSelection < 1 then
                newSelection = #CreditsTagList - even
            elseif newSelection > #CreditsTagList then
                newSelection = (newSelection % 2)
                if newSelection<1 then
                    newSelection=2
                end
            end
            moverCooldown = moverCooldown + getPropertyFromClass('flixel.FlxG','updateFramerate') / 4
        
        else
            moverCooldown=moverCooldown-1
        end
    
    elseif math.abs(directionHorizontal) > 0 then
    
        if moverCooldown <= 0 then
            newSelection =newSelection + directionHorizontal

            if newSelection < 1 then
                newSelection = #CreditsTagList
            elseif newSelection > #CreditsTagList then
                newSelection = 1
            end
            moverCooldown = moverCooldown + getPropertyFromClass('flixel.FlxG','updateFramerate') / 4
        else
            moverCooldown= moverCooldown-1
        end
    
    else
        moverCooldown = 0
    end
    updateVerticalSelection(newSelection)

    local step = 0
    local j = 0
    local constant = 150 * (11 / 12)
    local fakeElapsed = clamp(elapsed, 0, 1)
    for i=1,#CreditsTagList do
        local iconX = (125 + (step * constant) - (getProperty(CreditsTagList[i]..".width") / 2))
        local iconY = (125 + (constant * (j - math.floor(VerticalSelection / 2) + 0.5)) - (getProperty(CreditsTagList[i]..".height") / 2) + ((constant / 2) * step))
        setProperty(CreditsTagList[i]..".x",iconX)
        setProperty(CreditsTagList[i]..".y",Lerp(getProperty(CreditsTagList[i]..".y"),iconY,fakeElapsed / (1 / 15)))
        step=step+1
        if step>1 then
            step=0
            j=j+1
        end
    end
end
function updateVerticalSelection(newSelection)

	if VerticalSelection ~= newSelection then
	
		VerticalSelection = newSelection
		playSound('scrollMenu',0.5)

		for i = 1,#CreditsTagList do
            setProperty(CreditsTagList[i]..'.alpha',0.3)
        end
        setProperty(CreditsTagList[VerticalSelection]..'.alpha',1)
		updateText()
    end
	
end
function Selection(If,True,False)
    if If then
        return True
    else
        return False
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function clamp(value,min,max)
    return math.max(min, math.min(max, value))
end
function SetCamera(tag,camera)
    runHaxeCode([[
        game.getLuaObject("]]..tag..[[").camera=getVar("]]..camera..[[");
    ]])
end
function onStartCountdown()
    return Function_Stop
end
function onPause()
    return Function_Stop
end