function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an EX Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'death' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/HALO'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Make it so Dad doesn't do animation
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	--Check if the note is an EX Note
	if noteType == 'death' then
		playSound('death', 1);
		setProperty('health', 0); --Kill the player if hit
	end
end