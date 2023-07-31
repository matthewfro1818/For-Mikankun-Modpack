--Code made by Drawoon_
--if you use this please give me credit
local startReverse=0
local doReverse=false
function onEvent(eventName, value1, value2)
    if eventName=='Pow' and not isPussyMode then
        startReverse=0
        doReverse=false
        --playAnim('MXArms','Hit1',true)
        playSound('HandUp',1)
        playAnim('dad','Hit1',true)
        setProperty('dad.specialAnim',true)
    end
end
function onCreate()
    initSaveData('HypnosPref')
    isPussyMode=getDataFromSave('HypnosPref','Pussy mode',false)
    precacheSound('HandUp')
    precacheSound('POW')
    
end
function onSongStart()
    for i=0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'mustPress') then
            if getPropertyFromGroup('unspawnNotes',i,'noteType')=='MX' then
                isPussyMode=true
            end
            break
        end
    end
end
function onUpdate(elapsed)
    if getProperty('dad.animation.curAnim.finished') and getProperty('dad.animation.curAnim.name')=='Hit1' then
        playAnim('dad','Hit2',true)
        setProperty('dad.specialAnim',true)
        playAnim('MXArms','Hit2',true)
        setProperty('POW.visible',false)
        dropStart()
    end
    if  getProperty('dad.animation.curAnim.name')~='Hit2' then
        setProperty('POW.visible',true)
    end   
    if doReverse then
        local realbeats = (getSongPosition() / 1000) * (curBpm / 60)

        if startReverse==0 then
            startReverse = realbeats
            for i=0,3 do
                setPropertyFromGroup('playerStrums',i,'downScroll',not getPropertyFromGroup('playerStrums',i,'downScroll'))
            end
        end
        local perc=easeOutBounce((realbeats - startReverse) / 2.5)
        
        if perc<1 then
            for i=0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes',i,'mustPress') then
                    setPropertyFromGroup('notes',i,'multSpeed',Lerp(-1,1,perc))
                    if stringEndsWith(getPropertyFromGroup('notes',i,'animation.curAnim.name'),'end') then
                        setPropertyFromGroup('notes',i,'flipY',getPropertyFromGroup('playerStrums',getPropertyFromGroup('notes',i,'noteData'),'downScroll'))
                    end
                end
            end
            local multi=1
            for i=0,3 do
                local localPerc = perc * multi
                if localPerc > 1 then localPerc=1 end
                if getPropertyFromGroup('playerStrums',i,'downScroll') then
                    setPropertyFromGroup('playerStrums',i,'y',Lerp(50,screenHeight- 150, localPerc))
                else
                    setPropertyFromGroup('playerStrums',i,'y',Lerp(screenHeight- 150,50, localPerc))
                end
                multi=multi+0.05
                
            end
        end  
        for i=0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes',i,'mustPress') then
                if getPropertyFromGroup('notes',i,'isSustainNote') then
                    setPropertyFromGroup('notes',i,'flipY',getPropertyFromGroup('playerStrums',getPropertyFromGroup('notes',i,'noteData'),'downScroll'))
                end
            end
        end
    end
end

function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function easeOutBounce(x)
	local n1 = 7.5625
	local d1 = 2.75
	
	if x < 1 / d1 then
		return n1 * x * x
    end
	if x < 2 / d1 then
		return n1 * (x - 1.5 / d1) * (x - 1.5 / d1) + 0.75
    end
	if x < 2.5 / d1 then
		return n1 * (x - 2.25 / d1) * (x - 2.25 / d1) + 0.9375
    end
	return n1 * (x - 2.625 / d1) * (x - 2.625 / d1) + 0.984375
end
function dropStart()
    playSound('POW',1)
    cameraShake('game',0.05,0.5)
    doReverse=true
end




	

    


