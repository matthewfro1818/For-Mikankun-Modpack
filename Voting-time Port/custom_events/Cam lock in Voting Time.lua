local DadHealth=''
local BfHealth=''
local JelqerHealth=''
local MadgusHealth=''
function onEvent(eventName, value1, value2)
    if eventName=='Cam lock in Voting Time' then
        if value1=='in' then
            setProperty('defaultCamZoom',1.2)
            setProperty('camGame.zoom',1.2)
            if value2=='dad' then
                setProperty('camFollowPos.x',460)
                setProperty('camFollowPos.y',700)
                setGlobalFromScript('data/CameraMove','ManualPos',{460, 700})
                SetIcon('iconP2',getProperty('dad.healthIcon'))
                setHealthBarColors(DadHealth,BfHealth)
                setTextColor('botplayTxt',DadHealth)
                setTextColor('scoreTxt',DadHealth)
            else
                setProperty('camFollowPos.x',1470)
                setProperty('camFollowPos.y',700)
                setGlobalFromScript('data/CameraMove','ManualPos',{1470, 700})
                setTextColor('botplayTxt',BfHealth)
                setTextColor('scoreTxt',BfHealth)

            end
            setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        elseif value1=='close' then
            setProperty('defaultCamZoom',1.25)
            setProperty('camGame.zoom',1.25)
            if value2=='dad' then
                setProperty('camFollowPos.x',480)
                setProperty('camFollowPos.y',680)
                setGlobalFromScript('data/CameraMove','ManualPos',{480, 680})
                SetIcon('iconP2',getProperty('Opponent2.healthIcon'))
                setHealthBarColors(JelqerHealth,BfHealth)
                setTextColor('botplayTxt',JelqerHealth)
                setTextColor('scoreTxt',JelqerHealth)
            else
                setProperty('camFollowPos.x',1450)
                setProperty('camFollowPos.y',680)
                setGlobalFromScript('data/CameraMove','ManualPos',{1450, 680})
                SetIcon('iconP2',getProperty('Player2.healthIcon'))
                setHealthBarColors(MadgusHealth,BfHealth)
                setTextColor('botplayTxt',MadgusHealth)
                setTextColor('scoreTxt',MadgusHealth)
            end
            setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        else
            setProperty('defaultCamZoom',0.7)
            setProperty('camGame.zoom',0.7)
            setProperty('camFollowPos.x',960)
            setProperty('camFollowPos.y',540)
            setGlobalFromScript('data/CameraMove','ManualPos',{960, 540})
            setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        end
    end
end
function onCreatePost()
    local CharacterList={'boyfriend','dad','Player2','Opponent2'}
    for i=1,#CharacterList do
        local Color=getProperty(CharacterList[i]..'.healthColorArray')
        if i==1 then
            BfHealth=getColorFromRGB(Color[1],Color[2],Color[3],false)
        elseif i==2 then
            DadHealth=getColorFromRGB(Color[1],Color[2],Color[3],false)
        elseif i==3 then
            MadgusHealth=getColorFromRGB(Color[1],Color[2],Color[3],false)
        else
            JelqerHealth=getColorFromRGB(Color[1],Color[2],Color[3],false)
        end
    end
end
function SetIcon(icon,newIcon)
    runHaxeCode([[
        game.]]..icon..[[.changeIcon("]]..newIcon..[[");
    ]])
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end

