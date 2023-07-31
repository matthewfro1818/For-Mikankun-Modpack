function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Opponent Sing' then
			setPropertyFromGroup("unspawnNotes", i, "noAnimation", true)
		end
	end
end

local directions = {'LEFT', 'DOWN', 'UP', 'RIGHT'}

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Opponent Sing' then
		local animToPlay = 'sing'..directions[direction + 1]
		local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix');

		local characterToPlay = 'dad';
		playAnim(characterToPlay, animToPlay..animSuffix, true);
		setProperty(characterToPlay..'.holdTimer', 0);
	end
end -- THANKS KEVIN KUNTZ FOR FIRST SCRIPT