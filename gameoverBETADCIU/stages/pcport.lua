SonicUI = false
LockGame = false
wallfix = true

isChase = false
TailsMomento = false
jumpedBrick = false
jumpedGap1 = false
jumpedGap2 = false
jumpedPipe = false

jumpedGapB = false
jumpedGapB2 = false
jumpedStairs = false
jumpedStairs2 = false
jumpedGap3 = false
jumpedGap3M = false
jumpedGap4M = false
jumpedGap4 = false
jumpTriggers = {}

chaseBGX = 0

mxLegsHighY = 0
mxLegsDefY = 0
bfLegsHighY = 0
bfLegsDefY = 0

breakableObjects = {}
legsSuffix = ''
pipeEnd = false
pipeTrigger = false

bfLegsPrefix = '-fire'
bfPrefix = 'bf-smb'
powerup = 2
dmgCooldown = 0
timeUntilPowerup = 0

allowCountdown = false
impact = false
statictoggle = false

function onCreate()
	jumpTriggers[1] = jumpedBrick
	jumpTriggers[2] = jumpedGap1
	jumpTriggers[3] = jumpedGap2
	jumpTriggers[4] = jumpedPipe
	jumpTriggers[5] = jumpedGapB
	jumpTriggers[6] = jumpedGapB2
	jumpTriggers[7] = jumpedStairs
	jumpTriggers[8] = jumpedGap3
	jumpTriggers[9] = jumpedGap3M
	jumpTriggers[10] = jumpedStairs2
	jumpTriggers[11] = jumpedGap4
	jumpTriggers[12] = jumpedGap4M

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dies')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-gameover')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'intro1')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'intro1')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0); --Default value is: health lost on miss
	end
	
	ogHud = getPropertyFromClass('ClientPrefs', 'hideHud')
	setPropertyFromClass('ClientPrefs', 'hideHud', true)
end

function onDestroy()
	setPropertyFromClass('ClientPrefs', 'hideHud', ogHud)
end

function onCreatePost()
	setProperty('gf.alpha', 0)

	precacheImage('pcport/bf-die')
	precacheImage('pcport/luigi')
	precacheImage('pcport/loop')
	precacheImage('staticFLASH')
	precacheImage('flower')
	precacheImage('mushroom')
	precacheImage('bluefilter')
	precacheImage('MarkovEyes')
	precacheImage('pcport/unauthorized')
	precacheImage('HAHAHA')
	
	addCharacterToList('bf-smb-small', 'boyfriend')
	addCharacterToList('bf-smb', 'boyfriend')
	
	addCharacterToList('bf-chase-small', 'boyfriend')
	addCharacterToList('bf-chase', 'boyfriend')
	addCharacterToList('bf-chase-fire', 'boyfriend')
	
	addCharacterToList('bf-wall-fire', 'boyfriend')
	addCharacterToList('bf-wall-small', 'boyfriend')
	addCharacterToList('bf-wall', 'boyfriend')
	
	addCharacterToList('mx', 'dad')
	addCharacterToList('marionear', 'dad')
	addCharacterToList('big-mx', 'dad')
	addCharacterToList('mx-angry', 'dad')
	addCharacterToList('mx-angry2', 'dad')
	
--- blue filter for end part

    makeLuaSprite('bluefilter', 'bluefilter', 0, 0)
	setBlendMode('bluefilter', 'multiply')
	setProperty('bluefilter.antialiasing', false)
	setObjectCamera('bluefilter', 'other')
	scaleObject('bluefilter', 10, 10)
	updateHitbox('bluefilter')
	addLuaSprite('bluefilter', true)
	setProperty('bluefilter.visible', false)
	
---
	
--- Static that will be used during transitions

	makeAnimatedLuaSprite('staticFLASH', 'staticFLASH', 0, 0)
	addAnimationByPrefix('staticFLASH', 'staticFLASH', 'staticFLASH', 24, true)
	objectPlayAnimation('staticFLASH', 'staticFLASH')
	setProperty('staticFLASH.antialiasing', false)
	scaleObject('staticFLASH', 3.4, 3.4)
	addLuaSprite('staticFLASH', true)
	setProperty('staticFLASH.visible', false)
	setObjectCamera('staticFLASH', 'other')
	setObjectOrder('staticFLASH', getObjectOrder('bluefilter')+1)
	
	makeAnimatedLuaSprite('flash', 'flash', 0, 0)
	addAnimationByPrefix('flash', 'flash', 'flash', 6, false)
	setProperty('flash.antialiasing', false)
	scaleObject('flash', 30, 30)
	addLuaSprite('flash', true)
	setProperty('flash.visible', false)
	
	makeAnimatedLuaSprite('flashall', 'flash', 0, 0)
	addAnimationByPrefix('flashall', 'flash', 'flash', 12, false)
	setProperty('flashall.antialiasing', false)
	scaleObject('flashall', 30, 30)
	addLuaSprite('flashall', true)
	setObjectCamera('flashall', 'other')
	setProperty('flashall.visible', false)

	makeAnimatedLuaSprite('firebgloop', 'firebgloop', 0, 0)
	addAnimationByPrefix('firebgloop', 'firebgloop', 'firebgloop', 12, true)
	objectPlayAnimation('firebgloop', 'firebgloop')
	setProperty('firebgloop.antialiasing', false)
	setObjectOrder('firebgloop', getObjectOrder('dadGroup')-10.2)
	scaleObject('firebgloop', 4, 4)
	addLuaSprite('firebgloop', false)
	setProperty('firebgloop.visible', false)

	--makeAnimatedLuaSprite('fireloop', 'fireloop', 0, 200)
	--addAnimationByPrefix('fireloop', 'fireloop', 'fireloop', 8, true)
	--objectPlayAnimation('fireloop', 'fireloop')
	--setProperty('fireloop.antialiasing', false)
	--setObjectOrder('fireloop', getObjectOrder('dadGroup')-8.1)
	--scaleObject('fireloop', 4, 4)
	--addLuaSprite('fireloop', false)
	--setProperty('fireloop.visible', false)	

---

	makeLuaSprite('goal', 'pcport/goal', 0, 0)
	setProperty('goal.antialiasing', false)
	scaleObject('goal', 6, 6)
	updateHitbox('goal')
	addLuaSprite('goal')
	
	makeLuaSprite('border', 'border', -150, -80)
	setProperty('border.antialiasing', false)
	setObjectCamera('border', 'other')
	scaleObject('border', 1.25, 1.25)
	addLuaSprite('border')
	setProperty('border.visible', false)
	
	---rings
	
	if downscroll then
		makeLuaSprite('rings1','rings', 0, 110)
	else
		makeLuaSprite('rings1','rings', 0, 630)
	end
	setScrollFactor('rings1', 0, 0)
	setObjectCamera('rings1', 'hud')
	setProperty('rings1.antialiasing', false)
	scaleObject('rings1', 3.4, 3.4)
	addLuaSprite('rings1', true)
	setProperty('rings1.visible', false)

	if downscroll then
		makeLuaSprite('rings2','rings2', 0, 110)
	else
		makeLuaSprite('rings2','rings2', 0, 630)
	end
	setScrollFactor('rings2', 0, 0)
	setObjectCamera('rings2', 'hud')
	setProperty('rings2.antialiasing', false)
	scaleObject('rings2', 3.4, 3.4)
	addLuaSprite('rings2',true)
	setProperty('rings2.visible', false)
	
	if downscroll then
		makeAnimatedLuaSprite('ringsanimated', 'ringsanimated', 0, 110)
	else
		makeAnimatedLuaSprite('ringsanimated', 'ringsanimated', 0, 630)
	end
	setScrollFactor('ringsanimated', 0, 0)
	addAnimationByPrefix('ringsanimated', 'ringsanimated', 'ringsanimated', 4, true)
	objectPlayAnimation('ringsanimated', 'ringsanimated')
	setProperty('ringsanimated.antialiasing', false)
	scaleObject('ringsanimated', 3.4, 3.4)
	setObjectCamera('ringsanimated', 'hud')
	addLuaSprite('ringsanimated', true)
	setProperty('ringsanimated.visible', false)

	--doTweenAlpha('Deez', 'rings2', 0, 0.1, 'linear')
	--doTweenAlpha('fortniteballs', 'rings1', 0, 0.1, 'linear')
	--doTweenAlpha('nuts', 'ringsanimated', 0, 0.1, 'linear')

	---
	
	makeLuaSprite('loop', 'pcport/loop', -2119 *6, 0)
	setProperty('loop.antialiasing', false)
	scaleObject('loop', 6, 6)
	updateHitbox('loop')
	addLuaSprite('loop')
	setProperty('loop.visible', false)
	
	makeLuaSprite('flagpole', 'pcport/flagpole', -2119 *6, 0)
	setProperty('flagpole.antialiasing', false)
	scaleObject('flagpole', 6, 6)
	updateHitbox('flagpole')
	addLuaSprite('flagpole')
	setProperty('flagpole.visible', false)
	
	makeLuaSprite('empty', 'pcport/empty', -2119 *6, 0)
	setProperty('empty.antialiasing', false)
	scaleObject('empty', 6, 6)
	updateHitbox('empty')
	addLuaSprite('empty')
	setProperty('empty.visible', false)
	
	makeAnimatedLuaSprite('popup', 'pcport/popup', 32, 20)
	addAnimationByPrefix('popup', 'popup', 'popup', 70, false)
	objectPlayAnimation('popup', 'popup')
	setProperty('popup.antialiasing', false)
	scaleObject('popup', 6.2, 6.2)
	updateHitbox('popup')
	addLuaSprite('popup', true)
	setProperty('popup.visible', false)

	makeLuaSprite('unauthorized', 'pcport/unauthorized', 120, 0)
	setProperty('unauthorized.antialiasing', false)
	setObjectCamera('unauthorized', 'other')
	scaleObject('unauthorized', 3.25, 3.25)
	updateHitbox('unauthorized')
	addLuaSprite('unauthorized', true)
	setProperty('unauthorized.visible', false)
	setObjectOrder('unauthorized', getObjectOrder('bluefilter')+3)

	makeLuaSprite('BlackBox', 'blackbox', 0, 0)
	setProperty('BlackBox.antialiasing', false)
	scaleObject('BlackBox', 100, 100)
	setObjectCamera('BlackBox', 'other')
	addLuaSprite('BlackBox')
	setProperty('BlackBox.visible', false)
	
	makeLuaSprite('BlackFlash', 'blackbox', 0, 0)
	setProperty('BlackFlash.antialiasing', false)
	scaleObject('BlackFlash', 100, 100)
	addLuaSprite('BlackFlash',true)
	setProperty('BlackFlash.visible', false)
	if downscroll then
		makeLuaSprite('fireflower', 'P1', 313, 65)
	else
		makeLuaSprite('fireflower', 'P1', 313, 639)
	end
	setProperty('fireflower.antialiasing', false)
	setObjectCamera('fireflower', 'HUD')
	scaleObject('fireflower', 6, 6)
	addLuaSprite('fireflower')
	setProperty('fireflower.visible', true)

	if downscroll then
		makeLuaSprite('mushroom', 'P2', 313, 65)
	else
		makeLuaSprite('mushroom', 'P2', 313, 639)
	end
	setProperty('mushroom.antialiasing', false)
	setObjectCamera('mushroom', 'HUD')
	scaleObject('mushroom', 6, 6)
	addLuaSprite('mushroom')
	setProperty('mushroom.visible', false)

	if downscroll then
		makeLuaSprite('YOURFUCKED', 'P3', 313, 65)
	else
		makeLuaSprite('YOURFUCKED', 'P3', 313, 639)
	end
	setProperty('YOURFUCKED.antialiasing', false)
	setObjectCamera('YOURFUCKED', 'HUD')
	scaleObject('YOURFUCKED', 6, 6)
	addLuaSprite('YOURFUCKED')
	setProperty('YOURFUCKED.visible', false)

