function onEvent(name, value1, value2) 
if name == 'Celebi ShitLOL' then
	drainValue = tonumber(value1);
	curHealth = getProperty('health');
		if 0 > curHealth - (value1) then
		setProperty('health', 0);
		end
	end
end