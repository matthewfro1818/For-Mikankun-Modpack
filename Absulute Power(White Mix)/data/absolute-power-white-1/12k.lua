function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Withered Note
        if mania == 7 then
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') >= 4 then
                setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress')); --Change mustPress
                setPropertyFromGroup('unspawnNotes', i, 'opponentSing', not getPropertyFromGroup('unspawnNotes', i, 'opponentSing')); --Change mustPress
                setPropertyFromGroup('unspawnNotes', i, 'noteData', getPropertyFromGroup('unspawnNotes', i, 'noteData') - 4); --Change noteData
            end
            if getPropertyFromGroup('unspawnNotes', i, 'character') == 1 then
                if getPropertyFromGroup('unspawnNotes', i, 'noteData') <= 1 then
                    setPropertyFromGroup('unspawnNotes', i, 'noteData', getPropertyFromGroup('unspawnNotes', i, 'noteData') + 4); --Change noteData
                end
            elseif getPropertyFromGroup('unspawnNotes', i, 'character') == 2 then
                setPropertyFromGroup('unspawnNotes', i, 'noteData', getPropertyFromGroup('unspawnNotes', i, 'noteData') + 4); --Change noteData
            end
        end
        if mania == 11 then
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') >= 4 then
                setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress')); --Change mustPress
                setPropertyFromGroup('unspawnNotes', i, 'opponentSing', not getPropertyFromGroup('unspawnNotes', i, 'opponentSing')); --Change mustPress
                setPropertyFromGroup('unspawnNotes', i, 'noteData', getPropertyFromGroup('unspawnNotes', i, 'noteData') - 4); --Change noteData
            end
            setPropertyFromGroup('unspawnNotes', i, 'noteData', getPropertyFromGroup('unspawnNotes', i, 'noteData') + (4 * getPropertyFromGroup('unspawnNotes', i, 'character'))); --Change noteData
        end
	end
	--debugPrint('Script started!')
end