function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/100)

    doTweenY(dadTweenY, 'dad', -250-150*math.sin((currentBeat*0.25)*math.pi),1)

  end

end
