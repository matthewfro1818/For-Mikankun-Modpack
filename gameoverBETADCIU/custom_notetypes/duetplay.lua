function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'duetplay' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
		        --setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
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

	if noteType == 'duetplay' then

		if noteData == 0 then
			--characterPlayAnim('bf','singLEFT',true)
			characterPlayAnim('gf','singLEFT',true)
		end
		if noteData == 1 then
			--characterPlayAnim('bf','singDOWN',true)
			characterPlayAnim('gf','singDOWN',true)
		end
		if noteData == 2 then
			--characterPlayAnim('bf','singUP',true)
			characterPlayAnim('gf','singUP',true)
		end
		if noteData == 3 then
			--characterPlayAnim('bf','singRIGHT',true)
			characterPlayAnim('gf','singRIGHT',true)
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)

	if noteType == 'duetplay' then

		if noteData == 0 then
			--characterPlayAnim('bf','singLEFT',true)
			characterPlayAnim('gf','singLEFTmiss',true)
		end
		if noteData == 1 then
			--characterPlayAnim('bf','singDOWN',true)
			characterPlayAnim('gf','singDOWNmiss',true)
		end
		if noteData == 2 then
			--characterPlayAnim('bf','singUP',true)
			characterPlayAnim('gf','singUPmiss',true)
		end
		if noteData == 3 then
			--characterPlayAnim('bf','singRIGHT',true)
			characterPlayAnim('gf','singRIGHTmiss',true)
		end
	end
end