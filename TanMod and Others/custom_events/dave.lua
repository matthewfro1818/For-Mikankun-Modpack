-- helo
local cracknum = 0 -- just so you dont have multiple screen cracks overriding eachother
local damage = 0
function onEvent(name, value1, value2)
	if name == 'dave' then
		damage = tonumber(value1);
		if damage < 0 then
			damage = 0;
		end
        
        
        
        characterPlayAnim('dad', 'attack', true)
        cameraShake('camGame',0.05,0.1)
        cameraShake('camHUD',0.05,0.1)
        cameraShake('camOther',0.05,0.1)
        local hp = getProperty('health')
        damage = damage * 0.01
        setProperty('health', hp - damage)
        
        local x = math.random(screenWidth - 200)
        local y = math.random(screenHeight - 200)
        --debugPrint('Spawned Crack at x:'..x,' y:'..y, ' with ID of '..cracknum)
        --debugPrint('Damaged BF for '..tonumber(value1),' Actual Damage:'..damage,' New HP: '..getProperty('health'))
        makeLuaSprite('crack'..cracknum, 'fx/crack'..math.random(1,9),x,y )
        scaleObject('crack'..cracknum,math.random(0.8,1),math.random(0.8,1.2))
        playSound('gunfire', 1,'pew for'..cracknum)
addLuaSprite('crack'..cracknum, true)
setObjectCamera('crack'..cracknum, 'camOther')

		cracknum = cracknum + 1
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end