function onEvent(eventName, value1, value2)
    if eventName=='Celebi' then
        MinHealth=tonumber(value1)
        direction=-1
        if getRandomBool(50) then direction= -direction end
        makeAnimatedLuaSprite('Celebi','Mechanics/Celebi_Assets',getProperty('dad.x')+(screenWidth/2)*getProperty('defaultCamZoom')*direction,getProperty('dad.y'))
        addAnimationByPrefix('Celebi','spawn', 'Celebi Spawn Full', 24, false)
        addAnimationByIndices('Celebi','recede', 'Celebi Spawn Full','14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0',24)
        addAnimationByPrefix('Celebi','idle', 'Celebi Idle', 24, false)
        playAnim('Celebi','spawn')
        addLuaSprite('Celebi',false)

        runTimer('SpawnNotes',stepCrochet*4/1000)
        runTimer('CelebiRecebe',stepCrochet * 16 / 1000)
        if CanCelebi then
            setProperty('HealthReducter.visible',true)
            doTweenY('SetMin','HealthControler',MinHealth,stepCrochet * 12 / 1000,'linear')
        end
       
    end
end
function onCreatePost()
    initSaveData('HypnosPref')
    precacheImage('Mechanics/Celebi_Assets')
    precacheImage('Mechanics/Note_asset')
    OriginalWidth=getProperty('healthBar.width')
    MinHealth=0
    NotesStuff={}
    CanCelebi=not getDataFromSave('HypnosPref','Pussy mode',false)
    makeLuaSprite('HealthControler',nil,OriginalWidth,MinHealth)
    makeLuaSprite('HealthReducter',nil,getProperty('healthBar.x'),getProperty('healthBar.y'))
    makeGraphic('HealthReducter',1,getProperty('healthBar.height'),'FFFFFF')
    setObjectCamera('HealthReducter','hud')
    addLuaSprite('HealthReducter',false)
    setProperty('HealthReducter.alpha',healthBarAlpha)
    
    setProperty('HealthReducter.visible',false)
    setObjectOrder('iconP1',getObjectOrder('iconP1')+2)
    setObjectOrder('iconP2',getObjectOrder('iconP2')+2)
    setObjectOrder('HealthReducter',getObjectOrder('iconP1')-1)
end
local noteCountCelebi=0
function eventEarlyTrigger(event)
    if event=='Celebi' then
        return -4
    end
end
function onUpdate(elapsed)
    setProperty('HealthReducter.x',getProperty('healthBar.x')+OriginalWidth*((2-getProperty('HealthControler.y'))/2)+1)
    setGraphicSize('HealthReducter',OriginalWidth*(getProperty('HealthControler.y')/2),getProperty('healthBar.height'))
    if getProperty('Celebi.animation.curAnim.finished') and getProperty('Celebi.animation.curAnim.name')=='recede' then
        removeLuaSprite('Celebi',false)
    end
    if getProperty('HealthControler.y')>=getHealth() then
        setHealth(-1)
    end 
    if noteCountCelebi~=nil and noteCountCelebi~=0 then   
        for i=1,noteCountCelebi+1 do
            CelebiUpdated(i,elapsed)
        end
    end
end
function CelebiUpdated(i,elapsed)
    NotesStuff[i][1]=NotesStuff[i][1]+4 * (elapsed / (1 / 60))
    NotesStuff[i][4]=NotesStuff[i][4]+4 * (elapsed / (1 / 60))
    setProperty('Note'..tostring(i-1)..'.x',NotesStuff[i][2] + math.cos((NotesStuff[i][1] * (math.pi / 180)) / 1.5) * NotesStuff[i][4])
    setProperty('Note'..tostring(i-1)..'.y',NotesStuff[i][3] + math.sin((NotesStuff[i][1] * (math.pi / 180)) / 1.5) * NotesStuff[i][4])
end
function onTweenCompleted(tag)
    if stringStartsWith(tag,'Note') then
        removeLuaSprite(tag,false)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='SpawnNotes' then
        noteCountCelebi = 3
        if getDataFromSave('HypnosPref','Hell mode',false) then
            noteCountCelebi=6
        end
        for i=0,noteCountCelebi do
            makeAnimatedLuaSprite('Note'..i,'Mechanics/Note_asset',getProperty('Celebi.x')+getProperty('Celebi.width')/2,getProperty('Celebi.y'))
            addAnimationByPrefix('Note'..i,'spawn', 'Note Full', 24, false)
            playAnim('Note'..i,'spawn')
            scaleObject('Note'..i,1.5,1.5)
            addLuaSprite('Note'..i,false)
            runTimer('Delay'..i,stepCrochet * 8 / 1000)
            NotesStuff[i+1]={getRandomFloat(0,360),getProperty('Note'..i..'.x'),getProperty('Note'..i..'.y'),0}
            
        end
    end
    if stringStartsWith(tag,'Delay') then
        if luaSpriteExists('Note'..stringSplit(tag,'Delay')[2]) then
            doTweenAlpha('Note'..stringSplit(tag,'Delay')[2],'Note'..stringSplit(tag,'Delay')[2],0,stepCrochet * 8 / 1000,'linear')
        end
    end
    if tag=='CelebiRecebe' then
        playAnim('Celebi','recede',true)
    end
end