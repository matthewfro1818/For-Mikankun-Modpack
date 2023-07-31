-- Event notes hooks
function onEvent(name,value1,value2)
	reversed = tonumber(value1)
	speed = tonumber(value2)
	if name == 'Arrow flip' then
		for i = hikakin_mania, hikakin_mania+hikakin_mania-1 do
			if reversed == 1 then
				if hikakin_mania == 6 then
					noteTweenX('0', 6, defaultPlayerStrumX0, speed, 'smoothStepOut')
					noteTweenX('1', 7, defaultPlayerStrumX1 , speed, 'smoothStepOut')
					noteTweenX('2', 8, defaultPlayerStrumX2, speed, 'smoothStepOut')
					noteTweenX('3', 9, defaultPlayerStrumX3, speed, 'smoothStepOut')
					noteTweenX('4', 10, defaultPlayerStrumX4, speed, 'smoothStepOut')
					noteTweenX('5', 11, defaultPlayerStrumX5, speed, 'smoothStepOut')
				end
				if hikakin_mania == 7 then
					noteTweenX('0', 7, defaultPlayerStrumX0, speed, 'smoothStepOut')
					noteTweenX('1', 8, defaultPlayerStrumX1 , speed, 'smoothStepOut')
					noteTweenX('2', 9, defaultPlayerStrumX2, speed, 'smoothStepOut')
					noteTweenX('4', 11, defaultPlayerStrumX4, speed, 'smoothStepOut')
					noteTweenX('5', 12, defaultPlayerStrumX5, speed, 'smoothStepOut')
					noteTweenX('6', 13, defaultPlayerStrumX6, speed, 'smoothStepOut')
				end
			else
				if hikakin_mania == 6 then
					noteTweenX('0', 6, defaultPlayerStrumX5, speed, 'smoothStepOut')
					noteTweenX('1', 7, defaultPlayerStrumX4 , speed, 'smoothStepOut')
					noteTweenX('2', 8, defaultPlayerStrumX3, speed, 'smoothStepOut')
					noteTweenX('3', 9, defaultPlayerStrumX2, speed, 'smoothStepOut')
					noteTweenX('4', 10, defaultPlayerStrumX1, speed, 'smoothStepOut')
					noteTweenX('5', 11, defaultPlayerStrumX0, speed, 'smoothStepOut')
				end
				if hikakin_mania == 7 then
					noteTweenX('0', 7, defaultPlayerStrumX6, speed, 'smoothStepOut')
					noteTweenX('1', 8, defaultPlayerStrumX5 , speed, 'smoothStepOut')
					noteTweenX('2', 9, defaultPlayerStrumX4, speed, 'smoothStepOut')
					noteTweenX('4', 11, defaultPlayerStrumX2, speed, 'smoothStepOut')
					noteTweenX('5', 12, defaultPlayerStrumX1, speed, 'smoothStepOut')
					noteTweenX('6', 13, defaultPlayerStrumX0, speed, 'smoothStepOut')
				end
			end
		end
	end
	if name == 'Change Mania' then
		hikakin_mania = tonumber(value1+1)
	end
end