--- Lord X transition
	
	makeAnimatedLuaSprite('HAHAHA', 'HAHAHA', -20, -30)
	addAnimationByPrefix('HAHAHA', 'HAHAHA', 'HAHAHA', 19, false)
	setProperty('HAHAHA.antialiasing', false)
	scaleObject('HAHAHA', 0.78, 0.78)
	addLuaSprite('HAHAHA', true)
	setObjectOrder('HAHAHA', 9999)
	setProperty('HAHAHA.visible', false)

-- //Intro//

	makeLuaSprite('Blackbgintro', 'Blackbgintro', 0, 0)
	setProperty('Blackbgintro.antialiasing', false)
	scaleObject('Blackbgintro', 3, 3)
	addLuaSprite('Blackbgintro')
	setObjectCamera('Blackbgintro', 'other')
	setProperty('Blackbgintro.visible', true)

	makeAnimatedLuaSprite('introLoop', 'introLoop', 0, 0)
	addAnimationByPrefix('introLoop', 'introLoop', 'introLoop', 30, true)
	objectPlayAnimation('introLoop', 'introLoop')
	setProperty('introLoop.antialiasing', false)
	scaleObject('introLoop', 3, 3)
	setObjectCamera('introLoop', 'other')
	addLuaSprite('introLoop', true)
	setProperty('introLoop.visible', true)

	makeAnimatedLuaSprite('introP1', 'introP1', 0, 0)
	addAnimationByPrefix('introP1', 'introP1', 'introP1', 30, false)
	objectPlayAnimation('introP1', 'introP1')
	setProperty('introP1.antialiasing', false)
	scaleObject('introP1', 3, 3)
	setObjectCamera('introP1', 'other')
	addLuaSprite('introP1', true)
	setProperty('introP1.visible', true)
	
	makeLuaSprite('WrongRes', 'youshouldntseethis', 960, 0)
	setProperty('WrongRes.antialiasing', false)
	setObjectCamera('WrongRes', 'other')
	addLuaSprite('WrongRes', true)
	setProperty('WrongRes.visible', true)
	
	if (getPropertyFromClass('openfl.Lib','application.window.fullscreen') == true) then
		makeLuaSprite('fullscreen', 'fullscreen', 0, 0)
		setProperty('fullscreen.antialiasing', false)
		addLuaSprite('fullscreen')
		setObjectCamera('fullscreen', 'other')
		setProperty('fullscreen.visible', true)
		
		makeLuaSprite('fullscreen2', 'fullscreen2', 0, 0)
		setProperty('fullscreen2.antialiasing', false)
		addLuaSprite('fullscreen2', true)
		setObjectCamera('fullscreen2', 'other')
		setProperty('fullscreen2.visible', false)

		makeLuaSprite('fullscreen3', 'fullscreen3', 0, 0)
		
		setProperty('fullscreen3.antialiasing', false)
		addLuaSprite('fullscreen3', true)
		setObjectCamera('fullscreen3', 'other')
		setProperty('fullscreen3.visible', false)
		
		playSound('fullscreen')
		runTimer('jumpscare', 15, 0)
		
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)
		setProperty('WrongRes.visible', false)
		removeLuaSprite('Blackbgintro')
		removeLuaSprite('introLoop')
		removeLuaSprite('introP1')
		LockGame = true
	end

-- //


-- Sonic Legs
	
	makeAnimatedLuaSprite('soniclegs', 'pcport/soniclegs', 180, 198)
	addAnimationByPrefix('soniclegs', 'soniclegs', 'soniclegs', 24, true)
	setProperty('soniclegs.antialiasing', false)
	scaleObject('soniclegs', 4, 4)
	addLuaSprite('soniclegs', false)
	setProperty('soniclegs.visible', false)

	makeAnimatedLuaSprite('soniclegsoverlay', 'pcport/soniclegsoverlay', getProperty('soniclegs.x'), getProperty('soniclegs.y'))
	addAnimationByPrefix('soniclegsoverlay', 'soniclegsoverlay', 'soniclegsoverlay', 24, true)
	objectPlayAnimation('soniclegsoverlay', 'soniclegsoverlay')
	objectPlayAnimation('soniclegs', 'soniclegs')
	setProperty('soniclegsoverlay.antialiasing', false)
	scaleObject('soniclegsoverlay', 4, 4)
	addLuaSprite('soniclegsoverlay', false)
	setObjectOrder('soniclegsoverlay', getObjectOrder('dadGroup')+2)
	setProperty('soniclegsoverlay.visible', false)

