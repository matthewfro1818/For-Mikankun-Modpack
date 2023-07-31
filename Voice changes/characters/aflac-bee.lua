function onUpdate(elapsed)    if curStep == 0 then

started = true

end

songPos = getSongPosition()

local currentBeat = (songPos/2500)*(curBpm/60)

doTweenY('opponentmove', 'bee', 450 - 100*math.sin((currentBeat+20*20)*math.pi), 1.5)

doTweenX('opponentmoveX', 'bee', -750 - -100 *math.sin((currentBeat+20*20)*math.pi), 1.1)

doTweenY('aflacmove', 'aflac', 690 - -500*math.sin((currentBeat+120*360)*math.pi), 1.3)

doTweenX('aflacmoveX', 'aflac', -400 - 500 *math.sin((currentBeat+120*360)*math.pi), 1.9) 

doTweenX('disruptor2', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+20*20)*math.pi), 1.1)

doTweenY('disruptor2Y', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+20*20)*math.pi), 1.5)

end

