--Code made by Drawoon_
--if you use this please give me credit
function onCreate()

    setProperty('dad.idleSuffix','-wigglytuff')
    characterDance('dad')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DisabledNotes' then
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-wigglytuff');

			
		end
	end

end