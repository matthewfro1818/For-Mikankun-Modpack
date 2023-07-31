--[[
    Code made by Drawoon_
]]
local Path='UI/pixel/'
local ScaleMult=3
local font = 'poke.ttf'
local fontSize = 24
function onCreatePost()
    setProperty('iconP2.alpha',0)
    setProperty('iconP1.alpha',0)
    setProperty('healthBar.alpha',0)
    setProperty('scoreTxt.y',5)
    callOnLuas('onUpdateScore',{false})
    setProperty('scoreTxt.size',30)
    setTextFont('scoreTxt', 'poke.ttf')
    local OffsetBStrum=-15
    local XO=720+70
    local YO=460+33
    local XP=-720
    local YP=10-15
    if downscroll then
        YP=-60+33
        YO=-510-15
        XO=-80
        XP=80+70
    end
    if middlescroll then
        XO=screenWidth
        XP=35
    end 
    local PositionX={}
    local PositionY={}
    for i=0,7 do
        if i<4 then
             table.insert(PositionX,i+1,getPropertyFromGroup('strumLineNotes',i,'x')+XO+OffsetBStrum*i)
             table.insert(PositionY,i+1,getPropertyFromGroup('strumLineNotes',i,'y')+YO)
        else
            table.insert(PositionX,i+1,getPropertyFromGroup('strumLineNotes',i,'x')+XP+OffsetBStrum*(i%4))
            table.insert(PositionY,i+1,getPropertyFromGroup('strumLineNotes',i,'y')+YP)
        end
    end
   
    for i=0,#PositionX-1 do
        setPropertyFromGroup('strumLineNotes',i,'x',PositionX[i+1])
        setPropertyFromGroup('strumLineNotes',i,'y',PositionY[i+1])
        if screenHeight/2>=PositionY[i+1] and downscroll then
        
            setPropertyFromGroup('strumLineNotes',i,'downScroll',false)
        elseif screenHeight/2<=PositionY[i+1] and not downscroll then
            setPropertyFromGroup('strumLineNotes',i,'downScroll',true)
        end
    end
    
    
end
function onCreate()
    if not middlescroll then
    --HUB LEFT
    makeLuaSprite('HubLEFT',Path..'buried_hud', 0, 30)
    loadGraphic('HubLEFT',Path..'buried_hud',getProperty('HubLEFT.width')/2,getProperty('HubLEFT.height'))
    addAnimation('HubLEFT','idle',{0},0,true)
    setGraphicSize('HubLEFT', getProperty('HubLEFT.width')*ScaleMult,getProperty('HubLEFT.height')*ScaleMult)
    setObjectCamera('HubLEFT', 'hud')
    addLuaSprite('HubLEFT',false)
    
    setProperty('HubLEFT.antialiasing',false)
    --setProperty('HubLEFT.x',getProperty('HubLEFT.width'))

    --HUB Right
    makeLuaSprite('HubRIGHT',Path..'buried_hud', 0, 0)
    loadGraphic('HubRIGHT',Path..'buried_hud',getProperty('HubRIGHT.width')/2,getProperty('HubRIGHT.height'))
    addAnimation('HubRIGHT','idle',{1},0,true)
    setGraphicSize('HubRIGHT', getProperty('HubRIGHT.width')*ScaleMult,getProperty('HubRIGHT.height')*ScaleMult)
    setObjectCamera('HubRIGHT', 'hud')
    addLuaSprite('HubRIGHT',false)
    
    setProperty('HubRIGHT.antialiasing',false)
    setProperty('HubRIGHT.x',screenWidth-getProperty('HubRIGHT.width'))
    setProperty('HubRIGHT.y',screenHeight-getProperty('HubRIGHT.height')-30)
    --Opponent Health bar
    if not downscroll then
        makeLuaSprite('HealthOpponent',Path..'brimstone_healthbar', getProperty('HubRIGHT.x')+ 79 * 3, getProperty('HubRIGHT.y')+ 47 * 3);
        setObjectCamera('HealthOpponent', 'hud')
        setGraphicSize('HealthOpponent', 52 * 3,2* 3)
        addLuaSprite('HealthOpponent',false)
        setProperty('HealthOpponent.antialiasing',false)
    else
        makeLuaSprite('HealthOpponent',Path..'brimstone_healthbar',getProperty('HubLEFT.x') + 43 * 3, getProperty('HubLEFT.y')+ 47 * 3);
        setObjectCamera('HealthOpponent', 'hud')
        setGraphicSize('HealthOpponent', 52 * 3,2 * 3)
        addLuaSprite('HealthOpponent',false)
        setProperty('HealthOpponent.antialiasing',false)
    end
else
    --Hud Center
    makeLuaSprite('HubCENTER',Path..'buried_center', 0, 30)

    setGraphicSize('HubCENTER', getProperty('HubCENTER.width')*ScaleMult,getProperty('HubCENTER.height')*ScaleMult)
    setObjectCamera('HubCENTER', 'hud')
    addLuaSprite('HubCENTER',false)
    setProperty('HubCENTER.antialiasing',false)
    if downscroll then
        setProperty('HubCENTER.y',screenHeight-getProperty('HubCENTER.height')-30)  
    end
    screenCenter('HubCENTER','x')
    
    
end
end
local WidthPlay=0
local HeightPlay=0
function onUpdate(elapsed)
if not luaSpriteExists('HealthPlayer') and getHealth()>0 then
    if middlescroll then
        makeLuaSprite('HealthPlayer',Path..'brimstone_healthbar', getProperty('HubCENTER.x')+ 78 * 3, getProperty('HubCENTER.y')+ 48 * 3)
    else
        if downscroll then
            makeLuaSprite('HealthPlayer',Path..'brimstone_healthbar', getProperty('HubRIGHT.x')+ 79 * 3, getProperty('HubRIGHT.y')+ 47 * 3)
        else
            makeLuaSprite('HealthPlayer',Path..'brimstone_healthbar', -495 +getProperty('HubLEFT.x') + 43 * 3, getProperty('HubLEFT.y')+ 47 * 3)
        end
    end
   setObjectCamera('HealthPlayer', 'hud')
   setGraphicSize('HealthPlayer', 52 * 3,2 * 3)
   addLuaSprite('HealthPlayer',false)
   setProperty('HealthPlayer.antialiasing',false)

   WidthPlay=getProperty('HealthPlayer.width')
   HeightPlay=getProperty('HealthPlayer.height')

end
if luaSpriteExists('HealthPlayer') then
    setGraphicSize('HealthPlayer', WidthPlay*(getHealth()/2),HeightPlay)
end

if getHealth()<=0 then
    removeLuaSprite('HealthPlayer',true)
end

if getHealth()>=1 then
    setProperty('HealthPlayer.color',getColorFromHex('FFFFFF'))
   
elseif getHealth()>=0.5 then
    setProperty('HealthPlayer.color',getColorFromHex('FFFF00'))
   
elseif getHealth()>=0 then
    setProperty('HealthPlayer.color',getColorFromHex('FF0000'))
   
end
setProperty('timeBar.alpha',0)
setProperty('timeTxt.alpha',0)

end