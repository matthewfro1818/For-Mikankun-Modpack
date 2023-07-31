local keepScroll = false
function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'cantsee'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'pzzz'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'no'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'no'); --put in mods/music/
end

function noteMiss(id, direction, noteType, isSustainNote)
setProperty('health', 0)
end
function noteMissPress(direction)
setProperty('health', 0)
end
function onUpdate(elapsed)
-- This is how I do it
-- Alpha is +16
-- X is +0
-- Y is +8
-- Angle is +24

-- Opponent arrows: 0-3
-- Player arrows: 4-7
-- hide and show the opponents arrows
for i=0,3 do
-- Alpha is 0 (0 being invisible)
noteTweenAlpha(i+16, i, math.floor(curStep/9999), 0.001)
end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.015);
    end
end