--


	---/////OBJECTS MAKING////---
		makeAnimatedLuaSprite('pipe1', 'pcport/pipebreak', 0, -16*6)
		addAnimationByIndices('pipe1', 'idle', 'pipebreak', '0, 0', 35)
		addAnimationByPrefix('pipe1', 'break', 'pipebreak', 70, false)
		setProperty('pipe1.antialiasing', false)
		addLuaSprite('pipe1')
		setProperty('pipe1.visible', false)
		
		breakableObjects[1] = getProperty('pipe1')
		
		makeAnimatedLuaSprite('pipe2', 'pcport/pipebreak', 0, -16*6)
		addAnimationByIndices('pipe2', 'idle', 'pipebreak', '0, 0', 35)
		addAnimationByPrefix('pipe2', 'break', 'pipebreak', 70, false)
		setProperty('pipe2.antialiasing', false)
		addLuaSprite('pipe2')
		setProperty('pipe2.visible', false)
		
		breakableObjects[12] = getProperty('pipe2')
		
		makeAnimatedLuaSprite('solidB1', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB1', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB1', 'break', 'brickbreak', 70, false)
		setProperty('solidB1.antialiasing', false)
		addLuaSprite('solidB1')
		setProperty('solidB1.visible', false)
		
		breakableObjects[2] = getProperty('solidB1')
		
		makeAnimatedLuaSprite('solidB2', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB2', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB2', 'break', 'brickbreak', 70, false)
		setProperty('solidB2.antialiasing', false)
		addLuaSprite('solidB2')
		setProperty('solidB2.visible', false)
		
		breakableObjects[3] = getProperty('solidB2')
		
		makeAnimatedLuaSprite('solidB3', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB3', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB3', 'break', 'brickbreak', 70, false)
		setProperty('solidB3.antialiasing', false)
		addLuaSprite('solidB3')
		setProperty('solidB3.visible', false)
		
		breakableObjects[4] = getProperty('solidB3')
		
		makeAnimatedLuaSprite('solidB4', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB4', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB4', 'break', 'brickbreak', 70, false)
		setProperty('solidB4.antialiasing', false)
		addLuaSprite('solidB4')
		setProperty('solidB4.visible', false)
		
		breakableObjects[5] = getProperty('solidB4')
		
		makeAnimatedLuaSprite('solidB5', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB5', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB5', 'break', 'brickbreak', 70, false)
		setProperty('solidB5.antialiasing', false)
		addLuaSprite('solidB5')
		setProperty('solidB5.visible', false)
		
		breakableObjects[6] = getProperty('solidB5')
		
		makeAnimatedLuaSprite('solidB6', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB6', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB6', 'break', 'brickbreak', 70, false)
		setProperty('solidB6.antialiasing', false)
		addLuaSprite('solidB6')
		setProperty('solidB6.visible', false)
		
		breakableObjects[7] = getProperty('solidB6')
		
		makeAnimatedLuaSprite('emptyB1', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB1', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB1', 'break', 'emptybreak', 70, false)
		setProperty('emptyB1.antialiasing', false)
		addLuaSprite('emptyB1')
		setProperty('emptyB1.visible', false)
		
		breakableObjects[8] = getProperty('emptyB1')
		
		makeAnimatedLuaSprite('emptyB2', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB2', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB2', 'break', 'emptybreak', 70, false)
		setProperty('emptyB2.antialiasing', false)
		addLuaSprite('emptyB2')
		setProperty('emptyB2.visible', false)
		
		breakableObjects[9] = getProperty('emptyB2')
		
		makeAnimatedLuaSprite('emptyB3', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB3', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB3', 'break', 'emptybreak', 70, false)
		setProperty('emptyB3.antialiasing', false)
		addLuaSprite('emptyB3')
		setProperty('emptyB3.visible', false)
		
		breakableObjects[10] = getProperty('emptyB3')
		
		makeAnimatedLuaSprite('emptyB4', 'pcport/emptybreak', 0, -16*6)
		addAnimationByIndices('emptyB4', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB4', 'break', 'emptybreak', 70, false)
		setProperty('emptyB4.antialiasing', false)
		addLuaSprite('emptyB4')
		setProperty('emptyB4.visible', false)
		
		breakableObjects[11] = getProperty('emptyB4')
		
		makeAnimatedLuaSprite('emptyB5', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB5', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB5', 'break', 'emptybreak', 70, false)
		setProperty('emptyB5.antialiasing', false)
		addLuaSprite('emptyB5')
		setProperty('emptyB5.visible', false)
		
		breakableObjects[13] = getProperty('emptyB5')
		
		makeAnimatedLuaSprite('emptyB6', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB6', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB6', 'break', 'emptybreak', 70, false)
		setProperty('emptyB6.antialiasing', false)
		addLuaSprite('emptyB6')
		setProperty('emptyB6.visible', false)
		
		breakableObjects[14] = getProperty('emptyB6')
		
		makeAnimatedLuaSprite('emptyB7', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB7', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB7', 'break', 'emptybreak', 70, false)
		setProperty('emptyB7.antialiasing', false)
		addLuaSprite('emptyB7')
		setProperty('emptyB7.visible', false)
		
		breakableObjects[15] = getProperty('emptyB7')
		
		makeAnimatedLuaSprite('solidB7', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB7', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB7', 'break', 'brickbreak', 70, false)
		setProperty('solidB7.antialiasing', false)
		addLuaSprite('solidB7')
		setProperty('solidB7.visible', false)
		
		breakableObjects[16] = getProperty('solidB7')
		
		makeAnimatedLuaSprite('solidB8', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB8', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB8', 'break', 'brickbreak', 70, false)
		setProperty('solidB8.antialiasing', false)
		addLuaSprite('solidB8')
		setProperty('solidB8.visible', false)
		
		breakableObjects[17] = getProperty('solidB8')
		
		makeAnimatedLuaSprite('solidB9', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB9', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB9', 'break', 'brickbreak', 70, false)
		setProperty('solidB9.antialiasing', false)
		addLuaSprite('solidB9')
		setProperty('solidB9.visible', false)
		
		breakableObjects[18] = getProperty('solidB9')
		
		makeAnimatedLuaSprite('solidB10', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB10', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB10', 'break', 'brickbreak', 70, false)
		setProperty('solidB10.antialiasing', false)
		addLuaSprite('solidB10')
		setProperty('solidB10.visible', false)
		
		breakableObjects[19] = getProperty('solidB10')
		
		makeAnimatedLuaSprite('solidB11', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB11', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB11', 'break', 'brickbreak', 70, false)
		setProperty('solidB11.antialiasing', false)
		addLuaSprite('solidB11')
		setProperty('solidB11.visible', false)
		
		breakableObjects[20] = getProperty('solidB11')
		
		makeAnimatedLuaSprite('solidB12', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB12', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB12', 'break', 'brickbreak', 70, false)
		setProperty('solidB12.antialiasing', false)
		addLuaSprite('solidB12')
		setProperty('solidB12.visible', false)
		
		breakableObjects[21] = getProperty('solidB12')
		
	--//////OBJECTS END////----
	makeLuaSprite('brickscroll', 'pcport/brickscroll', 0, 0)
	setProperty('brickscroll.antialiasing', false)
	scaleObject('brickscroll', 6, 6)
	updateHitbox('brickscroll')
	addLuaSprite('brickscroll')
	setProperty('brickscroll.visible', false)
	
	makeLuaSprite('pipeEnd', 'pcport/endpipe', 0, 0)
	setProperty('pipeEnd.antialiasing', false)
	scaleObject('pipeEnd', 6, 6)
	updateHitbox('pipeEnd')
	addLuaSprite('pipeEnd', true)
	setProperty('pipeEnd.visible', false)
	
	addLuaSprite('border1',true)
	addLuaSprite('border2',true)
	
	makeLuaSprite('hiddenWall', 'pcport/hiddenwall', 0, 0)
	setProperty('hiddenWall.antialiasing', false)
	scaleObject('hiddenWall', 6, 6)
	updateHitbox('hiddenWall')
	addLuaSprite('hiddenWall')
	setProperty('hiddenWall.visible', false)
	
	makeAnimatedLuaSprite('mxLegs', 'pcport/legs', 70*6, 8.95*6)
	addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
	addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
	addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
	setProperty('mxLegs.antialiasing', false)
	addLuaSprite('mxLegs')
	setProperty('mxLegs.visible', false)
	
	makeAnimatedLuaSprite('bfLegs', 'pcport/bflegs', 70*6, 8.95*6)
	addAnimationByPrefix('bfLegs', 'idle', 'run0', 30, true)
	addAnimationByPrefix('bfLegs', 'jump', 'jump0', 30, true)
	addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 30, true)
	addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 30, true)
	addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 30, true)
	addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 30, true)
	setProperty('bfLegs.antialiasing', false)
	addLuaSprite('bfLegs')
	setProperty('bfLegs.visible', false)
	
	makeLuaSprite('one', '1', 451.7, 28.5*6)
	setProperty('one.antialiasing', false)
	scaleObject('one', 6, 6)
	updateHitbox('one')
	addLuaSprite('one', true)
	setProperty('one.visible', false)
	
	makeLuaSprite('two', '2', 451.7, 28.5*6)
	setProperty('two.antialiasing', false)
	scaleObject('two', 6, 6)
	updateHitbox('two')
	addLuaSprite('two', true)
	setProperty('two.visible', false)
	
	makeLuaSprite('three', '3', 451.7, 28.5*6)
	setProperty('three.antialiasing', false)
	scaleObject('three', 6, 6)
	updateHitbox('three')
	addLuaSprite('three', true)
	setProperty('three.visible', false)
	
	makeLuaSprite('go', 'start', 411.7, 24.45*6)
	setProperty('go.antialiasing', false)
	scaleObject('go', 6, 6)
	updateHitbox('go')
	addLuaSprite('go', true)
	setProperty('go.visible', false)
	
	makeLuaText('disclaimer', 'IF YOU WANNA TOGGLE BREAK IMPACT DURING\nTHE CHASE SEQUENCE:\n PRESS F1!', 0, getPropertyFromClass('flixel.FlxG', 'width')/2-(80*6)+2, getPropertyFromClass('flixel.FlxG', 'height')/2-(15*6))
	setProperty('disclaimer.borderSize', 0)
	setProperty('disclaimer.antialiasing', false)
	setTextFont('disclaimer', 'smb1.ttf')
	setTextSize('disclaimer', 4*6, 4*6)
	setScrollFactor('disclaimer', 0, 0)
	setTextAlignment('disclaimer', 'center')
	addLuaText('disclaimer')
	setProperty('camGame.alpha', 0)
	
	setProperty('dad.x', 110*6)
	setProperty('dad.y', 22*6)
	
	makeLuaSprite('mxPoint', 'pcport/legs', 74*6, 8.95*6)
	makeLuaSprite('bfPoint', 'pcport/legs', 74*6, 8.95*6)
end

