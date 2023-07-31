function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'HD Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HD Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
end

function noteMiss(id, i, noteType, isSustainNote)
	if noteType == 'HD Note' then
		playSound('loss_matt', 1)
		setProperty('health', -255);
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'HD Note' then
	end
end