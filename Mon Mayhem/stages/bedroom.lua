sprite = 'finalchocoballs' --name of the image you want moving in the background
size = 6000 --number of pixels from left to right
startX = -400 --where you want it to be from left to right
startY = -850 --where you want it to be from bottom to top
duration = 200 --how long it takes to scroll from one side of the screen to the other

function onCreate()
	-- background
	makeLuaSprite(sprite .. '1', sprite, startX, startY)
	addLuaSprite(sprite .. '1', false)
	makeLuaSprite(sprite .. '2', sprite, startX + size, startY)
	scaleObject(sprite, 1, 1);
	addLuaSprite(sprite .. '2', false)
	scrollA()
	
	makeLuaSprite('room', 'room', 250, -10);
	setScrollFactor('room', 0.9, 0.9);
	scaleObject('room', 1.2, 1.2);
	addLuaSprite('room', false);

	makeAnimatedLuaSprite('roomates', 'roomates', 600, 350);
	luaSpriteAddAnimationByPrefix('roomates', 'roomates.xml', 'bg Buddies', 24, true)
	setScrollFactor('roomates', 0.9, 0.9);
	scaleObject('roomates', 1.2, 1.2);
	addLuaSprite('roomates', false);

	makeLuaSprite('bed_space', 'bed_space', 250, -10);
	setScrollFactor('bed_space', 0.9, 0.9);
	scaleObject('bed_space', 1.2, 1.2);
	addLuaSprite('bed_space', false);
	
	makeLuaSprite('bed', 'bed', 250, -10);
	setScrollFactor('bed', 0.9, 0.9);
	scaleObject('bed', 1.2, 1.2);
	addLuaSprite('bed', false);

	makeLuaSprite('dark', 'dark', 0, -10)
    setObjectCamera('dark', 'hud')
    addLuaSprite('dark')

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
