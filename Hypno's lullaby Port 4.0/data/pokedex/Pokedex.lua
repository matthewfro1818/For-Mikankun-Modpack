local Pokedex={}
--{name='',height='',weight='',scale=0,offsets={x=0,y=0},tag='',desc=''}
local Path='menu/Pokedex/'
local Actual=1
local scale=3.05732484076
function onCreate()
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
    
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    playMusic('PokedexTheme',0,true)
    soundFadeIn('',0.5, 0, 1)
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    makeLuaSprite('BG',Path..'BG',0,0)
    scaleObject('BG',80,80)
    setObjectCamera('BG','other')
    setProperty('BG.antialiasing',false)
    addLuaSprite('BG')

    makeLuaSprite('Boxes',Path..'boxes',0,0)
    scaleObject('Boxes',scale,scale)
    setObjectCamera('Boxes','other')
    screenCenter('Boxes','x')
    setProperty('Boxes.antialiasing',false)
    addLuaSprite('Boxes')

    makeLuaSprite('Back',Path..'back',160, 595)
    scaleObject('Back',scale,scale)
    setObjectCamera('Back','other')
    setProperty('Back.antialiasing',false)
    addLuaSprite('Back')

    

    makeLuaSprite('ArrowUp','menu/selector',910, 485)
    scaleObject('ArrowUp',3,3)
    setProperty('ArrowUp.antialiasing',false)
    setProperty('ArrowUp.angle',90)
    setObjectCamera('ArrowUp','other')
    addLuaSprite('ArrowUp')

    makeLuaSprite('ArrowDown','menu/selector',910, 25)
    scaleObject('ArrowDown',3,3)
    setProperty('ArrowDown.antialiasing',false)
    setProperty('ArrowDown.angle',-90)
    setObjectCamera('ArrowDown','other')
    addLuaSprite('ArrowDown')

    for i=1,math.huge do
        if not checkFileExists('pokedex/Pokedex'..i..'.txt') then
            break
        else
            MakePokedex(i)
        end
    end
    makeLuaText('NameTxt',Pokedex[1].name,162 * scale,160 + (9 * scale), 3 * scale)
    setTextFont('NameTxt',"poke.ttf")
    setTextColor('NameTxt','000000')
    setTextSize('NameTxt',64)
    setTextAlignment('NameTxt','center')
    setTextBorder('NameTxt',0,'000000')
    setProperty('NameTxt.antialiasing',false)
    setObjectCamera('NameTxt','other')
    addLuaText('NameTxt')


    makeLuaText('TagTxt',Pokedex[1].tag,162 * scale,160 + (9 * scale), 21 * scale)
    setTextFont('TagTxt',"poke.ttf")
    setTextColor('TagTxt','000000')
    setTextSize('TagTxt',48)
    setTextAlignment('TagTxt','center')
    setTextBorder('TagTxt',0,'000000')
    setObjectCamera('TagTxt','other')
    setProperty('TagTxt.antialiasing',false)
    addLuaText('TagTxt')
    for i=1,#Pokedex do
        makeLuaText('SelectorNames'..i,Pokedex[i].name,122 * scale,160 + (189 * scale), 59 + (6 * scale) + (19 * scale * (i-1)))
        setTextFont('SelectorNames'..i,"poketext.ttf")
        setTextColor('SelectorNames'..i,'000000')
        setTextSize('SelectorNames'..i,16)
        setTextAlignment('SelectorNames'..i,'center')
        setTextBorder('SelectorNames'..i,0,'000000')
        setObjectCamera('SelectorNames'..i,'other')
        setProperty('SelectorNames'..i..'.antialiasing',false)
        addLuaText('SelectorNames'..i)
        if i>7 then
            setProperty('SelectorNames'..i..'.visible',false)
        end
    end
    
    UpdatePokedex(1)
    makeInfoBox(1)

    
end
function onCreatePost()
    debugPrint('B')
    MakeButton("BackButton","Back")
    MakeButton("DescButton","altBg")
    MakeButton("DownButton","ArrowUp")
    MakeButton("UpButton","ArrowDown")
    
