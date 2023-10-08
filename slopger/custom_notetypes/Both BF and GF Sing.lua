function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Both BF and GF Sing' then
			--bruj
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
	if noteType == 'Both BF and GF Sing' then
		local animToPlay = 'what';
		if noteData == 0 then
			animToPlay = 'singLEFT';
		end
		if noteData == 1 then
			animToPlay = 'singDOWN';
		end
		if noteData == 2 then
			animToPlay = 'singUP';
		end
		if noteData == 3 then
			animToPlay = 'singRIGHT';
		end
		setProperty('gf.specialAnim', true)
		characterPlayAnim('gf', animToPlay, true)
		setProperty('gf.holdTimer', 0)
		-- put something here if you want
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Both BF and GF Sing' then
		-- put something here if you want
	end
end