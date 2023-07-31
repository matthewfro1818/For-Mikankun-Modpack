function onCreate()
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'levelup')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'empty')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'whyareyoucelebratingmydeath')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'whyareyoucelebratingmydeath')
end

function onGameOver()
    setProperty('moveselector.visible', false)
    stopSound('lowhp')
    playSound('PONYTADIES')
end
