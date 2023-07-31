function onEvent(eventName, value1, value2)
    if eventName=='Monochrome No More' then
        
        setProperty('dad.visible',false)
        setProperty('NoMore.visible',true)
        playAnim('NoMore','idle',true)
        runTimer('ChangeToRipHead',stepCrochet * 28 / 1000)
        runTimer('DelayZoom',(stepCrochet * 48) / 1000)
    end
end
function onTimerCompleted(tag)
    if tag=='DelayZoom' then
        doTweenZoom('Zoom','camGame',0.625,(stepCrochet * 48) / 1000,'cubeInOut')
    end
    if tag=='SetNomore' then
        ChangeNoMore()
        callScript('scripts/Stuff/PlayStuff.lua','SongNameShit')
        if isRunning('scripts/Stuff/HypnosPauseState.lua') then
        callScript('scripts/Stuff/HypnosPauseState.lua','ChangeSuffix',{'left','-nomore'})
        callScript('scripts/Stuff/HypnosPauseState.lua','ChangeSuffix',{'right','-nomore'})
        end
    end
    if tag=='ChangeToRipHead' then
            setProperty('RipHead.visible',true)
            setProperty('NoMore.visible',false)
            playAnim('RipHead','idle',true)
        if botPlay then
            setTextString('botplayTxt','owie')
            setProperty('botplayTxt.x',(screenWidth/2)-(getProperty('botplayTxt.width')/2))
        end
        runTimer('SetNomore',stepCrochet * 31 / 1000)
    end
end
function onTweenCompleted(tag)
    if tag=='Zoom' then
        setProperty('defaultCamZoom',0.625)
    end
end
function ChangeNoMore()
    runHaxeCode([[
        var lastAlpha:Float = game.dad.alpha;
        game.dad.alpha = 0;
        game.dad=game.dadMap.get('Gold-Head');
        game.dad.alpha = lastAlpha;
        game.setOnLuas('dadName', game.dad.curCharacter);
        game.dad.x+=150;
        game.dad.y+=20;
    ]])
    setProperty('RipHead.visible',false)
    setProperty('dad.visible',true)
end
function onCreate()
    addCharacterToList('Gold-Head','dad')
    curFrame=0
end
function onCreatePost()
    local Prefix ='characters/Gold/'
    makeAnimatedLuaSprite('NoMore',Prefix..'GOLD_NO_MORE',getProperty('dad.x')-60,getProperty('dad.y')-110)
    addAnimationByPrefix('NoMore','idle','No More instance 1',24,false)
    scaleObject('NoMore',1.3,1.3)
    addLuaSprite('NoMore',true)
    setProperty('NoMore.visible',false)

    makeAnimatedLuaSprite('RipHead',Prefix..'GOLD_HEAD_RIPPING_OFF',getProperty('dad.x')-150,getProperty('dad.y')-255)
    addAnimationByPrefix('RipHead','idle','Head rips_OneLayer instance 1',24,false)
    scaleObject('RipHead',1.3,1.3)
    addLuaSprite('RipHead',true)
    setProperty('RipHead.visible',false)


end
function eventEarlyTrigger(event)
    if event=='Monochrome No More' then
        return 4
    end
end