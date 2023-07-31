function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Tricky Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Tricky_Note'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Tricky Note' then
			setProperty('health', -255);
		characterPlayAnim('boyfriend', 'hurt', true);
		playSound('loss_shaggy', 1)
	end
end
end
