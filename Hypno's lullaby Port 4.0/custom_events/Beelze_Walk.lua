--Made by Drawoon_
--If you using this code in some mods give me credits
function onEvent(eventName, value1, value2)
    if eventName=='Beelze_Walk' then
		playAnim('dad','Walk',true)
	    setProperty('dad.specialAnim',true)	
    end
end
function onUpdate(elapsed)
    if getProperty('dad.animation.curAnim.finished') then 
		if getProperty('dad.animation.curAnim.name')=='Walk' then
			setProperty('defaultCamZoom',0.65+0.35)
			playAnim('dad','Laugh',true)
	        setProperty('dad.specialAnim',true)	
		elseif getProperty('dad.animation.curAnim.name')=='Laugh' then
			setProperty('defaultCamZoom',0.65)
			setProperty('dad.idleSuffix','-alt')	
            addLuaSprite('ContractBF', true)
		end
	
	end
end