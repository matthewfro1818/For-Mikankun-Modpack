--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Pow' then
if boyfriendName~='MX' then

playAnim('MXArms','Hit1',true)
playSound('HandUp',1)
triggerEvent('Play Animation','Hit1',MX)
end
end
end
function onCreate()
    precacheSound('HandUp')
    precacheSound('POW')
    MX=''
    Scroll={screenHeight- 150,50}
    --DownScroll screenHeight- 150
    --UpScroll 50
    scrolling=2
    if not downscroll then
        scrolling=1
    end
    if dadName=='MX' then
        MX='dad'
    elseif gfName =='MX' then
        MX='gf'
    end
end
function onUpdate(elapsed)
    if boyfriendName~='MX' then
if getProperty(MX..'.animation.curAnim.finished') and getProperty(MX..'.animation.curAnim.name')=='Hit1' then
    triggerEvent('Play Animation','Hit2',MX)
    playAnim('MXArms','Hit2',true)
    setProperty('POW.alpha',0)
    ScrollChanges()
    dropStart()
end
if  getProperty(MX..'.animation.curAnim.name')~='Hit2' then
    setProperty('POW.alpha',1)
end
end

end
function dropStart()
    playSound('POW',1)
    cameraShake('FlxG.camera',0.05,0.5)
   
end
function WhoScrolling(a)
if a == 2 then
    for i=0,3 do
        setPropertyFromGroup('playerStrums',i,'downScroll',false)
    end
    return 1
    
else
    for i=0,3 do
        setPropertyFromGroup('playerStrums',i,'downScroll',true)
    end
    return 2
end
end
function ScrollChanges()
    if downscroll then
       noteTweenY('TweenScroll0',4,Scroll[scrolling],2.1,'bounceOut')
       noteTweenY('TweenScroll1',5,Scroll[scrolling],2.2,'bounceOut')
       noteTweenY('TweenScroll2',6,Scroll[scrolling],2.3,'bounceOut')
       noteTweenY('TweenScroll3',7,Scroll[scrolling],2.5,'bounceOut')
       
    else
        noteTweenY('TweenScroll0',4,Scroll[scrolling],2.1,'bounceOut')
        noteTweenY('TweenScroll1',5,Scroll[scrolling],2.2,'bounceOut')
        noteTweenY('TweenScroll2',6,Scroll[scrolling],2.3,'bounceOut')
        noteTweenY('TweenScroll3',7,Scroll[scrolling],2.5,'bounceOut')
    end
    scrolling=WhoScrolling(scrolling)
    for i = 0, getProperty('notes.length')-1 do
        setPropertyFromGroup('notes', i, 'multSpeed',0.7) 
    end

    
end



	

    