function onGameOverStart()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop
	--setScrollFactor(getPropertyFromClass('GameOverSubstate', 'boyfriend'), 0, 0)
	setPropertyFromClass('flixel.FlxG', 'camera.x', 0)
	setPropertyFromClass('flixel.FlxG', 'camera.y', 0)
	setProperty('boyfriend.x', 580)
	setProperty('boyfriend.y', 385)
	objectPlayAnimation('boyfriend', 'die', true)
	return Function_Continue;
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'powerup' and not isSustainNote then
		if powerup < 2 then
			if getPropertyFromGroup('notes', id, 'texture') == 'mushroom' then
				powerup = 1
			else
				powerup = 2
			end
			powerupSpawned = false
			powerupVisuals(getProperty('boyfriend.animation.name'),getProperty('boyfriend.animation.curAnim.curFrame'))
			if SonicUI == false then
				playSound('powerup')
			else
				playSound('ring-gain')
			end
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if getProperty('dad.curCharacter') == 'big-mx' and flashingLights then
		--triggerEvent('Pixel Cam Shake', '3, 2, 2', '0.025')
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if dmgCooldown <= 0 then
		dmgCooldown = 2.5
		powerup = powerup - 1
			if SonicUI == false then
				playSound('power_down')
			else
				playSound('ring-loss')
			end
		if powerup < 0 then
			setProperty('health', 0)
		else
			powerupVisuals(getProperty('boyfriend.animation.name'),getProperty('boyfriend.animation.curAnim.curFrame'))
		end
	end
end

function powerupVisuals(curAnim, curFrame)
	prefix = bfPrefix
	stopFlicker = true

	if SonicUI == true then
		if powerup == 2 then
			setProperty('rings2.visible', true)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
			
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', false)
		elseif powerup == 1 then
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', true)
			setProperty('ringsanimated.visible', false)
			
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', false)
		elseif powerup == 0 then
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', true)
			
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', false)
		end
	else
		if powerup == 2 then
			setProperty('fireflower.visible', true)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', false)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		elseif powerup == 1 then
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', true)
			setProperty('YOURFUCKED.visible', false)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		elseif powerup == 0 then
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', true)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		end
	end

	if powerup == 2 then
        timeUntilPowerup = -1
    elseif powerup == 1 then
        timeUntilPowerup = 12
    elseif powerup == 0 then
        timeUntilPowerup = 5
    end
	
	legsAnim = getProperty('bfLegs.animation.curAnim.name')
	animToPlay = ''
	
	if legsAnim == 'jump' or legsAnim == 'jump-fire' or legsAnim == 'jump-small' then
		animToPlay = 'jump'
	else 
		animToPlay = 'idle'
	end
	objectPlayAnimation('bfLegs', animToPlay..bfLegsPrefix, true)
	stopFlicker = false
	
	--if prefix == 'bf-chase' then
	--	setProperty('boyfriend.x', 37*6)
	--	setProperty('boyfriend.y', 28*6)
	--elseif prefix == 'bf-wall' then
	--	setProperty('boyfriend.x', 0)
	--	setProperty('boyfriend.y', 0)
	--end
	
	characterPlayAnim('boyfriend', curAnim, true)
	setProperty('boyfriend.animation.curAnim.curFrame', curFrame)
end

function onStartCountdown()
	-- countdown started, duh
	if not allowCountdown then
		return Function_Stop
	end
	return Function_Continue;
end

math.round = function(num)
    return math.floor(num + 0.5)
end

startTrigger = false
triggered = false
stopFlicker = false

starColor = 0

trigger = false
deathTrigger = false

powerupSpawned = false
pressedEnter = false
set = false

