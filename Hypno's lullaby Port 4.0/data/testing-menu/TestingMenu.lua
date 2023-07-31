local SongListData={}
function onCreate()
    initSaveData('HypnosPref')
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isTesting',true)
    flushSaveData('ImportantData')
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)

    SongListData=stringSplit(getTextFromFile('weeks/FreeplayList.txt'),'\n')
    
    
end
local SongList={}
local SongLocked={}
local isHell=false
local isPussy=false
function onCreatePost()
    isPussy=getDataFromSave('HypnosPref','Pussy mode')
    isHell=getDataFromSave('HypnosPref','Hell mode')

    for i=1,#SongListData do
        SongListData[i]=stringTrim(SongListData[i])
        MakeTestButton(SongListData[i],0,0)
        local TheSong=string.gsub(string.lower(SongListData[i]),' ','-')
        local isExist=true
        if not checkFileExists('data/'..TheSong..'/'..TheSong..'.json') then
            setProperty(SongListData[i]..'Sprite.color',getColorFromHex('FF0000'))
            isExist=false
        end    
        table.insert(SongList,SongListData[i])
        table.insert(SongLocked,isExist)
    end

    makeAnimatedLuaSprite('UpSprite','menu/campaign_menu_UI_assets',screenWidth/2,10)
    addAnimationByPrefix('UpSprite','idle','arrow left',0,true)
    addAnimationByPrefix('UpSprite','press','arrow push left',0,true)
    playAnim('UpSprite','idle')
    setObjectCamera('UpSprite','other')
    setProperty('UpSprite.angle',90)
    addLuaSprite('UpSprite')
    MakeButton('UP','UpSprite','')

    makeAnimatedLuaSprite('DOWNSprite','menu/campaign_menu_UI_assets',screenWidth/2,screenHeight-10)
    addAnimationByPrefix('DOWNSprite','idle','arrow right',0,true)
    addAnimationByPrefix('DOWNSprite','press','arrow push right',0,true)
    playAnim('DOWNSprite','press')
    setObjectCamera('DOWNSprite','other')
    setProperty('DOWNSprite.angle',90)
    setProperty('DOWNSprite.y',screenHeight-10-getProperty('DOWNSprite.height'))
    addLuaSprite('DOWNSprite')
    MakeButton('DOWN','DOWNSprite','')

    MakeTestButton('Hell Mode',screenWidth*(3/4),20)
    setProperty('Hell ModeSprite.x',screenWidth*(3/4)-getProperty('Hell ModeSprite.width')/2+20)
    UpdatedButton('Hell Mode')

    MakeTestButton('Pussy Mode',screenWidth*(3/4),getProperty('Hell ModeSprite.height')+getProperty('Hell ModeSprite.y')+20)
    setProperty('Pussy ModeSprite.x',getProperty('Hell ModeSprite.x'))
    UpdatedButton('Pussy Mode')

    makeLuaSprite('ExitSprite',nil,screenWidth,screenHeight)
    makeGraphic('ExitSprite',100,100,'FFFFFF')
    setObjectCamera('ExitSprite','other')
    addLuaSprite('ExitSprite')
    setProperty('ExitSprite.x',screenWidth-getProperty('ExitSprite.width'))
    setProperty('ExitSprite.y',screenHeight-getProperty('ExitSprite.height'))

    MakeButton('Exit','ExitSprite','Exit')

    makeLuaText('ExitText','EXIT',0,0,0)
    setTextSize('ExitText',32)
    setObjectCamera('ExitText','other')
    addLuaText('ExitText')
    setProperty('ExitText.x',getProperty('ExitSprite.x')+getProperty('ExitSprite.width')/2-getProperty('ExitText.width')/2)
    setProperty('ExitText.y',getProperty('ExitSprite.y')+getProperty('ExitSprite.height')/2-getProperty('ExitText.height')/2)

    makeLuaText('TestText','Use this menu in case of default menus doesn\'t work or is this a android version',500,0,screenHeight/2)
    setProperty('TestText.x',screenWidth*(3/4)-getProperty('TestText.width')/2+20)
    setTextSize('TestText',32)
    setObjectCamera('TestText','other')
    addLuaText('TestText')
