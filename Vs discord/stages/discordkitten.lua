function onCreate()
	makeLuaSprite('back-bg','bg folder because I can/BG_Back', -1000, 0)
	addLuaSprite('back-bg')
	
	makeAnimatedLuaSprite("peoples", "bgpeople", -1000, 0)
	addAnimationByPrefix('peoples','idle','backgroundPeople',60,true)
	addLuaSprite("peoples")

	makeAnimatedLuaSprite("peoples", "backgroundpeople", -475, 200)
	addAnimationByPrefix('peoples','idle','backgroundPeople',60,true)
	addLuaSprite("peoples")

	makeLuaSprite('bg','bg folder because I can/BG', -1000, 0)
	addLuaSprite('bg')

	makeAnimatedLuaSprite("depression", "depression", 400, 400)
	addAnimationByPrefix('depression','depression','depression',60,true)
	addLuaSprite("depression")

	makeLuaSprite('balls','bg folder because I can/balls_or_smth', -1000, 0)
	addLuaSprite('balls')

	scaleObject("back-bg", 2.5, 2.5)
	scaleObject("balls", 2.5, 2.5)
	scaleObject("bg", 2.5, 2.5)
	scaleObject("peoples", 0.6, 0.6)
	scaleObject("depression", 1.75, 1.75)

	setProperty("camGame.alpha", 0)
end

function onUpdate(elapsed)
	if keyboardJustPressed("F11") then
		if not getPropertyFromClass("openfl.Lib", "application.window.fullscreen") then
			setPropertyFromClass("openfl.Lib", "application.window.fullscreen",true)
		else
		setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
		end
	end
end
function onMoveCamera(target)
	if target == 'dad' then
		setProperty('defaultCamZoom',1)
	else
		setProperty('defaultCamZoom',1.3)
	end
end
function onStartCountdown()
    doTweenZoom("FYGUIIUHAFUIAHSFUIAUHISF", "camGame",1,3,'quartOut')
    setProperty('defaultCamZoom',1)
    doTweenAlpha("Hasfasfasfasf", "camGame", 1, 1, "quartOut")
end