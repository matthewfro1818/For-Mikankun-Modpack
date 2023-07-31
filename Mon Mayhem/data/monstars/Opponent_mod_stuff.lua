function onCreatePost()
	if boyfriendName == 'pikachu2' then
		--Player Notes

		noteTweenX(defaultPlayerStrumX0, 8, defaultPlayerStrumX0 - 650, 0.025)
		noteTweenX(defaultPlayerStrumX1, 9, defaultPlayerStrumX1 - 650, 0.025)
		noteTweenX(defaultPlayerStrumX2, 10, defaultPlayerStrumX2 - 650, 0.025)
		noteTweenX(defaultPlayerStrumX3, 11, defaultPlayerStrumX3 - 650, 0.025)

		--Opponent Notes

		noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 650, 0.025)
		noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 650, 0.025)
		noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 650, 0.025)
		noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 650, 0.025)
	end
end
function onUpdatePost()
	if boyfriendName == 'pikachu2' then
     P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
     P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
     setProperty('iconP1.x',P1Mult - 110)
     setProperty('iconP1.origin.x',240)
     setProperty('iconP1.flipX',true)
     setProperty('iconP2.x',P2Mult + 110)
     setProperty('iconP2.origin.x',-100)
     setProperty('iconP2.flipX',true)
     setProperty('healthBar.flipX',true)
	end
end