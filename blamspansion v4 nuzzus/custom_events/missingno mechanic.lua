function onEvent(tag, value1, value2)
  	if tag == "missingno mechanic" then
		local isDownscroll = getRandomBool(50)

		for i = 4, 7 do
			if i == 4 then
				setPropertyFromGroup('strumLineNotes', i, 'x', getRandomInt(100, screenWidth / 3))

				if isDownscroll then
					setPropertyFromGroup('strumLineNotes', i, 'y', getRandomInt(screenHeight / 2, screenHeight - 100))
				else
					setPropertyFromGroup('strumLineNotes', i, 'y', getRandomInt(0, 300))
				end
			else
				local xpos = getRandomInt(getPropertyFromGroup('strumLineNotes', i - 1, 'x') + 80, getPropertyFromGroup('strumLineNotes', i - 1, 'x') + 400)

				if xpos > screenWidth - 100 then xpos = screenWidth - 100 end

				setPropertyFromGroup('strumLineNotes', i, 'x', xpos)

				setPropertyFromGroup('strumLineNotes', i, 'y', getRandomInt(getPropertyFromGroup('strumLineNotes', 4, 'y') - 50, getPropertyFromGroup('strumLineNotes', 4, 'y') + 50))
			end

			setPropertyFromGroup('strumLineNotes', i, 'downScroll', isDownscroll)
		end
  	end
end