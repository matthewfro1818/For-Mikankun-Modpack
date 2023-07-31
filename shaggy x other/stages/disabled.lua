local runningAway = false;

function onCreate()

	makeLuaSprite('background2', 'pokemon battle/background2', -1000, -600);
	addLuaSprite('background2', false)
	setGraphicSize('background2', '8000', '4000')
	setLuaSpriteScrollFactor('background2', 0.125, 0.5);
	setProperty('background2.visible', false)

	makeLuaSprite('background', 'pokemon battle/background', -1000, -600);
	addLuaSprite('background', false)
	setGraphicSize('background', '8000', '4000')
	setLuaSpriteScrollFactor('background', 0.125, 0.5);

	makeLuaSprite('place1', 'pokemon battle/Purple_place', 2400, 1000);
	addLuaSprite('place1', false)
	setGraphicSize('place1', '1000', '500')
	--setLuaSpriteScrollFactor('place1', 0.8, 0.8);
	--setProperty('place1.offset.y', 'getProperty(place1.offset.y) -= 64')
	
	makeLuaSprite('place2', 'pokemon battle/Purple_place', 1350, 1270);
	addLuaSprite('place2', false)
	setGraphicSize('place2', '1250', '750')
	--setLuaSpriteScrollFactor('place1', 0.8, 0.8);
	--setProperty('place2.offset.y', 'getProperty(place2.offset.y) -= 32')
	--setProperty('place2.offset.x', 'getProperty(place2.offset.x) -= 16')\
end

function onUpdate(elapsed)
	if (not runningAway) then
		xx2 = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
		yy2 = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
	end


	if mustHitSection == true then
		setProperty('defaultCamZoom', 0.76);
	else
		setProperty('defaultCamZoom', 0.65);
	end
	
	if (curStep > 2053) then
		runningAway = true
	end
	
	--plateL.setPosition(PlayState.dadOpponent.x + (PlayState.dadOpponent.width / 2) - (plateL.width / 2), PlayState.dadOpponent.y + PlayState.dadOpponent.height - (plateL.height / 2));
    --setProperty('place2.x', getProperty('dad.x') - (getProperty('place2.height')/ 1.7))
	setProperty('dad.x', getProperty('place2.x') + (getProperty('place2.height')/ 1.7))
	setProperty('dad.y', getProperty('place2.y') - (getProperty('place2.width') / 4) / 5)
	if (not runningAway) then
		--plateR.setPosition(PlayState.boyfriend.x + (PlayState.boyfriend.width / 2) - (plateR.width / 2), PlayState.boyfriend.y + PlayState.boyfriend.height - (plateR.height / 2));
		--setProperty('place1.x', getProperty('boyfriend.x') - (getProperty('place1.height')/ 1.7))
		setProperty('boyfriend.x', getProperty('place1.x') + (getProperty('place1.height')/ 1.7))
		--setProperty('boyfriend.y', getProperty('place1.y') - (getProperty('place1.width')/ 1.7))
	else
		setProperty('boyfriend.x', (getProperty('boyfriend.x') - (elapsed / (1 / 60)) * 16))
        triggerEvent('Camera Follow Pos',xx2,yy2)
		--PlayState.boyfriend.x -= (elapsed / (1 / 60)) * 16
	end
end