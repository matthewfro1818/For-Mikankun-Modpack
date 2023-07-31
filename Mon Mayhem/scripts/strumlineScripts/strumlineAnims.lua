function toBool(str)
	return str:lower() == 'true';
end

--[[function tweenNoteScale(object, scale)
	doTweenX('tweenNoteScaleX'..object, getProperty('strumLineNotes.members['..object..']')..'.scale', scale, 1, 'sineInOut')
	doTweenY('tweenNoteScaleY'..object, getProperty('strumLineNotes.members['..object..']')..'.scale', scale, 1, 'sineInOut')
end--]]

local function changePropertyFromGroup(group, item, variable, amount)
	return setPropertyFromGroup(group, item, variable, getPropertyFromGroup(group, item, variable) + amount);
end

local function moveStrum(strumID, centerPos, scale, tween)
	scale = scale or 0.7;
	tween = tween or {doTween=false};

	for i=4*strumID, 4*strumID+3 do
		if centerPos.x ~= nil then
			if tween.doTween then noteTweenX('tweenNoteX'..i, i, centerPos.x - (160 * scale) / 2 + (i%4 - 3 / 2) * (160 * scale), 1, tween.tweenName or 'sineInOut');
			else setPropertyFromGroup('strumLineNotes', i, 'x', centerPos.x - (160 * scale) / 2 + (i%4 - 3 / 2) * (160 * scale)) end;
		end

		if centerPos.y ~= nil then 
			if tween.doTween then noteTweenY('y'..tween.tweenYSuffix..i, i, centerPos.y, 1, tween.tweenName or 'sineInOut');
			else setPropertyFromGroup('strumLineNotes', i, 'y', centerPos.y) end;
		end
	end
end

local verticalCheck = {["middle"] = true};





local tweens = {
	['left'] = function(strumID, notReverse) -- Use notReverse for horizontal tweens
		if strumID > 1 then strumID = strumID - (strumID + 1) end
		return notReverse and screenWidth/2 + (screenWidth/3 * strumID) or screenWidth/2 + ((screenWidth/4) * (strumID*2-1));
	end,
	
	['right'] = function(strumID, notReverse)
		return notReverse and screenWidth/2 + ((screenWidth/3) * (strumID-1)) or screenWidth/2 + ((screenWidth/4) * (strumID*2-1));
	end,
	['middle'] = function(strumID, notReverse)
		if strumID > 1 then
			return screenWidth / 2;
		else
			local factor = notReverse and 3 or 4;
			if boyfriendName == 'pikachu2' then
				factor = -3
			end
			return screenWidth/2 + ((screenWidth/factor) * ((strumID * 2) - 1)); -- thanks chatgpt lmao
		end
	end
}

function returnAnim(name, startAnimated)
	if startAnimated then return tweenAnim(name, true) end

	moveStrum(0, {x = tweens[name](0, true)}, 0.65);
	moveStrum(2, {x = tweens[name](1, true)}, 0.65);
	moveStrum(1, {x = tweens[name](2, true)}, 0.65);
end

function tweenAnim(name, notReverse)

	moveStrum(0, {x = tweens[name](0, notReverse)}, 0.65, {doTween=true});
	moveStrum(2, {x = tweens[name](1, notReverse)}, 0.65, {doTween=true});

	if notReverse then moveStrum(1, {x = tweens[name](2, false), y = getProperty('strumLine.y')}) end;

	if verticalCheck[name] then
		if notReverse then moveStrum(1, {y = getProperty('strumLine.y') + 150 * (downscroll and 1 or -1)}) end;
		moveStrum(1, {x = tweens[name](2, notReverse), y = getProperty('strumLine.y') + 150 * (notReverse and 0 or 1) * (downscroll and 1 or -1)}, 0.65, 
					{doTween=true, tweenYSuffix = notReverse and "Start" or "End"});
	else
		moveStrum(1, {x = tweens[name](2, notReverse)}, 0.65, {doTween=true});
	end;
end

function onEvent(name, value1, value2)
	if name == 'Show Strums' then
		tweenAnim(value2, toBool(value1))
	end
end

function onTweenCompleted(tag)
	if tag:sub(1, 4) == 'yEnd' then
		for i=4, 7 do
			changePropertyFromGroup('strumLineNotes', i, 'x', -screenWidth);
		end
	end

	--[[if tag:sub(1, 14) == 'tweenNoteScale' then
		local stupid = tag:sub(-2);
		if not tonumber(stupid) then
			stupid = stupid:sub(-1);
		end

		updateHitboxFromGroup('strumLineNotes', tonumber(stupid))
	end--]]
end