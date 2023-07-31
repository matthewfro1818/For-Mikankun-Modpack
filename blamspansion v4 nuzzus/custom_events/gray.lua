local show = false
function onCreatePost()
  makeAnimatedLuaSprite('pink', 'pink/pretender/gray!!!!!', -20, -50)
  addAnimationByPrefix('pink', 'hearts', 'Symbol 2000', 24, true)
  setObjectCamera('pink', 'hud')
  setProperty('pink.alpha', 0)
  addLuaSprite('pink', true)
end

function onUpdate()
  if show then
    doTweenAlpha('pinkTw', 'pink', 1, 0.5, 'linear')
  end
  if not show then
    doTweenAlpha('pinkTw', 'pink', 0, 0.5, 'linear')
  end
end

function showIt()
  if show then show = false else show = true end
end

function onEvent(t, v1, v2)
  if t == 'gray' then
    showIt()
  end
end

function onBeatHit()
  if curBeat % 4 == 0 and show == true then
  triggerEvent('Add Camera Zoom', '0.035', '')
  end
end