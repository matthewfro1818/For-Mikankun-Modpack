--Made my Sp4rk1ngc0m3t -- You are pro dude :D
--Put this into a stage lua, if you understand how making a stage lua works there will be no issues
--if you are seeing the edge of the background at times it is recommended that you just increase the size of the image
sprite = 'fireloop' --name of the image you want moving in the background
size = -1280 --number of pixels from left to right
startX = 0 --where you want it to be from left to right
startY = 150 --where you want it to be from bottom to top
duration = 2 --how long it takes to scroll from one side of the screen to the other


function onCreate()
setProperty('sprite.antialiasing', false);
makeAnimatedLuaSprite(sprite .. '1', sprite, startX, startY)
addAnimationByPrefix(sprite .. '1', 'fireloop', 'fireloop', 8, true)
objectPlayAnimation(sprite .. '1', 'fireloop')
addLuaSprite(sprite .. '1', false)
makeAnimatedLuaSprite(sprite .. '2', sprite, startX, startY)
addAnimationByPrefix(sprite .. '2', 'fireloop', 'fireloop', 8, true)
objectPlayAnimation(sprite .. '2', 'fireloop')
addLuaSprite(sprite .. '2', false)
scaleObject(sprite .. '1', 0, 0)
scaleObject(sprite .. '2', 0, 0)
setObjectOrder(sprite .. '1', getObjectOrder('dadGroup')-8.2)
setObjectOrder(sprite .. '2', getObjectOrder('dadGroup')-8.2)
scrollA()
end


function scrollA()
doTweenX(sprite .. '1move',sprite .. '1', startX - size, duration)
doTweenX(sprite .. '2move',sprite .. '2', startX, duration)
end

function onTweenCompleted(tag)
if tag == (sprite .. '2move') then
scrollB()
end
if tag == (sprite .. '2move2') then
scrollA()
end
end
function scrollB()
doTweenX(sprite .. '1move2',sprite .. '1', startX, 0.001)
doTweenX(sprite .. '2move2',sprite .. '2', startX + size, 0.001)
end

function onStepHit()
	if curStep <= 2174 and curStep >= 2047 then
		scaleObject(sprite .. '1', 4, 4)
		scaleObject(sprite .. '2', 4, 4)
	else
		scaleObject(sprite .. '1', 0, 0)
		scaleObject(sprite .. '2', 0, 0)
	end
end