function onUpdate(elapsed)
	setProperty('camZooming', true)
	
	if powerup >= 0 then
		setProperty('health', 1)
	end
	
	if timeUntilPowerup > 0 then
		timeUntilPowerup = timeUntilPowerup - elapsed
		--debugPrint(timeUntilPowerup)
	elseif timeUntilPowerup <= 0 then
		if powerup < 2 and not powerupSpawned then
			if getPropertyFromGroup('unspawnNotes', 0, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', 0, 'mustPress') and (getPropertyFromGroup('unspawnNotes', 0, 'isSustainNote') == false) then
				--debugPrint('powerup spawn')
				powerupSpawned = true
				setPropertyFromGroup('unspawnNotes', 0, 'noteType', 'powerup')
				if SonicUI == false then
					if powerup == 0 then
						setPropertyFromGroup('unspawnNotes', 0, 'texture', 'mushroom')
					elseif powerup == 1 then 
						setPropertyFromGroup('unspawnNotes', 0, 'texture', 'flower')
					end
				else
					if (curStep >= 768 and curStep <= 896) then
						setPropertyFromGroup('unspawnNotes', 0, 'texture', 'ringprey')
					else
						setPropertyFromGroup('unspawnNotes', 0, 'texture', 'ringgenesis')
					end
				end
			end
		end
	end
	
	if dmgCooldown > 0 then
		setProperty('boyfriend.alpha', (getPropertyFromClass('flixel.FlxG', 'game.ticks') % 2))
		setProperty('bfLegs.alpha', (getPropertyFromClass('flixel.FlxG', 'game.ticks') % 2))
		dmgCooldown = dmgCooldown - elapsed
		if dmgCooldown <= 0 then
			dmgCooldown = 0
			setProperty('boyfriend.alpha', 1)
			setProperty('bfLegs.alpha', 1)
		end
	end
		
	if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and not pressedEnter) and LockGame == false then
		pressedEnter = true
		removeLuaText('disclaimer')
		setProperty('one.visible', true)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 1.25)
		runTimer('countdown1', 2)

	makeAnimatedLuaSprite('introP2', 'introP2', 0, 0)
	addAnimationByPrefix('introP2', 'introP2', 'introP2', 30, false)
	objectPlayAnimation('introP2', 'introP2')
	setProperty('introP2.antialiasing', false)
	scaleObject('introP2', 3, 3)
	setObjectCamera('introP2', 'other')
	addLuaSprite('introP2', true)
	setProperty('introP2.visible', true)
	removeLuaSprite('introP1')
	removeLuaSprite('introLoop')
	removeLuaSprite('Blackbgintro')
	end
	
	--cahse shit
	if isChase then
		if startTrigger == false then
			startTrigger = true
			removeLuaSprite('goal')
			setProperty('flagpole.visible', true)
			setProperty('loop.visible', true)
			setProperty('mxLegs.visible', true)
			chaseBGX = getProperty('loop.x')
			
			setProperty('mxPoint.y', getProperty('mxLegs.y'))
			mxLegsHighY = getProperty('mxLegs.y') - (40*6)
			mxLegsDefY = getProperty('mxLegs.y')
			
			setProperty('bfPoint.y', getProperty('bfLegs.y'))
			bfLegsHighY = getProperty('bfLegs.y') - (40*6)
			bfLegsDefY = getProperty('bfLegs.y')
			
			for i,object in pairs(breakableObjects) do
				setProperty(object..'.visible', true)
			end
		end
		
		--legs shit
		if getProperty('dad.idleSuffix') ~= '-j' then
			if getProperty('dad.animation.curAnim.name') == 'idle' and getProperty('mxLegs.visible') ~= false then
				setProperty('mxLegs.visible', false)
			elseif getProperty('dad.animation.curAnim.name') ~= 'idle' and getProperty('mxLegs.visible') ~= true then
				setProperty('mxLegs.visible', true)
			end
		elseif getProperty('mxLegs.visible') ~= true then
			setProperty('mxLegs.visible', true)
		end
		
		if getProperty('boyfriend.idleSuffix') ~= '-j' then
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' and getProperty('bfLegs.visible') ~= false then
				setProperty('bfLegs.visible', false)
			elseif getProperty('boyfriend.animation.curAnim.name') ~= 'idle' and getProperty('bfLegs.visible') ~= true then
				setProperty('bfLegs.visible', true)
			end
		elseif getProperty('bfLegs.visible') ~= true then
			setProperty('bfLegs.visible', true)
		end
		
		--bg shit

		chaseBGX = chaseBGX + 1640 * elapsed
		
		if chaseBGX >= 0 then
			if getProperty('brickscroll.visible') == false then
				setProperty('brickscroll.visible', true)
			end
			removeLuaSprite('flagpole')
			chaseBGX = -2119 *6
			for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
				jumpTriggers[i] = false
			end
			
			for i,object in pairs(breakableObjects) do
				if not pipeEnd then
					objectPlayAnimation(object, 'idle', true)
				end
			end
		end
		setProperty('loop.x', math.round(chaseBGX/6)*6)
		setProperty('brickscroll.x', getProperty('loop.x'))
		setProperty('pipeEnd.x', getProperty('loop.x'))
		setProperty('empty.x', getProperty('loop.x'))
		if getProperty('flagpole') ~= nil then
			setProperty('flagpole.x', getProperty('loop.x'))
		end
		--debugPrint(getProperty('loop.x'))
		
		--mx shit
		if not pipeEnd then
			for i=-1684*6, -1648*6 do
				if getProperty('loop.x') == i and not jumpTriggers[1] then
					jumpTriggers[1] = true
					doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.4, 'sineOut')
					objectPlayAnimation('mxLegs', 'jump', true)
					setProperty('dad.idleSuffix', '-j')
					if getProperty('dad.animation.curAnim.name') == 'idle' then
						characterPlayAnim('dad', 'idle-j', true)
					end
				end
			end
			
			for i=-1356*6, -1340*6 do
				if getProperty('loop.x') == i and not jumpTriggers[2] then
					jumpTriggers[2] = true
					doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.45, 'sineOut')
					objectPlayAnimation('mxLegs', 'jump', true)
					setProperty('dad.idleSuffix', '-j')
					if getProperty('dad.animation.curAnim.name') == 'idle' then
						characterPlayAnim('dad', 'idle-j', true)
					end
				end
			end
			
			for i=-835*6, -825*6 do
				if getProperty('loop.x') == i and not jumpTriggers[7] then
					jumpTriggers[7] = true
					doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.45, 'sineOut')
					objectPlayAnimation('mxLegs', 'jump', true)
					setProperty('dad.idleSuffix', '-j')
					if getProperty('dad.animation.curAnim.name') == 'idle' then
						characterPlayAnim('dad', 'idle-j', true)
					end
				end
			end
			
			for i=-549*6, -540*6 do
				if getProperty('loop.x') == i and not jumpTriggers[9] then
					jumpTriggers[9] = true
					doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.45, 'sineOut')
					objectPlayAnimation('mxLegs', 'jump', true)
					setProperty('dad.idleSuffix', '-j')
					if getProperty('dad.animation.curAnim.name') == 'idle' then
						characterPlayAnim('dad', 'idle-j', true)
					end
				end
			end
			
			for i=-138*6, -130*6 do
				if getProperty('loop.x') == i and not jumpTriggers[12] then
					jumpTriggers[12] = true
					doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.45, 'sineOut')
					objectPlayAnimation('mxLegs', 'jump', true)
					setProperty('dad.idleSuffix', '-j')
					if getProperty('dad.animation.curAnim.name') == 'idle' then
						characterPlayAnim('dad', 'idle-j', true)
					end
				end
			end
			
			--bf shit
			for i=-2119*6, -2075*6 do
				if getProperty('loop.x') == i and not jumpTriggers[3] then
					jumpTriggers[3] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY+(2*6), 0.45, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-1760*6, -1712*6 do
				if getProperty('loop.x') == i and not jumpTriggers[4] then
					jumpTriggers[4] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY+(6*6), 0.5, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-1430*6, -1411*6 do
				if getProperty('loop.x') == i and not jumpTriggers[5] then
					jumpTriggers[5] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY+(10*6), 0.45, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-955*6, -910*6 do
				if getProperty('loop.x') == i and not jumpTriggers[6] then
					jumpTriggers[6] = true
					doTweenY('jumpBFs', 'bfPoint', bfLegsHighY-(2*6), 0.5, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-620*6, -600*6 do
				if getProperty('loop.x') == i and not jumpTriggers[8] then
					jumpTriggers[8] = true
					doTweenY('jumpBFF', 'bfPoint', bfLegsHighY+(15*6), 0.3, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-440*6, -415*6 do
				if getProperty('loop.x') == i and not jumpTriggers[10] then
					jumpTriggers[10] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY, 0.4, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-194*6, -180*6 do
				if getProperty('loop.x') == i and not jumpTriggers[11] then
					jumpTriggers[11] = true
					doTweenY('jumpBFF', 'bfPoint', bfLegsHighY+(18*6), 0.25, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
		end
		
		setProperty('boyfriend.y', math.round(getProperty('bfPoint.y')/6)*6+(1*6))
		setProperty('bfLegs.y', getProperty('boyfriend.y')-(1*6))
		
		setProperty('dad.y', math.round(getProperty('mxPoint.y')/6)*6)
		setProperty('mxLegs.y', getProperty('dad.y'))
		
		--objects shit
		for i,object in pairs(breakableObjects) do
			local offset = 0
			
			if i == 1 then --pipe 1
				offset = 2010
			elseif i == 2 then
				offset = 2088
			elseif i == 3 or i == 4 then
				offset = 2072
			elseif i == 5 then
				offset = 1992
			elseif i == 6 or i == 7 then
				offset = 2008
			elseif i == 8 then
				offset = 1400
			elseif i == 9 then
				offset = 1369
			elseif i == 10 then
				offset = 1336
			elseif i == 11 then
				offset = 1768
			elseif i == 12 then --pipe 2
				offset = 870
			elseif i == 13 then
				offset = 602
			elseif i == 14 then
				offset = 571
			elseif i == 15 then
				offset = 540
			elseif i == 16 then
				offset = 426
			elseif i == 17 or i == 18 then
				offset = 410
			elseif i == 19 or i == 20 then
				offset = 345
			elseif i == 21 then
				offset = 329
			end
			
			hitboxOfs = 0
			
			if i == 1 or i == 12 then
				hitboxOfs = 52
			else
				hitboxOfs = 20
			end
			
			setProperty(object..'.x', getProperty('loop.x') + (offset * 6))
			
			if getProperty(object..'.x') >= (getProperty('dad.x') - (hitboxOfs * 6)) and not pipeEnd then
			
				if getProperty(object..'.animation.curAnim.name') ~= 'break' then
					objectPlayAnimation(object, 'break', true)
					if impact then
					--	triggerEvent('Pixel Cam Shake', '5, 4, 3', '0.015')
					--	playSound('break', 3)
					end
				end
				
			end
		end
	elseif pipeEnd and getProperty('boyfriend.animation.curAnim.name') ~= 'pause' then
		characterPlayAnim('boyfriend', 'pause', true)
		characterPlayAnim('dad', 'pause', true)
	end
	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F1') then
		impact = not impact
	end
	
	if not middlescroll then
		if curBeat == 0 then
			setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0-80)

			setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1-80)

			setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2-80)

			setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3-80)


			setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 - 60)

			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 - 60)

			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 - 60)

			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 - 60)
			
			--y
			setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0-30)

			setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY1-30)

			setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY2-30)

			setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY3-30)


			setPropertyFromGroup('opponentStrums', 0, 'y', defaultPlayerStrumY0 - 30)

			setPropertyFromGroup('opponentStrums', 1, 'y', defaultPlayerStrumY1 - 30)

			setPropertyFromGroup('opponentStrums', 2, 'y', defaultPlayerStrumY2 - 30)

			setPropertyFromGroup('opponentStrums', 3, 'y', defaultPlayerStrumY3 - 30)


		end
	end
end

function onTweenCompleted(tag)
	if tag == 'jumpMX' then
		doTweenY('fallMX', 'mxPoint', mxLegsDefY, 0.45, 'sineIn')
	end
	
	if tag == 'fallMX' then
		setProperty('dad.idleSuffix', '')
		objectPlayAnimation('mxLegs', 'idle'..legsSuffix, true)
		if getProperty('dad.animation.curAnim.name') == 'idle-j' then
			characterPlayAnim('dad', 'idle', true)
		end
	end
	
	if tag == 'jumpBF' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.4, 'sineIn')
	end
	
	if tag == 'jumpBFF' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.25, 'sineIn')
	end
	
	if tag == 'jumpBFs' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.5, 'sineIn')
	end
	
	if tag == 'fallBF' then
		setProperty('boyfriend.idleSuffix', '')
		objectPlayAnimation('bfLegs', 'idle'..bfLegsPrefix, true)
		if getProperty('boyfriend.animation.curAnim.name') == 'idle-j' then
			characterPlayAnim('boyfriend', 'idle', true)
		end
	end
end

function onMoveCamera(focus)
	setPropertyFromClass('flixel.FlxG.camera', 'target', nil)
	setProperty('camGame.zoom', 2)
	setProperty('camGame.x', 23*6)
	setProperty('camGame.y', 15*6)
	setProperty('camHUD.zoom', 0.8)
	setProperty('isCameraOnForcedPos', true)
	setProperty('camFollowPos.x', getPropertyFromClass('flixel.FlxG', 'width') / 2)
	setProperty('camFollowPos.y', getPropertyFromClass('flixel.FlxG', 'height') / 2)
	setProperty('camFollow.x', getPropertyFromClass('flixel.FlxG', 'width') / 2.5)
	setProperty('camFollow.y', getPropertyFromClass('flixel.FlxG', 'height') / 2)
end

