local Path='stage/Bygone/'
function onEvent(tag,v1,v2)
if tag=='BygonePicture' then
    if getProperty('Transitions.alpha')<= 0.0001 then
        doTweenAlpha('Transitions','Transitions', 1,6, 'linear')
    else
        
        doTweenAlpha('boyfriend','boyfriend', 0,0.00001, 'linear')
        cancelTween('Transitions')
        doTweenAlpha('Transitions','Transitions', 0,10, 'linear')
        
    end
end
end
function onCreate()
--Transition
makeLuaSprite('Transitions',Path..'AlexisTransition', 0, 0)
scaleObject('Transitions',0.95,0.95)
screenCenter('Transitions','xy')
setObjectCamera('Transitions','other')
setProperty('Transitions.alpha',0.0001)
addLuaSprite('Transitions', false)

end