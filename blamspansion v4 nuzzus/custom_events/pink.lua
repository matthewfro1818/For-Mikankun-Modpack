local show = false
function onCreatePost()
  makeAnimatedLuaSprite('pink', 'pink/hearts', -30, 0)
  addAnimationByPrefix('pink', 'hearts', 'Symbol 2000', 24, true)
  setObjectCamera('pink', 'hud')
  setProperty('pink.alpha', 0)
  addLuaSprite('pink', true)

  makeLuaSprite('pink2', 'pink/vignette', -500,-500)
  addLuaSprite('pink2')
  scaleObject('pink2', 5, 5)
  setObjectCamera('pink2', 'hud')
  setBlendMode('pink2', 'add')

  makeLuaSprite('pink22', 'pink/vignette2', 0,0)
  addLuaSprite('pink22')
  scaleObject('pink22', 1, 1)
  setObjectCamera('pink22', 'other')
  setBlendMode('pink22', 'add')
end

function onUpdate()
  if show then
    doTweenAlpha('pinkTw', 'pink', 1, 0.5, 'linear')
    doTweenAlpha('pinkTw2', 'pink2', 0.5, 0.5, 'linear')
    doTweenAlpha('woah3', 'part' .. f, 1, 0.5, 'linear')
    doTweenAlpha('woah7', 'part' .. f, 1, 0.1, 'linear')
  end
  if not show then
    doTweenAlpha('pinkTw', 'pink', 0, 0.5, 'linear')
    doTweenAlpha('pinkTw2', 'pink2', 0, 0.5, 'linear')
    doTweenAlpha('pinkTw22', 'pink22', 0, 0.5, 'linear')
    doTweenAlpha('woah4', 'part' .. f, 0, 0.5, 'linear')
  end
end

function showIt()
  if show then show = false else show = true end
end

function onEvent(t, v1, v2)
  if t == 'pink' then
    showIt()
  end
end

function onBeatHit()
  if curBeat % 2 == 0 and show == true then
  doTweenAlpha('pinkTw23', 'pink22', 0, 0.5, 'linear')
  triggerEvent('Add Camera Zoom', '0.035', '')

  elseif curBeat % 1 == 0 and show == true then 
  doTweenAlpha('pinkTw24', 'pink22', 1, 0.1, 'linear')
  triggerEvent('Add Camera Zoom', '0.035', '')
  end
end

function onStepHit()
  Particle()
end
  f = 1

  function Particle()
  songPos = getSongPosition()
  currentBeat = (songPos/250)
    f = f + 1
    sus = math.random(10, 1500)
    sus2 = math.random(10, 1500)
    makeLuaSprite('part' .. f, 'pink/littleheart', math.random(-200, 1200), 1600)
    doTweenY(sus, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 6)
    doTweenX(sus2, 'part' .. f, -900*math.sin((currentBeat+1*0.1)*math.pi), 6)
    scaleObject('part' .. f, 1.5, 1.5);
    addLuaSprite('part' .. f, true)
    doTweenAlpha('woah5', 'part' .. f, 0, 0.1, 'linear')
    if f >= 50 then
    f = 1
    end
  end