starTrigger = false
curFrame = -1
function onEvent(n, v1, v2)

	if (n == 'Pixel Cam Shake') and fixwall == true then
		runTimer('snapcenter', v2, false)
	end
	
	if n == 'SonicUI' then
		if SonicUI == false then
			SonicUI = true
			if powerup == 2 then
				setProperty('rings2.visible', true)
				setProperty('rings1.visible', false)
				setProperty('ringsanimated.visible', false)
			
				setProperty('fireflower.visible', false)
				setProperty('mushroom.visible', false)
				setProperty('YOURFUCKED.visible', false)
			elseif powerup == 1 then
				setProperty('rings2.visible', false)
				setProperty('rings1.visible', true)
				setProperty('ringsanimated.visible', false)
			
				setProperty('fireflower.visible', false)
				setProperty('mushroom.visible', false)
				setProperty('YOURFUCKED.visible', false)
			elseif powerup == 0 then
				setProperty('rings2.visible', false)
				setProperty('rings1.visible', false)
				setProperty('ringsanimated.visible', true)
			
				setProperty('fireflower.visible', false)
				setProperty('mushroom.visible', false)
				setProperty('YOURFUCKED.visible', false)
			end
		else
		
		if powerup == 2 then
			setProperty('fireflower.visible', true)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', false)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		elseif powerup == 1 then
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', true)
			setProperty('YOURFUCKED.visible', false)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		elseif powerup == 0 then
			setProperty('fireflower.visible', false)
			setProperty('mushroom.visible', false)
			setProperty('YOURFUCKED.visible', true)
			
			setProperty('rings2.visible', false)
			setProperty('rings1.visible', false)
			setProperty('ringsanimated.visible', false)
		end
			SonicUI = false
		end
	end

	if n == 'Powerup Visuals' and v1 == 'bf-chase' then
		stopFlicker = false
		bfPrefix = v1
		powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
		setProperty('boyfriend.x', 37*6)
		setProperty('boyfriend.y', 28*6)
		setProperty('bfLegs.x', 37*6)
		setProperty('bfLegs.y', 26*6)
	end

	if n == 'Powerup Visuals' and v1 == 'bf-wall' then
		stopFlicker = false
		bfPrefix = v1
		powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
		setProperty('boyfriend.x', 0)
		setProperty('boyfriend.y', 0)
		setProperty('camHUD.visible', true)
		removeLuaSprite('luigiDead')
	end
	
	if n == 'Change Character' and v2 == 'marionear' then
		setProperty('dad.y', 29*6)
	end
	
	if n == 'Change Character' and v2 == 'mx' then
		if not starTrigger then
			starTrigger = true
			stopFlicker = true
			cancelTween('starFlicker')
		end
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9.1*6)
		setProperty('mxLegs.x', getProperty('dad.x'))
		isChase = true
	end
	
	if n == 'Powerup Visuals' and v1 == 'bf-chase' then
		if isChase == false then
			isChase = true
			setProperty('camGame.visible', true)
		end
	end
	
	if n == 'Change Character' and v2 == 'lordx' then
		switchScene(false)
	end
	
	if n == 'Change Character' and v2 == 'mx-angry' then
		stopFlicker = true
		cancelTween('starFlicker')
		legsSuffix = '-mad'
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9*6)
		setProperty('mxLegs.y', getProperty('dad.y'))
	end

	if n == 'Change Character' and v2 == 'mx-angry2' then
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9.05*6)
	end
	
	if n == 'Change Character' and v2 == 'big-mx' then
		stopFlicker = true
		cancelTween('starFlicker')
		isChase = false
		setProperty('dad.x', 0)
		setProperty('dad.y', 0)
		switchScene(true)
	end
	
	if n == 'end Pipe' then
		pipeEnd = true
		setProperty('pipeEnd.visible', true)
		setProperty('loop.visible', false)
		setProperty('empty.visible', true)
		for i,object in pairs(breakableObjects) do
			removeLuaSprite(object)
		end
		
		for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
			jumpTriggers[i] = true
		end
	end
	
	if n == 'Enter Pipe' then
		isChase = false
		removeLuaSprite('mxLegs')
		removeLuaSprite('bfLegs')
		setProperty('boyfriend.y', getProperty('boyfriend.y')-(4*6))
		runTimer('goIntoPipe', 0.05, 30)
		characterPlayAnim('dad', 'pause', true)
	end
	
	if n == 'Popup' then
		curFrame = curFrame + 1
		if curFrame < 5 then
			setProperty('popup.animation.curAnim.curFrame', curFrame)
			setProperty('popup.visible', true)
		else
			removeLuaSprite('popup')
		end
	end
	
	if n == 'Static' then
		if statictoggle == false then
			setProperty('staticFLASH.visible', true)
			statictoggle = true
		else
			setProperty('staticFLASH.visible', false)
			statictoggle = false
		end
	end
	
	if n == 'Unauthorized' then
		setProperty('BlackBox.visible', true)
		setProperty('unauthorized.visible', true)
		setProperty('camHUD.visible', false)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'snapcenter' then
		setProperty('camera.x',-127)
	end
	
	if tag == 'goIntoPipe' then
		setProperty('boyfriend.x', getProperty('boyfriend.x')-6)
	end
	
	if tag == 'jumpscare' then
		setProperty('fullscreen.visible', false)
		setProperty('fullscreen2.visible', true)
		runTimer('jumpscare2', 3, 0)
	end
	
	if tag == 'jumpscare2' then
		setProperty('fullscreen2.visible', false)
		setProperty('fullscreen3.visible', true)
		runTimer('closegame', 2, 0)
	end

	if tag == 'closegame' then
		os.exit();
	end

	
	if tag == 'countdown1' then
		removeLuaSprite('one')
		setProperty('two.visible', true)
		runTimer('countdown2', 0.63)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 1.25)
		allowCountdown = true
		startCountdown()
		for i=0, getProperty('opponentStrums.length')-1 do
			if not middlescroll then
				setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
				setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			else 
				setPropertyFromGroup('opponentStrums', i, 'visible', false)
				setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			end
			setPropertyFromGroup('opponentStrums', i, 'texture', 'smbNotes')
			setPropertyFromGroup('playerStrums', i, 'texture', 'smbNotes')
		end
		for i=0, getProperty('strumLineNotes.length')-1 do
			if middlescroll and downscroll then
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')+8*6)
			elseif not middlescroll and downscroll then
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')+10*6)
			end
			
			if middlescroll and not downscroll then
				setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')-4*6)
			end
		end
	end
	
	if tag == 'countdown2' then
		removeLuaSprite('two')
		setProperty('three.visible', true)
		runTimer('countdown3', 0.1)
		removeLuaSprite('Blackbgintro')
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 0.25)
	end
	
	if tag == 'countdown3' then
		removeLuaSprite('three')
		setProperty('go.visible', true)
		runTimer('countdown4', 0.63)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 0.25)
	end
	
	if tag == 'countdown4' then
		removeLuaSprite('go')
	end
end

function switchScene(isWall)
	if isWall then
		fixwall = true
		setProperty('flash.visible', true)
		setProperty('camera.x',-127)
		isChase = false
		setObjectOrder('hiddenWall', getObjectOrder('dadGroup') - 1)
		setObjectOrder('boyfriendGroup', getObjectOrder('hiddenWall') + 2)
		makeLuaSprite('luigiDead', 'pcport/luigi', 0, 0)
		setProperty('luigiDead.antialiasing', false)
		scaleObject('luigiDead', 6, 6)
		updateHitbox('luigiDead')
		addLuaSprite('luigiDead', true)
		
		for i,object in pairs(breakableObjects) do
			setProperty(object..'.visible', false)
		end
		
		setProperty('brickscroll.visible', false)
		setProperty('hiddenWall.visible', true)
		setProperty('camHUD.visible', true)
		setProperty('mxLegs.visible', false)
		setProperty('bfLegs.visible', false)
		setProperty('loop.visible', false)
	else
		removeLuaSprite('hiddenWall')
		setProperty('brickScroll.visible', true)
		
		for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
				jumpTriggers[i] = false
			end
		
		startTrigger = false
		for i,object in pairs(breakableObjects) do
			objectPlayAnimation(object, 'idle', true)
		end
		setProperty('loop.x', -2119 * 6)
	end
end