end
function makeInfoBox(Part)

    makeLuaSprite('altBg',Path..'altBG',0, 579)
    scaleObject('altBg',scale,scale)
    setObjectCamera('altBg','other')
    setProperty('altBg.antialiasing',false)
    screenCenter('altBg','x')
    addLuaSprite('altBg',true)

    makeLuaText('altBgText','DESCRIPTION',0)
    setTextFont('altBgText',"poketext.ttf")
    setTextColor('altBgText','000000')
    setTextSize('altBgText',40)
    setTextAlignment('altBgText','center')
    setTextBorder('altBgText',0,'000000')
    setObjectCamera('altBgText','other')
    setProperty('altBgText.antialiasing',false)
    screenCenter('altBgText','x')
    addLuaText('altBgText')

    makeLuaText('altBgName',Pokedex[Part].name,0, 200, 0)
    setTextFont('altBgName',"poketext.ttf")
    setTextColor('altBgName','000000')
    setTextSize('altBgName',40)
    setTextAlignment('altBgName','left')
    setTextBorder('altBgName',0,'000000')
    setObjectCamera('altBgName','other')
    setProperty('altBgName.antialiasing',false)
    addLuaText('altBgName')

    makeLuaText('altTagline',Pokedex[Part].tag,0, 200, 0)
    setTextFont('altTagline',"poketext.ttf")
    setTextColor('altTagline','000000')
    setTextSize('altTagline',40)
    setTextAlignment('altTagline','left')
    setTextBorder('altTagline',0,'000000')
    setObjectCamera('altTagline','other')
    setProperty('altTagline.antialiasing',false)
    addLuaText('altTagline')

    makeLuaText('altDescription',Pokedex[Part].desc,900, 200, 0)
    setTextFont('altDescription',"poketext.ttf")
    setTextColor('altDescription','000000')
    setTextSize('altDescription',28)
    setTextAlignment('altDescription','left')
    setTextBorder('altDescription',0,'000000')
    setObjectCamera('altDescription','other')
    setProperty('altDescription.antialiasing',false)
    addLuaText('altDescription')

    makeLuaText('altHtWt','HT '..Pokedex[Part].height..'    WT '..Pokedex[Part].weight,900, 200, 0)
    setTextFont('altHtWt',"poketext.ttf")
    setTextColor('altHtWt','000000')
    setTextSize('altHtWt',32)
    setTextAlignment('altHtWt','left')
    setTextBorder('altHtWt',0,'000000')
    setObjectCamera('altHtWt','other')
    setProperty('altHtWt.antialiasing',false)
    addLuaText('altHtWt')

end
function UpdateInfoBox(dex)
    setTextString('altBgName',Pokedex[dex].name)
    setTextString('altTagline',Pokedex[dex].tag)
    setTextString('altDescription',Pokedex[dex].desc)
    setTextString('altHtWt','HT '..Pokedex[dex].height..'    WT '..Pokedex[dex].weight)
end
local inSubMenu=false
local Isleaving=false
function onUpdate(elapsed)
    
    if (keyJustPressed('up') or onButtonJustPress('UpButton')) and not inSubMenu  then
        Actual=Actual-1
        if Actual<1 then
            Actual=#Pokedex
        end
        UpdatePokedex(Actual)
        UpdateInfoBox(Actual)
    end
    if (keyJustPressed('down') or onButtonJustPress('DownButton')) and not inSubMenu  then
        Actual=Actual+1
        if Actual> #Pokedex then
            Actual=1
        end
        UpdatePokedex(Actual)
        UpdateInfoBox(Actual)
    end
    if (onButtonJustPress('BackButton') or keyJustPressed('back')) and not inSubMenu then
        Isleaving=true
        makeLuaSprite('BackPress',Path..'backpress',160, 595)
        scaleObject('BackPress',scale,scale)
        setObjectCamera('BackPress','other')
        setProperty('BackPress.antialiasing',false)
        addLuaSprite('BackPress')
        callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
    end
    if (keyJustPressed('accept') or onButtonJustPress('DescButton')) and not Isleaving  then
        inSubMenu=not inSubMenu
    end
    local Lerp=elapsed / (0.05 / 60)
    if inSubMenu and getProperty('altBg.y') > 7 then 
        setProperty('altBg.y',getProperty('altBg.y')-Lerp) 
    end
    if not inSubMenu and getProperty('altBg.y') < 579 then 
        setProperty('altBg.y',getProperty('altBg.y')+Lerp) 
    end
    setProperty('altBgText.y',getProperty('altBg.y')+55)
    setProperty('altBgName.y',getProperty('altBg.y')+190)
    setProperty('altTagline.y',getProperty('altBg.y')+265)
    setProperty('altHtWt.y',getProperty('altBg.y')+335)
    setProperty('altDescription.y',getProperty('altBg.y')+450)
