local ofs = 20;
local ofb = 30;
local bfcamX = 816.3;
local bfcamY = 382.5;
local tancamX = 381.15;
local tancamY = 382.5;

function onCreate()
	makeLuaSprite('bg', 'bg', -186, -111.6);
	setScrollFactor('bg', 0, 1);

	makeLuaSprite('dark', 'dark', 0, 0);
	setScrollFactor('dark', 0, 0);

	addLuaSprite('bg', false);
	addLuaSprite('dark', true);
end
function onBeatHit()
	if curBeat > 96 and curBeat < 160 or curBeat > 224 and curBeat < 256 then
		ofs = 30;
		ofb = 35;
	else
		ofs = 20;
		ofb = 30;
	end
end
function onUpdate()
	if mustHitSection == true then
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',bfcamX-ofb,bfcamY)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',bfcamX+ofb,bfcamY)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',bfcamX,bfcamY-ofb)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',bfcamX,bfcamY+ofb)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',bfcamX,bfcamY)
		end
	else if mustHitSection == false then
		if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
			triggerEvent('Camera Follow Pos',tancamX-ofs,tancamY)
		end
		if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
			triggerEvent('Camera Follow Pos',tancamX+ofs,tancamY)
		end
		if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
			triggerEvent('Camera Follow Pos',tancamX,tancamY-ofs)
		end
		if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
			triggerEvent('Camera Follow Pos',tancamX,tancamY+ofs)
		end
		if getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',tancamX,tancamY)
		end
	end
end
end