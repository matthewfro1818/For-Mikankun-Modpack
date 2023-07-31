local cursed = 0

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Withered Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Withered Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'WITHEREDNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Withered Note' then
		characterPlayAnim('bf', 'hurt', true);
		addMisses('1');
		cursed = cursed + 0.05
		runTimer('curseDrain', 7.5, 1);
	end
end

function onUpdate( elapsed )
	if cursed > 0 then
		setProperty('health', getProperty('health')-cursed*elapsed);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'curseDrain' then
	    cursed = 0
	end
end
