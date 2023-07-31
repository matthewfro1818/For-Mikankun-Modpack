function onEvent(eventName, value1, value2)
if eventName=='Camera Bop Speed' then
if value1=='' then
    value1=0
end
if value2=='' then
    value2=0
end
bopIntensity=tonumber(value1)
bopFrequency=tonumber(value2)
end
end
function onUpdate(elapsed)
    easeLerp = 1 - (elapsed * 3.125)
    if camZoomingLua then
    setProperty('camZooming',false)
    setProperty('camGame.zoom',Lerp(getProperty('defaultCamZoom')+Zoom,getProperty('camGame.zoom'),easeLerp))
    setProperty('camHUD.zoom',Lerp(1,getProperty('camHUD.zoom'),easeLerp))
    end
end
function onCreate()
 if cameraZoomOnBeat then
    camZoomingLua=true
 else
    camZoomingLua=false
 end
 bopIntensity=1
 bopFrequency=1
 Zoom=0
end
function onBeatHit()
    if camZoomingLua and bopFrequency~=0 then
        if curBeat % (4 / bopFrequency) == 0 then
            
            setProperty('camGame.zoom',getProperty('camGame.zoom')+0.015 * bopIntensity)
            setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.05 * bopIntensity)
        end
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
 end
