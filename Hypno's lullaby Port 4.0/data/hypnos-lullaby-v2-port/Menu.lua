local CharacterMenu={
    ["safety lullaby"]={"gf","hypno"},
    ["lost cause"]={"bf"},
    ["frosbite"]={"cold_gold","red","typhlosion","pikachu"},
    ["insomnia"]={"silver","feraligatr"},
    ["monochrome"]={"gold"},
    ["missingno"]={"missingno"},
    ["brimstone"]={"buried_alive","gengar","muk","apparition_gf"},
    ["amusia"]={"ponyta","wigglytuff"},
    ["dissension"]={"steven"},
    ["purin"]={"jigglypuff","nurse_joy","pico"},
    ["death toll"]={"beelzebub","dawn","hell_bell"},
    ["bygone purpose"]={"small_hypno","alexis"},
    ["pasta night"]={"pasta_night_hypno","lord_x","mx"},
    ["shinto"]={"shinto"},
    ["shitno"]={"shitno"}
}
local VisibleCharacter={}
local OffsetsMenu={
    hypno={x=200,y=100},
    buried_alive={x=-200,y=0},
    gold={x=-50,y=0},
    silver={x=-50,y=0},
    shinto={x=-150,y=-50},
}
local MenuStuff={"STORY","FREEPLAY","CREDITS",'POKEDEX',"OPTIONS",'GALLERY'}
local Pos=1
function onCreate()
    initSaveData('UnlockData')
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
    addHaxeLibrary('FlxFlicker','flixel.effects')
    precacheSound('confirmText')
    precacheSound('scrollMenu')
    playMusic('HYPNO_MENU',0.7,true)
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    
    MakeBack(screenWidth/2-10,0)

    setDataFromSave('UnlockData','safety lullabyUnlock',true)
    flushSaveData('UnlockData')

    local Songs=stringSplit(getTextFromFile('weeks/FreeplayList.txt'),'\n')
    for i=1,#Songs do
        local song=stringTrim(Songs[i])
        if getDataFromSave('UnlockData',song..'Unlock',false) then
            if CharacterMenu[song]~=nil then
                for j=1,#CharacterMenu[song] do
                    table.insert(VisibleCharacter,CharacterMenu[song][j])
                end 
            end
        end
    end
    local Character=VisibleCharacter[getRandomInt(1,#VisibleCharacter)]
    local Offsets={x=0,y=0}
    if OffsetsMenu[Character]~=nil then
        Offsets.x=OffsetsMenu[Character].x
        Offsets.y=OffsetsMenu[Character].y
    end
    for i=1,#MenuStuff do
        callScript('scripts/Stuff/GeneralMenuStuff','MakeAlphabet',{MenuStuff[i],MenuStuff[i],(screenWidth/4),50+(i-1)*105,'center',1,true})
        setProperty(MenuStuff[i]..'.alpha',0.7)
        if i==1 then
            setProperty(MenuStuff[i]..'.alpha',1)
        end
    end
    makeAnimatedLuaSprite('CharcterMenu','menu/charcter menu/'..Character..'_menu')
    addAnimationByPrefix('CharcterMenu','idle',string.gsub(Character, "_", " ")..' menu instance 1',24,true)
    setObjectCamera('CharcterMenu','other')
    scaleObject('CharcterMenu',0.8,0.8)
    setProperty('CharcterMenu.x',screenWidth-getProperty('CharcterMenu.width')+Offsets.x)
    setProperty('CharcterMenu.y',screenHeight-getProperty('CharcterMenu.height')+Offsets.y)
    addLuaSprite('CharcterMenu',true)
    
end
local Back=0
function MakeBack(x,y)
    Back=Back+1
    makeLuaSprite('BackMenu'..Back,'menu/pokemon_yellow_noise',x,y)
    setObjectCamera('BackMenu'..Back,'other')
    addLuaSprite('BackMenu'..Back)
    setObjectOrder('BackMenu'..Back,0)
    
end
local Frame=0
function onUpdate(elapsed)
    Frame=Frame+(elapsed/256)
    setProperty('BackMenu1.y',-200+math.sin((180 / math.pi) * (Frame))*200)
    setProperty('BackMenu1.x',getProperty('BackMenu1.x')+(24/framerate))
    for i=2,Back do
        setProperty('BackMenu'..i..'.y',getProperty('BackMenu1.y'))
        setProperty('BackMenu'..i..'.x',getProperty('BackMenu'..tostring(i-1)..'.x')-getProperty('BackMenu1.width'))
    end
    
    if getProperty('BackMenu'..tostring(Back)..'.x')>=screenWidth/2 then
        MakeBack(getProperty('BackMenu'..Back..'.x')-getProperty('BackMenu1.width'),0)
    end
    if getProperty('BackMenu'..tostring(Back)..'.x')<=screenWidth/2 and getProperty('BackMenu'..tostring(Back)..'.x')>=0 then
        MakeBack(getProperty('BackMenu'..Back..'.x')-getProperty('BackMenu1.width'),0)
    end

    if keyJustPressed('up') then
        playSound('scrollMenu',0.4)
        setProperty(MenuStuff[Pos]..'.alpha',0.7)
        Pos=Pos-1
        if Pos<= 0 then
            Pos= #MenuStuff
        end
        setProperty(MenuStuff[Pos]..'.alpha',1)
    elseif keyJustPressed('down')  then
        playSound('scrollMenu',0.4)
        setProperty(MenuStuff[Pos]..'.alpha',0.7)
        Pos=Pos+1
        if Pos> #MenuStuff then
            Pos=1
        end
        setProperty(MenuStuff[Pos]..'.alpha',1)
    end
    if keyJustPressed('accept') then
        playSound('confirmText')
        runHaxeCode([[
            FlxFlicker.flicker(getVar("]]..MenuStuff[Pos]..[["), 0.85, 0.06 * 2, true, false, function(flick:FlxFlicker)
                {
                    game.callOnLuas("onFlickerComplete",["]]..MenuStuff[Pos]..[["]);
                });
        ]])
        
    end
    if keyJustPressed('back') then
        addHaxeLibrary('Application', 'lime.app')
        addHaxeLibrary('Image','lime.graphics')
        runHaxeCode([[
            Application.current.window.title="Friday Night Funkin': Mikan Engine";
            var Icon:Image=Image.fromFile(Paths.modFolders('images/window_icon/default/iconOG.png'));
            Application.current.window.setIcon(Icon);
        ]])
        exitSong()
        
    end
end
function onFlickerComplete(ObjectTag)
    callScript('scripts/Stuff/GeneralMenuStuff','OpenState',{ObjectTag})
end
function onStartCountdown()
    return Function_Stop
end
function onPause()
    return Function_Stop
end