end
function MakeTestButton(Songname,x,y)
    makeLuaSprite(Songname..'Sprite',nil,x,y)
    makeGraphic(Songname..'Sprite',500,100,'FFFFFF')
    setObjectCamera(Songname..'Sprite','other')
    addLuaSprite(Songname..'Sprite')

    MakeButton(Songname,Songname..'Sprite',string.upper(Songname))

    makeLuaText(Songname..'Text',string.upper(Songname),0,0,0)
    setTextSize(Songname..'Text',32)
    setObjectCamera(Songname..'Text','other')
    addLuaText(Songname..'Text')
    setProperty(Songname..'Text.x',x+getProperty(Songname..'Sprite.width')/2-getProperty(Songname..'Text.width')/2)
    setProperty(Songname..'Text.y',y+getProperty(Songname..'Sprite.height')/2-getProperty(Songname..'Text.height')/2)
end
function UpdatedButton(tag)

    setProperty(tag..'Text.x',getProperty(tag..'Sprite.x')+getProperty(tag..'Sprite.width')/2-getProperty(tag..'Text.width')/2)
    setProperty(tag..'Text.y',getProperty(tag..'Sprite.y')+getProperty(tag..'Sprite.height')/2-getProperty(tag..'Text.height')/2)
end
local curSelect=1
local SongNoSelecter=true
function onUpdate(elapsed)
    for i=1,#SongList do
        setProperty(SongList[i]..'Sprite.x',screenWidth/12)
        setProperty(SongList[i]..'Sprite.y',((i+curSelect-1)*(getProperty(SongList[i]..'Sprite.height')+20)))
        UpdatedButton(SongList[i])
        if onButtonJustPress(SongList[i]) and SongNoSelecter then
            if SongLocked[i] then
                SongNoSelecter=false
                playSound('confirmText')
                loadSong(SongList[i]) 
            else
                playSound('errorMenu')
            end
        end
    end
    if onButtonJustPress('UP') then
        if curSelect~=1 then
            curSelect=curSelect+1
            if curSelect==1 then
                playAnim('UpSprite','idle')
            end
            playSound('scrollMenu')
        else
            playSound('errorMenu')
        end
    end
    if onButtonJustPress('DOWN') then
        if curSelect~=5-#SongList then
            curSelect=curSelect-1
            if curSelect==5-#SongList then
                playAnim('DOWNSprite','idle')
            end
            playSound('scrollMenu')
        else
            playSound('errorMenu')
        end
    end
    if onButtonJustPress('Hell Mode') then
        isHell=not isHell
        if isHell then
           isPussy=false
        end
        setDataFromSave('HypnosPref','Pussy mode',isPussy)
        setDataFromSave('HypnosPref','Hell mode',isHell)
        flushSaveData('HypnosPref')
        playSound('confirmText')
    end
    if onButtonJustPress('Exit') then
        setDataFromSave('ImportantData','isTesting',false)
        flushSaveData('ImportantData')
        playSound('confirmText')
        exitSong()
    end
    if onButtonJustPress('Pussy Mode') then
        isPussy=not isPussy
        if isPussy then
            isHell=false
        end
        setDataFromSave('HypnosPref','Pussy mode',isPussy)
        setDataFromSave('HypnosPref','Hell mode',isHell)
        flushSaveData('HypnosPref')
        playSound('confirmText')
    end
    if isPussy then
        setProperty('Pussy ModeSprite.color',getColorFromHex('00FF00'))
    else
        setProperty('Pussy ModeSprite.color',getColorFromHex('FF0000'))
    end
    if isHell then
        setProperty('Hell ModeSprite.color',getColorFromHex('00FF00'))
    else
        setProperty('Hell ModeSprite.color',getColorFromHex('FF0000'))
    end
    if curSelect~=5-#SongList then
        playAnim('DOWNSprite','press')
    end
    if curSelect~=1 then
        playAnim('UpSprite','press')
    end
end