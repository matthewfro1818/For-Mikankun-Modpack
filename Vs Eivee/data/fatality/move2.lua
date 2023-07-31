function onUpdate(elapsed)
    if curStep >= 1856 and curStep < 2240 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
		
		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 120*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1  - 100*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 120*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 100*math.sin((currentBeat+11*0.25)*math.pi), 0.3)
        
        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 120*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 100*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 120*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 100*math.sin((currentBeat+11*0.25)*math.pi), 0.3)

        noteTweenX(defaultPlayerStrumY0, 4, defaultPlayerStrumY0 - 120*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumY1, 5, defaultPlayerStrumY1  - 100*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumY2, 6, defaultPlayerStrumY2 + 120*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumY3, 7, defaultPlayerStrumY3 + 100*math.sin((currentBeat+11*0.25)*math.pi), 0.3)
        
        noteTweenX(defaultOpponentStrumY0, 0, defaultOpponentStrumY0 - 120*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumY1, 1, defaultOpponentStrumY1 - 100*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumY2, 2, defaultOpponentStrumY2 + 120*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumY3, 3, defaultOpponentStrumY3 + 100*math.sin((currentBeat+11*0.25)*math.pi), 0.3)

    end
end