function onCreate()
	makeLuaSprite('bg','BgBack', -277, -166)
	addLuaSprite('bg',false)
	makeLuaSprite('bgFronta','BgFront',-526, -197)
	addLuaSprite('bgFronta',true)
	setObjectOrder('gfGroup',3)
	setObjectOrder('boyfriendGroup',4)
	setObjectOrder('bgFronta',2)
	setObjectOrder('dadGroup',1)
	setGraphicSize('boyfriend',1.6,1.6)
	setGraphicSize('gf',1.6,1.6)
	setProperty('gf.flipX', true)
end

function onUpdate()
	if mustHitSection == false then
		setProperty('defaultCamZoom',1.5)
	else
		setProperty('defaultCamZoom',0.9)
	end
end