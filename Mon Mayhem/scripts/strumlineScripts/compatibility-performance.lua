function opponentNoteHit(i)
	if noteType == 'Third Player Note' then
		runHaxeCode([[
			var note = game.notes.members[]]..i..[[];
			var cringeSpr = game.strumLineNotes.members[note.noteData-4];
			var time = 0.15;

			if (note.isSustainNote && !StringTools.endsWith(note.animation.curAnim.name, 'end'))
			{
				time += 0.15;
			}

			cringeSpr.playAnim('static', true);
			game.StrumPlayAnim(true, note.noteData, time);
		]])
	end
end