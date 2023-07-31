function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'riza-don' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/fuegoflechas'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'riza-don' then
		setProperty('health', -0.3);
		playSound('Frame', 0.8);
	end
end