function onStepHit()

	--- So the camera doesn't zoom on a beat hit.

	if curStep >= 1 then
		setProperty('camZooming', false)
	end

	--- Monika entrance

	if curStep >= 312 and curStep <= 568 then
		setProperty('gf.alpha', 1)
	end
	if curStep == 568 then
		setProperty('gf.alpha', 0)
	end

	--- Transition nes - genesis (prey)
	if curStep == 764 then
		setProperty('staticFLASH.visible', true)
		setProperty('soniclegs.visible', true)
		setProperty('soniclegsoverlay.visible', true)
		setProperty('goal.visible', false)
		setProperty('flagpole.visible', false)
	end
	if curStep == 768 then
		setProperty('staticFLASH.visible', false)
	end

	--- Transition genesis - nes

	if curStep == 893 then
		setProperty('staticFLASH.visible', true)
		removeLuaSprite('soniclegs')
		removeLuaSprite('soniclegsoverlay')
	end
	if curStep == 896 then
		setProperty('staticFLASH.visible', false)
	end


	--- Making sure the flagpole isnt visible after the first scene (sometimes it can bug and appear during the wall section)

	if curStep >= 900 then
		setProperty('flagpole.visible', false)
		setProperty('goal.visible', false)
	end

	--- Changes BF's legs texture for 8owsers's one by overwriting his tag ("bf-legs") and also makes mx legs invisible.

	if curStep == 895 then
		setProperty('flagpole.visible', true)
		setProperty('goal.visible', true)
		makeAnimatedLuaSprite('bfLegs', 'pcport/8owserlegs', 225, 8.95*6)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 30, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 30, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 30, true)
		setProperty('bfLegs.antialiasing', false)
		addLuaSprite('bfLegs')
	end
	if curStep >= 894 and curStep <= 1039 then
		doTweenAlpha('mxLegs', 0, 0.01, 'linear')
	end

	--- Trying to make Xenophanes not jumping over gaps


	if curStep == 896 then
		mxLegsHighY = 30
		mxLegsDefY = 30
	end
	if curStep == 1039 then
		setProperty('mxPoint.y', getProperty('mxLegs.y'))
		mxLegsHighY = getProperty('mxLegs.y') - (40*6)
		mxLegsDefY = 50
	end

	--- Makes mx legs invisible during xeno's turn

	if curStep >= 896 and curStep <= 1024 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/legsempty', 70*6, 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
	end

	--- Change 8owser's legs to conner's

	if curStep == 1024 then
		makeAnimatedLuaSprite('bfLegs', 'pcport/connerlegs', 225, 8.95*6)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 12, true)
		setProperty('bfLegs.antialiasing', false)
		addLuaSprite('bfLegs')
		objectPlayAnimation('bfLegs', 'jump', true)
	end

	--- For the wall section, makes fatal fade out and yuri fade in (had problem with the layer priority so it was my only solution)

	if curStep == 1658 then
		makeAnimatedLuaSprite('fadewall1', 'fadewall1', 0, 0)
		addAnimationByPrefix('fadewall1', 'fadewall1', 'fadewall1', 6, false)
		objectPlayAnimation('fadewall1', 'fadewall1')
		setProperty('fadewall1.antialiasing', false)
		scaleObject('fadewall1', 6, 6)
		addLuaSprite('fadewall1', true)
	end

	--- Same thing but it's white instead of black (dont post that on twitter or people will interpret it differently)
	
	if curStep == 1791 then
		objectPlayAnimation('flash', 'flash')
	end
	if curStep == 1919 then
		objectPlayAnimation('flash', 'flash')
	end

	--- Change leg's to lucas/luigi's
	
	if curStep == 2176 then
		makeAnimatedLuaSprite('bfLegs', 'pcport/lucaslegs', 225, 95.7)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 12, true)
		setProperty('bfLegs.antialiasing', false)
		scaleObject('bfLegs', 6, 6)
		addLuaSprite('bfLegs')
	end

	--- Waluigis legs

	if curStep == 1312 then
		makeAnimatedLuaSprite('bfLegs', 'pcport/waluigilegs', 225, 95.7)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall', 12, true)
		setProperty('bfLegs.antialiasing', false)
		scaleObject('bfLegs', 6, 6)
		addLuaSprite('bfLegs')
		objectPlayAnimation('bfLegs', 'jump', true)
	end


	--- Re add mx legs for the singing part after the "inoncent isnt that far or smth"

	if curStep == 1280 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/legs', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
	end

	--- Re delete mx legs

	if curStep == 1344 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/legsempty', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
		mxLegsHighY = 30
		mxLegsDefY = 30
	end

	--- Re add mx legs for the wahoo

	if curStep == 1399 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/legs', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
		mxLegsHighY = getProperty('mxLegs.y') - (40*6)
		mxLegsDefY = 50
	end

	--- Fleetway and shaggy (stop the jumps)
	
	if curStep >= 1151 and curStep <= 1280 then
		for i=1, #jumpTriggers do
			jumpTriggers[i] = true
		end
		makeAnimatedLuaSprite('bfLegs', 'pcport/bflegsempty', 70*6, 8.95*6)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 30, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 30, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 30, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 30, true)
		setProperty('bfLegs.antialiasing', false)
		addLuaSprite('bfLegs')
		setProperty('bfLegs.visible', false)
	end
	if curStep >= 1280 then
		for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
			jumpTriggers[i] = false
		end
	end

	if curStep == 1168 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/legsempty', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
	end

	--- Tweens for fleetway (so he doesnt colide with objects yes ik stfu)
	if curStep == 1158 then
		jumpTriggers[12] = true
		doTweenY('jumpMX', 'mxPoint', mxLegsHighY, 0.45, 'sineOut')
		objectPlayAnimation('mxLegs', 'jump', true)
		setProperty('dad.idleSuffix', '-j')
		if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad', 'idle-j', true)
		end
	end
	if curStep == 1161 then
		doTweenY('avoid', 'bfPoint', -60, 0.45, 'quadInOut')
	end
	if curStep == 1166 then
		doTweenY('avoid1', 'bfPoint', 130, 0.45, 'quadInOut')
	end
	if curStep == 1200 then
		doTweenY('avoid2', 'bfPoint', -60, 0.45, 'quadInOut')
	end
	if curStep == 1204 then
		doTweenY('avoid2', 'bfPoint', 130, 0.45, 'quadInOut')
	end
	if curStep == 1230 then
		doTweenY('avoid3', 'bfPoint', -60, 0.45, 'quadInOut')
	end
	if curStep == 1240 then
		doTweenY('avoid4', 'bfPoint', 130, 0.45, 'quadInOut')
	end
	if curStep == 1293 then
		doTweenY('avoid5', 'bfPoint', -60, 0.45, 'quadInOut')
	end
	if curStep == 1297 then
		doTweenY('avoid6', 'bfPoint', 130, 0.45, 'quadInOut')
	end
	
	---Shagy
	
	if curStep == 1202 then
		doTweenY('avoidSHAG', 'mxPoint', -100, 0.45, 'quadInOut')
	end
	if curStep == 1208 then
		doTweenY('avoidSHAG2', 'mxPoint', 50, 0.45, 'quadInOut')
	end
	if curStep == 1233 then
		doTweenY('avoidSHAG3', 'mxPoint', -100, 0.45, 'quadInOut')
	end
	if curStep == 1243 then
		doTweenY('avoidSHAG4', 'mxPoint', 50, 0.45, 'quadInOut')
	end


	--- End of the tweens

	if curStep == 1040 then
		makeAnimatedLuaSprite('mxLegs', 'pcport/clownconnerlegs', getProperty('dad.x')+17*6+2, 0)
		addAnimationByPrefix('mxLegs', 'idle', 'runfire', 14, true)
		addAnimationByPrefix('mxLegs', 'jump', 'jumpfire', 12, true)
		setProperty('mxLegs.antialiasing', false)
		scaleObject('mxLegs', 6, 6)
		addLuaSprite('mxLegs')
	end


	--- Chara's legs 
	
	if curStep == 1407 then
		makeLuaSprite('red','red',0,0)
		setProperty('red.antialiasing', false)
		setObjectOrder('red',getObjectOrder('boyfriendGroup')+1)
		addLuaSprite('red')
		setProperty('red.visible', true)
	end
	if curStep == 1412 then
		doTweenAlpha('red', 'red', 0, 0.6, 'quadOut')
	end
	if curStep == 1407 then
		makeAnimatedLuaSprite('bfLegs', 'pcport/charalegs', 225, 95.7)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 12, true)
		setProperty('bfLegs.antialiasing', false)
		scaleObject('bfLegs', 6, 6)
		addLuaSprite('bfLegs')
		mxLegsHighY = 30
		mxLegsDefY = 30
		makeAnimatedLuaSprite('mxLegs', 'pcport/legsempty', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
		setProperty('camera.y', 130)
	end
	if curStep == 1520 then
		setProperty('BlackBox.alpha', 0)
		setProperty('BlackBox.visible', true)
		doTweenAlpha('BlackBox', 'BlackBox', 1, 0.75, 'quadOut')
	end
	if curStep == 1530 then
		setProperty('camera.y', 90)
		removeLuaSprite('red')
		setProperty('mxPoint.y', getProperty('mxLegs.y'))
		mxLegsHighY = getProperty('mxLegs.y') - (40*6)
		mxLegsDefY = 50
	end
	if curStep == 1531 then
		setProperty('BlackBox.visible', false)
	end

	---Tails Part

	if curStep == 2048 then
		-- Alright, dw everythings alright. First of, we "remove" mx legs for lordX
		makeAnimatedLuaSprite('mxLegs', 'pcport/legsempty', getProperty('dad.x'), 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
		-- We make a bg element visible (the fire)
		setProperty('fireloop.visible', true)
		setProperty('firebgloop.visible', true)
		-- We change bf's legs to tails's-... tails i guess
		makeAnimatedLuaSprite('bfLegs', 'pcport/tailstails', 54*4.2, 42*4.2)
		addAnimationByPrefix('bfLegs', 'idle', 'run0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump', 'jump0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 19, true)
		addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 12, true)
		addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 14, true)
		addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 12, true)
		setProperty('bfLegs.antialiasing', false)
		scaleObject('bfLegs', 4, 4)
		addLuaSprite('bfLegs')
		setObjectOrder('bfLegs', getObjectOrder('dadGroup')-0.05)
		-- We get rid of that pesky wall sections stuff
		removeLuaSprite('hiddenWall')
		setProperty('brickScroll.visible', false)
		setProperty('loop.visible', false)
		--Trying to make the objects invisible
		for i,object in pairs(breakableObjects) do
			setProperty(object..'.visible', false)
		setProperty('boyfriend.y', 27*6)
		end
	end
	if curStep >= 2047 and curStep <= 2050 then
		setProperty('loop.visible', false)
	end
	if curStep == 2160 then
		makeAnimatedLuaSprite('giantring', 'giantring', -300, 0)
		addAnimationByPrefix('giantring', 'giantring', 'giantring', 20, false)
		objectPlayAnimation('giantring', 'giantring')
		setProperty('giantring.antialiasing', false)
		scaleObject('giantring', 4, 4)
		addLuaSprite('giantring', true)
		setProperty('bfLegs.visible', false)
		doTweenY('jumpingtails', 'boyfriend', 10, 0.45, 'quadOut')
		doTweenX('giantringpassingby', 'giantring', 700, 1, 'linear')
	end
	if curStep == 2164 then
		setProperty('boyfriend.visible', false)
		makeLuaSprite('white', 'white', 0, 0)
		setProperty('white.antialiasing', false)
		scaleObject('white', 59, 59)
		addLuaSprite('white', true)
		setProperty('white.visible', true)
		setProperty('white.alpha', 0)
		doTweenAlpha('whitefade', 'white', 1, 0.35, 'quadIn')
	end
	if curStep == 2175 then

		setProperty('gf.alpha', 1)
		setProperty('girlfriend.x', 54*4.2)
		setProperty('girlfriend.y', 10)
		setProperty('gf.flipX', false)
		doTweenY('killyourself', 'gf', 25*6, 0.35, 'quadIn')
		makeAnimatedLuaSprite('tailstails', 'pcport/tailstails', 87*4.2, getProperty('girlfriend.y'))
		addAnimationByPrefix('tailstails', 'run', 'run', 24, true)
		setProperty('tailstails.antialiasing', false)
		scaleObject('tailstails', 4.2, 4.2)
		addLuaSprite('tailstails', false)
		setProperty('tailstails.visible', true)
		setObjectOrder('tailstails', getObjectOrder('gfGroup')-0.05)
	end
	if curStep >= 2174 then
		setProperty('tailstails.y', (getProperty('gf.y')))
		objectPlayAnimation('tailstails', 'run0')
	end
	if curStep == 2176 then
		setProperty('flashall.visible', true)
		objectPlayAnimation('flashall', 'flash')
		makeAnimatedLuaSprite('flash', 'flash', 0, 0)
		addAnimationByPrefix('flash', 'flash', 'flash', 5, false)
		objectPlayAnimation('flash', 'flash')
		setProperty('flash.antialiasing', false)
		scaleObject('flash', 50, 50)
		addLuaSprite('flash', true)
		removeLuaSprite('white')
	end
	if curStep == 2174 then
		setProperty('bfLegs.visible', true)
		removeLuaSprite('giantring')
		makeAnimatedLuaSprite('giantringbackward', 'giantringbackward', 200, 0)
		addAnimationByPrefix('giantringbackward', 'giantringbackward', 'giantringbackward', 35, false)
		objectPlayAnimation('giantringbackward', 'giantringbackward')
		setProperty('giantringbackward.antialiasing', false)
		scaleObject('giantringbackward', 4, 4)
		addLuaSprite('giantringbackward', false)
		doTweenX('giantringpassingbybutintheotherway', 'giantringbackward', 1500, 1, 'linear')
		setProperty('boyfriend.visible', true)
		setProperty('bfLegs.visible', true)
		setProperty('boyfriend.x', 37*6)
		setProperty('boyfriend.y', 28*6)
		setProperty('bfLegs.x', 37*6)
		setProperty('bfLegs.y', 26*6)
		setProperty('loop.visible', true)
		isChase = true
		setProperty('brickScroll.visible', true)
		removeLuaSprite('fireloop')
		removeLuaSprite('firebgloop')
		makeAnimatedLuaSprite('mxLegs', 'pcport/legs', 80*6, 8.95*6)
		addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
		addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
		addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
		setProperty('mxLegs.antialiasing', false)
		addLuaSprite('mxLegs')
		setProperty('mxLegs.visible', true)
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9.05*6)
		TailsMomento = true
	end
	-- Sigh
		if getProperty('gf.animation.curAnim.name') == 'idle' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'idle' then
			setProperty('tailstails.visible', true)
		end

		if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('gf.animation.curAnim.name') == 'singUP' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
			setProperty('tailstails.visible', true)
		end



		if getProperty('girlfriend.animation.curAnim.name') == 'singDOWN' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'singLEFT' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'singUP' then
			setProperty('tailstails.visible', true)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'singRIGHT' then
			setProperty('tailstails.visible', true)
		end


		if getProperty('girlfriend.animation.curAnim.name') == 'down' then
			setProperty('tailstails.visible', true)
		end



		if getProperty('gf.animation.curAnim.name') == 'jump' then
			setProperty('tailstails.visible', false)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'jump' then
			setProperty('tailstails.visible', false)
		end

		if getProperty('gf.animation.curAnim.name') == 'fall' then
			setProperty('tailstails.visible', false)
		end
		if getProperty('girlfriend.animation.curAnim.name') == 'fall' then
			setProperty('tailstails.visible', false)
		end

	if curStep >= 2048 then
		setProperty('camGame.visible', true)	
	end
	if curStep == 2024 then
		setProperty('BlackFlash.visible', true)
		setProperty('BlackFlash.alpha', 0)
		doTweenAlpha('BlackFlash', 'BlackFlash', 1, 0.5, 'quadOut')
	end
	if curStep == 2048 then
	setProperty('BlackFlash.visible', false)
	--	setProperty('BlackFlash.alpha', 1)
	--	doTweenAlpha('BlackFlash', 'BlackFlash', 0, 1, 'quadOut')
		setProperty('HAHAHA.visible', false)
	end
	if curStep >= 2047 and curStep <= 2174 then
			for i=1, #jumpTriggers do
			jumpTriggers[i] = true
		end
	end
	if curStep >= 2048 then
		removeLuaSprite('hiddenWall')
	end
	
	if curStep == 2192 then
		setProperty('BlackBox.alpha', 1)
		setProperty('blackbox.visible', false)
	end

	-- Tails jump
	if curStep == 2192 then
		doTweenY('jumpingtails', 'gf', 10, 0.45, 'quadOut')
	end
	if curStep == 2196 then
		doTweenY('fallingtails', 'gf', 25*6, 0.45, 'quadIn')
	end
	
	if curStep == 2206 then
		doTweenY('jumpingtails1', 'gf', 10, 0.45, 'quadOut')
	end
	if curStep == 2210 then
		doTweenY('fallingtails1', 'gf', 25*6, 0.45, 'quadIn')
	end

	if curStep == 2228 then
		doTweenY('jumpingtails2', 'gf', -15, 0.35, 'quadOut')
	end
	if curStep == 2234 then
		doTweenY('fallingtails2', 'gf', 25*6, 0.50, 'quadIn')
	end

	if curStep == 2240 then
		doTweenY('jumpingtails3', 'gf', -10, 0.45, 'quadOut')
	end
	if curStep == 2245 then
		doTweenY('fallingtails3', 'gf', 25*6, 0.45, 'quadIn')
	end

	if curStep == 2252 then
		doTweenY('jumpingtails7', 'gf', -15, 0.45, 'quadOut')
	end
	if curStep == 2257 then
		doTweenY('fallingtails7', 'gf', 25*6, 0.45, 'quadIn')
	end

	if curStep == 2262 then
		doTweenY('jumpingtails8', 'gf', 10, 0.35, 'quadOut')
	end
	if curStep == 2267 then
		doTweenY('fallingtails8', 'gf', 25*6, 0.35, 'quadIn')
	end

	if curStep == 2272 then
		doTweenY('jumpingtails9', 'gf', -10, 0.45, 'quadOut')
	end
	if curStep == 2277 then
		doTweenY('fallingtails9', 'gf', 25*6, 0.45, 'quadIn')
	end

	if curStep == 2288 then
		doTweenY('jumpingtails4', 'gf', -20, 0.45, 'quadOut')
	end
	if curStep == 2295 then
		doTweenY('fallingtails4', 'gf', 25*6, 0.35, 'quadIn')
	end

	if curStep == 2303 then
		doTweenY('jumpingtails5', 'gf', 20, 0.35, 'quadOut')
	end
	if curStep == 2307 then
		doTweenY('fallingtails5', 'gf', 25*6, 0.35, 'quadIn')
	end
	if curStep == 2336 then
		setProperty('tailstails.visible', false)
		doTweenX('endingtails', 'gf', 470, 0.65, 'quadIn')
	end
    if curStep == 2350 then
		setProperty('bluefilter.visible', true)
		setProperty('botplayTxt.visible', false)
    end
	if curStep == 768 then
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'preyarrows');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'preyarrows');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'preyarrows');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'preyarrows');
		setPropertyFromGroup('playerStrums', 0, 'texture', 'preyarrows');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'preyarrows');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'preyarrows');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'preyarrows');
	elseif curStep == 896 then
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 0, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'smbNotes');
	end
	if curStep == 2032 then
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'sonicNotes');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'sonicNotes');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'sonicNotes');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'sonicNotes');
		setPropertyFromGroup('playerStrums', 0, 'texture', 'sonicNotes');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'sonicNotes');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'sonicNotes');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'sonicNotes');
	elseif curStep == 2176 then
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'smbNotes');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 0, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'smbNotes');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'smbNotes');
	end
	
	
	if curStep == 2032 then
		setProperty('camGame.visible', true)
		setProperty('HAHAHA.visible', true)
		objectPlayAnimation('HAHAHA', 'HAHAHA')
	end
end