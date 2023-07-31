function onUpdate(elapsed)
    if curStep >= 256 and curStep < 1728 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)

        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 70*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX1,  5, defaultPlayerStrumX1  - 50*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 70*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 50*math.sin((currentBeat+11*0.25)*math.pi), 0.3)
        
        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 70*math.sin((currentBeat+8*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 50*math.sin((currentBeat+9*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 70*math.sin((currentBeat+10*0.25)*math.pi), 0.3)
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 50*math.sin((currentBeat+11*0.25)*math.pi), 0.3)

    end
end