local Path='stage/Glitchy/'
function onCreate()
	initSaveData('HypnosPref')
    setProperty('skipCountdown',true)
    IsTalking=false
    Red=0.15
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	callScript('scripts/Stuff/PlayStuff.lua','FlipHealthBar')
	callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{-300, 200})
	
	setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.15)

	makeLuaSprite('BG',Path..'glitch_City', -1400, -725)
	setScrollFactor('BG', 0.8, 0.8)
	scaleObject('BG', 0.625, 0.625,false)

	makeLuaSprite('Tiles',Path..'tiles', -1400, -725)
	setScrollFactor('Tiles', 0.9, 0.9)
	scaleObject('Tiles', 0.625, 0.625,false)

	makeLuaSprite('Haze',Path..'haze', -1400, -725)
	setScrollFactor('Haze', 0.9, 0.9)
	scaleObject('Haze', 0.625, 0.625,false)
	

	addLuaSprite('BG', false);
	addLuaSprite('Tiles', false);
	addLuaSprite('Haze', false);

	makeAnimatedLuaSprite('legacyCutscene',Path..'RedSpeak',500, 50)
    addAnimationByPrefix('legacyCutscene','speech','GlitchySpeak',24,false)
    scaleObject('legacyCutscene',1.25,1.25)
	setObjectCamera('legacyCutscene','other')
	setProperty('legacyCutscene.alpha',0.0001)
	setProperty('legacyCutscene.visible',false)
	addLuaSprite('legacyCutscene',false)
	
--[[
	"boyfriend": [-1000, 100],
	"girlfriend": [-200, 130],
	"opponent": [0, -325]
]]
	
	
end
function onCreatePost()
for i=0,7 do 
    if i<4 then
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	else
		if not middlescroll then
		    setPropertyFromGroup('strumLineNotes',i,'x',getPropertyFromGroup('strumLineNotes',i-4,'x'))
		end
	end
end
end
function onUpdate(elapsed)
	if getProperty('legacyCutscene.animation.curAnim.finished') and IsTalking then
		IsTalking=false
		setProperty('defaultCamZoom',0.7)
		setProperty('camGame.zoom',0.7)
		setProperty('legacyCutscene.visible',false)
		setProperty('camGame.visible',false)
		setProperty('camHUD.alpha',0)
		runTimer('EndSpeak',0.5)
	end
	if getSongPosition()> 45950 and getDataFromSave('HypnosPref','Hell mode',false) then
		if getHealth() >= 0.050 then addHealth(-(0.0035 * ((elapsed) * 120))) end
	end
end
function onEvent(eventName, value1, value2)
	if eventName=='Glitchy Red Speech' then
		IsTalking=true
		setProperty('defaultCamZoom',1.25)
		setProperty('camGame.zoom',1.25)
		setProperty('camGame.alpha',0.001)
		setProperty('iconP1.visible',false)
		setProperty('iconP2.visible',false)
		setProperty('healthBar.alpha',0)
		if luaTextExists('Score') then
			setProperty('Score.visible',false)
			setProperty('Accuary.visible',false)
			setProperty('MissRank.visible',false)
			setProperty('Songname.visible',false)
			setProperty('Version.visible',false)
		else
			setProperty('scoreTxt.visible',false)
			setProperty('timeBar.visible',false)
			setProperty('timeTxt.visible',false)
		end
		runTimer('HideStrum',1)
		runTimer('StartSpeak',0.4)
		setProperty('legacyCutscene.visible',true)
		playAnim('legacyCutscene','speech',true,0)
		setProperty('dad.visible',false)
		setProperty('gf.visible',false)
		setProperty('boyfriend.visible',false)
	end
	if eventName=='Better Character Change' then
		setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.175)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag=='HideStrum' then
    doTweenAlpha('HideStrum','camHUD',0,3,'quartinout')
end
if tag=='StartSpeak' then
	doTweenAlpha('RevelerGame','camGame',0.5,1.6,'quartinout')
	setProperty('legacyCutscene.x',getProperty('legacyCutscene.x')+ 150)
	doTweenX('RedSpeechX','legacyCutscene',getProperty('legacyCutscene.x')- 150,9,'quartinout')
	doTweenAlpha('RedSpeechAlpha','legacyCutscene',1,9,'quartinout')
	

end
if tag=='EndSpeak' then
	setProperty('camGame.zoom',0.9)
	setProperty('camGame.alpha',1)
	setProperty('camGame.visible',true)
	setProperty('iconP1.visible',true)
	setProperty('iconP2.visible',true)
	setProperty('healthBar.alpha',1)
	if luaTextExists('Score') then
		setProperty('Score.visible',true)
		setProperty('Accuary.visible',true)
		setProperty('MissRank.visible',true)
		setProperty('Songname.visible',true)
		setProperty('Version.visible',true)
	else
		setProperty('scoreTxt.visible',true)
		setProperty('timeBar.visible',true)
		setProperty('timeTxt.visible',true)
	end
	setProperty('dad.visible',true)
	setProperty('gf.visible',true)
	setProperty('boyfriend.visible',true)
	setProperty('camHUD.alpha',1)

end
end