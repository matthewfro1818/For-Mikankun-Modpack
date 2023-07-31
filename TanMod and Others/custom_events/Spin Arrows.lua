-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Spin Arrows' then
		angle = tonumber(value1);
			end
		duration = tonumber(value2);
			for note=0,7 do
            noteTweenAngle('speen'..note, note, angle, duration, 'quintOut')
		end
		--debugPrint('Event triggered: ', name, angle, duration);
	end