function onUpdate(elapsed)
if curSteo == 0 then
started = true
end
songPos = getSongPosition()
local currentBeat = (songPos/1200)*(curBpm/80)

doTweenY('aflacmove', 'aflac', 690 - -250*math.sin((currentBeat+60*120)*math.pi), 1.3)

doTweenX('aflacmoveX', 'aflac', -400 - 250 *math.sin((currentBeat+60*120)*math.pi), 1.9) 

doTweenY('aflacmove', 'amor', 450 - 50*math.sin((currentBeat+20*20)*math.pi), 1.3)

doTweenX('aflacmoveX', 'amor', -400 - 50 *math.sin((currentBeat+20*120)*math.pi), 1.9) 

doTweenX('disruptor2', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+20*20)*math.pi), 1.1)

doTweenY('disruptor2Y', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+20*20)*math.pi), 1.5)

end