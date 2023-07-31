local lowHealthFX=false
local Path='stage/MikeBedroom/'
function onCreate()
	setProperty('skipCountdown',true)
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	addLuaScript('scripts/Stuff/Character.lua')
	consistentResize=1
	consistentPosition={-300, 100}

	makeLuaSprite('background',Path..'back', consistentPosition[1], consistentPosition[2])
	setScrollFactor('background', 0.7, 0.7)
	StageStuff('background')

	makeLuaSprite('portrait',Path..'portrait', consistentPosition[1], consistentPosition[2])
	setScrollFactor('portrait', 0.7, 0.7)
	StageStuff('portrait')

	makeLuaSprite('lacama',Path..'bed', consistentPosition[1], consistentPosition[2])
	setScrollFactor('lacama', 0.9, 0.9)
	StageStuff('lacama')

	makeLuaSprite('laalmuada',Path..'pillow', consistentPosition[1], consistentPosition[2])
	setScrollFactor('laalmuada', 0.9, 0.9)
	StageStuff('laalmuada')

	makeLuaSprite('redOverlay',Path..'redoverlay',0,0)
	setScrollFactor('redOverlay', 0, 0)
    setObjectCamera('redOverlay','hud')
	addLuaSprite('redOverlay')
   setProperty('redOverlay.alpha',0.04)

end
function onCreatePost()
	callScript('scripts/Stuff/Character.lua','CreateCharacter',{'StevenP2','DAD',100,500,'OtherSteven'})
    setProperty('OtherSteven.visible',false)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'DissensionDeath')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DissensionDeath')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '')
    setProperty('boyfriend.visible',false)
	setObjectOrder('boyfriendGroup',getObjectOrder('laalmuada')+1)

end
function onGameOver()
    removeLuaScript('scripts/Stuff/CameraMove.lua')
end
function onGameOverStart()
	addHaxeLibrary('GameOverSubstate')
	cameraFlash('game','0x6CFC0000',0.5)
    runHaxeCode([[
        GameOverSubstate.instance.boyfriend.screenCenter(XY);
	]])
end
function StageStuff(tag)
	scaleObject(tag,consistentResize,consistentResize)
	if tag=='lacama' or tag=='laalmuada' then
        addLuaSprite(tag,true)
	else
		addLuaSprite(tag)
    end
	setProperty(tag..'.visible',false)
end
function onUpdate(elapsed)
    if lowHealthFX then
		cameraShake('hud',0.002, 0.01)
		cameraShake('game',0.002, 0.01)
	end
	
end
function onUpdatePost(elapsed)
	if dadName~='StevenFp' then
		setProperty('iconP2.animation.curAnim.curFrame',0)
	else
		setProperty('iconP2.animation.curAnim.curFrame',1)
	end
end
function onEvent(eventName, value1, value2)
    if eventName=='Steven Goodbye' then
		lowHealthFX = not lowHealthFX


		if lowHealthFX then
			setProperty('camGame.visible',false)
			setProperty('camHUD.visible',false)
            runTimer('Spawn',1)

			setProperty('dad.alpha',0.45)
			setProperty('boyfriend.alpha',0.45)
		else
			doTweenAlpha('redOverlay','redOverlay',0,1.5,'quadInOut')
		end
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='Spawn' then
		setProperty('camGame.visible',true)
		setProperty('camHUD.visible',true)
	end
end
function onBeatHit()
    if lowHealthFX then
        setProperty('redOverlay.alpha',0.85)
		doTweenAlpha('redOverlay','redOverlay',0.65,0.25,'quadInOut')
	end
end