end
function UpdatePokedex(selecter)
    
    setTextString('NameTxt',Pokedex[selecter].name)
    setTextString('TagTxt',Pokedex[selecter].tag)
    makeLuaSprite('Charcter','menu/Pokedex/Characters/'..Pokedex[selecter].name..'/char',Pokedex[selecter].offsets.x,Pokedex[selecter].offsets.y)
    scaleObject('Charcter',Pokedex[selecter].scale,Pokedex[selecter].scale)
    setProperty('Charcter.antialiasing',false)
    setObjectCamera('Charcter','other')
    addLuaSprite('Charcter')
    for i=1,#Pokedex do
        if luaTextExists('SelectorNames'..i) then
        setProperty('SelectorNames'..i..'.alpha',1)
        end
        setProperty('SelectorNames'..i..'.visible',false)
        if i<=7 and selecter<=4 then
            setProperty('SelectorNames'..i..'.visible',true)
        elseif i>=#Pokedex-6 and selecter>=#Pokedex-3 then
            setProperty('SelectorNames'..i..'.visible',true)
        elseif  i>=selecter-3 and i<=selecter+3 and selecter<#Pokedex-3 and selecter>4 then
            setProperty('SelectorNames'..i..'.visible',true)
        end

        if i<=7 and selecter<5 then
            setProperty('SelectorNames'..i..'.y',77.34 + (58.09 * (i-1)))
        else
            
            if selecter>#Pokedex-4 then
                setProperty('SelectorNames'..i..'.y',77.34 + (58.09 * (i-4)))
            elseif selecter>#Pokedex-5 then
                setProperty('SelectorNames'..i..'.y',77.34 + (58.09 * (i-3)))
            else
                setProperty('SelectorNames'..i..'.y',77.34 + (58.09 * (i-2)))
            end
        end
        local distFromEnd = #Pokedex - selecter
        if selecter > 3 then    
            setProperty('SelectorNames'..i..'.y',77.34 + ((58.09 * i)) - ( 58.09 * (selecter - 3)))
            if distFromEnd <= 3 then
                setProperty('SelectorNames'..i..'.y',77.34 + ((58.09 * i-1)) - (58.09 * (#Pokedex - 6)))
            end   
        else
            setProperty('SelectorNames'..i..'.y',77.34 + ((58.09 * (i-1))))
        end
    end
    setProperty('SelectorNames'..selecter..'.alpha',0.5)

end
function MakePokedex(dex)
    local Txt =getTextFromFile('pokedex/Pokedex'..dex..'.txt')
    if checkFileExists('pokedex/Pokedex'..dex..'.txt') then
    local Name=stringSplit(stringSplit(Txt,'name:')[2],',')[1]
    local Height=stringSplit(stringSplit(Txt,'height:')[2],',')[1]
    local Weight=stringSplit(stringSplit(Txt,'weight:')[2],',')[1]
    local Scale=tonumber(stringSplit(stringSplit(Txt,'scale:')[2],',')[1])
    local Offsets={x=tonumber(stringSplit(stringSplit(Txt,'offsetX:')[2],',')[1]),y=tonumber(stringSplit(stringSplit(Txt,'offsetY:')[2],',')[1])}
    local Tag=stringSplit(stringSplit(Txt,'tagline:')[2],',')[1]
    local Desc=stringSplit(stringSplit(Txt,'desc:')[2],'/')[1]
    
    Pokedex[dex]={name=Name,height=Height,weight=Weight,scale=Scale,offsets={x=Offsets.x,y=Offsets.y},tag=Tag,desc=Desc}
    else
        Pokedex[dex]={name='Null',height='Null',weight='Null',scale=1,offsets={x=0,y=0},tag='Null',desc='Null'}
    end
end

