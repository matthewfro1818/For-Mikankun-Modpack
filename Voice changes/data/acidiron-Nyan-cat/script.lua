local normal = true
local hard = false
local tg = false

function opponentNoteHit()
if normal == true then
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
   end
if hard == true then
    health = getProperty('health')
    if getProperty('health') > 0.5 then
        setProperty('health', health- 0.02);
    end
   end
end

function onCreate()
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeBar.visible', true)
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeTxt.visible', true)
setProperty('iconP1.visible', true)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.alpha', 100)
end

function goodNoteHit()
if tg == true then
            health = getProperty('health')
       if getProperty('health') > 0 then
           setProperty('health', health- -0.01);
   end
end
end

function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') then
tg = true
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeTxt.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.alpha', 0)
end
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TWO') then
tg = false
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeTxt.visible', true)
setProperty('iconP1.visible', true)
setProperty('iconP2.visible', true)
setProperty('scoreTxt.alpha', 100)
end

started = true
songPos = getSongPosition()
started = true

if curBeat >= 0 and curBeat <= 20 then

local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 4, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 5, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 6, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 4, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 5, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 6, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 21 and curBeat <= 41 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 2, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 5, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 6, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 1, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 3, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 0, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 4, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 5, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 3, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 1, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 2, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 6, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 4, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 0, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 42 and curBeat <= 62 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 1, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 2, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 3, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 4, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 5, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 6, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 0, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 1, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 2, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 3, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 4, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 5, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 6, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 0, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 63 and curBeat <= 83 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 2, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 3, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 4, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 5, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 6, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 0, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 1, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 2, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 3, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 4, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 5, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 6, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 0, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 1, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 84 and curBeat <= 104 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 3, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 4, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 5, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 6, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 0, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 1, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 2, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 3, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 4, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 5, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 6, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 0, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 1, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 2, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 105 and curBeat <= 125 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 4, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 5, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 6, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 0, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 1, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 2, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 3, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 4, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 5, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 6, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 0, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 1, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 2, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 3, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 126 and curBeat <= 146 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 5, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 6, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 0, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 1, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 2, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 3, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 4, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 5, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 6, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 0, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 1, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 2, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 3, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 4, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 147 and curBeat <= 167 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 6, defaultOpponentStrumX0 + (math.sin((currentBeat) + 50) * 50), 0.05)
noteTweenX('OpponentStrumX1', 0, defaultOpponentStrumX1 + (math.sin((currentBeat) + 45) * 50), 0.05)
noteTweenX('OpponentStrumX2', 1, defaultOpponentStrumX2 + (math.sin((currentBeat) + 40) * 50), 0.05)
noteTweenX('OpponentStrumX3', 2, defaultOpponentStrumX3 + (math.sin((currentBeat) + 35) * 50), 0.05)
noteTweenX('OpponentStrumX4', 3, defaultOpponentStrumX4 + (math.sin((currentBeat) + 30) * 50), 0.05)
noteTweenX('OpponentStrumX5', 4, defaultOpponentStrumX5 + (math.sin((currentBeat) + 25) * 50), 0.05)
noteTweenX('OpponentStrumX6', 5, defaultOpponentStrumX6 + (math.sin((currentBeat) + 20) * 50), 0.05)
noteTweenY('OpponentStrumY0', 6, defaultOpponentStrumY0 + (math.cos((currentBeat) + 5) * 100), 0.05)
noteTweenY('OpponentStrumY1', 0, defaultOpponentStrumY1 + (math.cos((currentBeat) + 10) * 100), 0.05)
noteTweenY('OpponentStrumY2', 1, defaultOpponentStrumY2 + (math.cos((currentBeat) + 15) * 100), 0.05)
noteTweenY('OpponentStrumY3', 2, defaultOpponentStrumY3 + (math.cos((currentBeat) + 20) * 100), 0.05)
noteTweenY('OpponentStrumY4', 3, defaultOpponentStrumY4 + (math.cos((currentBeat) + 25) * 100), 0.05)
noteTweenY('OpponentStrumY5', 4, defaultOpponentStrumY5 + (math.cos((currentBeat) + 30) * 100), 0.05)
noteTweenY('OpponentStrumY6', 5, defaultOpponentStrumY6 + (math.cos((currentBeat) + 35) * 100), 0.05)
end
if curBeat >= 168 and curBeat <= 197 then
local currentBeat = (songPos / 1000)*(bpm/60)
noteTweenX('OpponentStrumX0', 4, defaultOpponentStrumX0)
noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1)
noteTweenX('OpponentStrumX2', 6, defaultOpponentStrumX2)
noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3)
noteTweenX('OpponentStrumX4', 1, defaultOpponentStrumX4)
noteTweenX('OpponentStrumX5', 5, defaultOpponentStrumX5)
noteTweenX('OpponentStrumX6', 3, defaultOpponentStrumX6)
noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY4', 4, defaultOpponentStrumY4 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY5', 5, defaultOpponentStrumY5 + (math.cos((currentBeat) + 500) * 100), 0.05)
noteTweenY('OpponentStrumY6', 6, defaultOpponentStrumY6 + (math.cos((currentBeat) + 500) * 100), 0.05)
end
if curBeat >= 198 then
normal = false
hard = true
end
if curBeat >= 322 then
normal = true
hard = false
end
if curBeat >= 350 then
normal = false
hard = true
end
local currentBeat = (songPos/4000)*(curBpm/60)
if curBeat >= 198 and curBeat <= 322 then
noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
noteTweenX('OpponentStrumX4', 4, defaultOpponentStrumX4 + (math.sin((currentBeat) + 0) * 60), 0.05)
noteTweenX('OpponentStrumX5', 5, defaultOpponentStrumX5 + (math.sin((currentBeat) + 16) * 60), 0.05)
noteTweenX('OpponentStrumX6', 6, defaultOpponentStrumX6 + (math.sin((currentBeat) + 0) * 60), 0.05)
noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 16) * 60), 0.05)
noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 0) * 60), 0.05)
noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 16) * 60), 0.05)
noteTweenY('OpponentStrumY4', 4, defaultOpponentStrumY4 + (math.cos((currentBeat) + 0) * 60), 0.05)
noteTweenY('OpponentStrumY5', 5, defaultOpponentStrumY5 + (math.cos((currentBeat) + 16) * 60), 0.05)
noteTweenY('OpponentStrumY6', 6, defaultOpponentStrumY6 + (math.cos((currentBeat) + 0) * 60), 0.05)
end
if curBeat >= 322 and curBeat <= 454 then
noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX4', 4, defaultOpponentStrumX4 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX5', 5, defaultOpponentStrumX5 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX6', 6, defaultOpponentStrumX6 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY4', 4, defaultOpponentStrumY4 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY5', 5, defaultOpponentStrumY5 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY6', 6, defaultOpponentStrumY6 + (math.cos((currentBeat) + 32) * 60), 0.05)
end
if curBeat >= 455 and curBeat <= 1991 then
noteTweenX('OpponentStrumX0', 2, defaultOpponentStrumX0 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX1', 4, defaultOpponentStrumX1 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX2', 6, defaultOpponentStrumX2 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX3', 0, defaultOpponentStrumX3 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX4', 1, defaultOpponentStrumX4 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenX('OpponentStrumX5', 3, defaultOpponentStrumX5 + (math.sin((currentBeat) + 64) * 120), 0.05)
noteTweenX('OpponentStrumX6', 5, defaultOpponentStrumX6 + (math.sin((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY4', 4, defaultOpponentStrumY4 + (math.cos((currentBeat) + 32) * 60), 0.05)
noteTweenY('OpponentStrumY5', 5, defaultOpponentStrumY5 + (math.cos((currentBeat) + 64) * 120), 0.05)
noteTweenY('OpponentStrumY6', 6, defaultOpponentStrumY6 + (math.cos((currentBeat) + 32) * 60), 0.05)
end
end