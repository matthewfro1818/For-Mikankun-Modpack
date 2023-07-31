function opponentNoteHit()
 if curStep >= 383 and curStep < 9999 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
           health = getProperty('health')
        if getProperty('health') > 0.1 then
           setProperty('health', health- 0.05);
	    end
	end
end
