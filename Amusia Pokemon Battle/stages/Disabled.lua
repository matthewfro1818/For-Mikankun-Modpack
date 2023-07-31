--Code made by Drawoon_
--if you use this please give me credit
function onCreate()
	Ponyta=0.05
	Disabled=-0.15
	intensity=0.0125
	HoverNotes=false
	hoverFactor=0
	useTerror=false
	OriginalXNotes={}
	horizontalFactor=0
	runningAway=false
	addHaxeLibrary('Application', 'lime.app')
addCharacterToList('Ponyta_Perspective','bf')
addCharacterToList('Disabled','dad')
	setProperty('skipCountdown',true)
	if shadersEnabled then initLuaShader('pincushion') end
	makeLuaSprite('background', 'background', 0, 0);
	scaleObject('background',1.5,1.5)
	screenCenter('background','xy')
	setScrollFactor('background', 0.125, 0.5);
	makeLuaSprite('background2', 'background2', 0, 0);
	scaleObject('background2',1.5,1.5)
	screenCenter('background2','xy')
	setScrollFactor('background2', 0.125, 0.5);

	makeLuaSprite('QuestionareBackground', 'questionare', 0,0);
	scaleObject('QuestionareBackground',0.25,0.25)

	makeAnimatedLuaSprite('WigglesQuest','wiggles_questionare',525,50)
    addAnimationByPrefix('WigglesQuest','idle','questionnaire idle',24,true)
    addAnimationByPrefix('WigglesQuest','give','Give me your sing',24,false)
    addAnimationByPrefix('WigglesQuest','angry','angry',24,true)


	makeAnimatedLuaSprite('WigglesQuestClose','Givemeyoursing',0,-500)
    addAnimationByPrefix('WigglesQuestClose','glitch','Upfront',24,false)
	addAnimationByPrefix('WigglesQuestClose','loop','stareLoop',24,true)
	
	makeLuaSprite('plateL', 'Purple_place', 0, 0);
	setProperty('plateL.offset.y',-64)

	makeLuaSprite('plateR', 'Purple_place', 0, 0);
	setGraphicSize('plateR',getProperty('plateR.width')/ 1.75,getProperty('plateR.height')/ 1.75)
	setProperty('plateR.offset.y',-16)
	setProperty('plateR.offset.x',-32)
	setSpriteShader('background','pincushion')
	setSpriteShader('background2','pincushion')

	makeAnimatedLuaSprite('iconWiggly','icons/icon-wigglytuff',0,0)
	setObjectCamera('iconWiggly','hud')
	addAnimationByPrefix('iconWiggly','0','icon1',24,true)
	addAnimationByPrefix('iconWiggly','1','icon2',24,true)
	addAnimationByPrefix('iconWiggly','2','icon3',24,true)
	addAnimationByPrefix('iconWiggly','3','icon4',24,true)
	addLuaSprite('iconWiggly',true)

	makeLuaSprite('White',nil,-500,-500)
	makeGraphic('White',screenWidth*2,screenHeight*2,'FFFFFF')
	
	makeLuaSprite('Black',nil,-500,-500)
	makeGraphic('Black',screenWidth*2,screenHeight*2,'000000')
	
	makeAnimatedLuaSprite('Static','static',0,0)
	addAnimationByPrefix('Static','idle','static',8,true)
	setGraphicSize('Static',screenWidth* 1.01,screenHeight* 1.01)
	screenCenter('Static','xy')
	setObjectCamera('Static','other')
	setProperty('Static.alpha',0)
	
	makeAnimatedLuaSprite('StaticOverlay','static-overlay',0,0)
	addAnimationByPrefix('StaticOverlay','idle','static-overlay',8,true)
	setGraphicSize('StaticOverlay',screenWidth* 1.01,screenHeight* 1.01)
	screenCenter('StaticOverlay','xy')
	setObjectCamera('StaticOverlay','other')
	setProperty('StaticOverlay.alpha',0)
	setProperty('StaticOverlay.blend',9)

	addLuaSprite('background', false);
	addLuaSprite('background2', false);
	setProperty('background2.visible',false)
	addLuaSprite('QuestionareBackground', false);
	setProperty('QuestionareBackground.visible',false)
	addLuaSprite('WigglesQuest',false)
	setProperty('WigglesQuest.visible',false)
	addLuaSprite('WigglesQuestClose',false)
	setProperty('WigglesQuestClose.visible',false)
	addLuaSprite('plateL', false);
	addLuaSprite('plateR', false);
	addLuaSprite('White', false);
	addLuaSprite('Black', false);
	addLuaSprite('Static', true);
	addLuaSprite('StaticOverlay', true);

end
function onMoveCamera(character)
if character=='dad' then
	setProperty('defaultCamZoom',1.1+Disabled)
elseif character == 'boyfriend' then
	setProperty('defaultCamZoom',1.1+Ponyta)
end
end
function ChangeZoom(NewZoom,Character)
if Character=='dad' then
	Disabled=NewZoom
elseif Character=='bf' then
	Ponyta=NewZoom
end

end
function ChangeIntensity(New)
	intensity=New
end
function onUpdate(elapsed)
setProperty('iconWiggly.x',getProperty('iconP2.x'))
setProperty('iconWiggly.y',getProperty('iconP2.y')-40)
setProperty('iconWiggly.scale.x',getProperty('iconP2.scale.x'))
setProperty('iconWiggly.scale.y',getProperty('iconP2.scale.y'))
if shadersEnabled then
setShaderFloat('background','time',getSongPosition() / (stepCrochet * 8))
setShaderFloat('background','prob',intensity)
end

if curStep<32 and curStep>0 then
setProperty('Black.alpha',1 - math.abs(math.sin(((getSongPosition()) / (stepCrochet * 8)) * math.pi) * 0.5))
end
if HoverNotes then
if hoverFactor<24 then
	hoverFactor=hoverFactor+(elapsed / (1 / 60))
end
for i=0,1 do
for j=0,3 do
	if i==0 then
setProperty('StrumNote'..j..'.y',OriginalYNote + (hoverFactor / 2)-math.sin((getSongPosition() / ((stepCrochet * 8) - j)) * math.pi) * hoverFactor)
	else
setPropertyFromGroup('playerStrums',j,'y',OriginalYNote + (hoverFactor / 2)-math.sin((getSongPosition() / ((stepCrochet * 8) - j)) * math.pi) * hoverFactor)
	end
end
end
end
if finishedRotating then
	currenti=0
	if horizontalFactor<64 then
		horizontalFactor=horizontalFactor+(elapsed / (1 / 60))
	end
	for i=0,1 do
		for j=0,3 do
			if i==0 then
		setProperty('StrumNote'..j..'.x',OriginalXNotes[currenti] -math.cos((getSongPosition() / ((stepCrochet * 16))) * math.pi) * horizontalFactor)
			else
		setPropertyFromGroup('playerStrums',j,'x',OriginalXNotes[currenti] -math.cos((getSongPosition() / ((stepCrochet * 16))) * math.pi) * horizontalFactor)
			end
			currenti=currenti+1
		end
	end



end
end
function onUpdatePost(elapsed)
	setProperty('plateL.x',getProperty('dad.x')+(getProperty('dad.width')/ 2)-(getProperty('plateL.width')/ 2))
	setProperty('plateL.y',getProperty('dad.y')+getProperty('dad.height')-(getProperty('plateL.height')/ 2))
	setProperty('plateR.x',(getProperty('boyfriend.x')+(getProperty('boyfriend.width')/ 2)-(getProperty('plateR.width')/ 2))-180)
	setProperty('plateR.y',(getProperty('boyfriend.y')+getProperty('boyfriend.height')-(getProperty('plateR.height')/ 2))-50)
	if curStep>32 and luaSpriteExists('Black') then
		removeLuaSprite('Black',true)
		removeLuaSprite('White',true)
	end
	if curStep % 32 == 0 and useTerror and not runningAway then
		finishedRotating=true
		for i=0,7 do
			noteTweenAngle('Rotation'..i,i,360,8*(stepCrochet/1000),'cubeInOut')
		end
	end
end
function onCreatePost()
setObjectOrder('iconWiggly',getObjectOrder('iconP2')+1)
setProperty('iconP2.alpha',0)
setProperty('boyfriend.color',getColorFromHex('000000'))
setProperty('dad.color',getColorFromHex('000000'))
setCharacterX('dad',getCharacterX('dad')+screenWidth)
setCharacterX('bf',getCharacterX('bf')-screenWidth)
OriginalYNote=defaultPlayerStrumY1

end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	runHaxeCode([[
		game.strumLineNotes.members[]]..noteData..[[].playAnim('static', true)
	]])

    
end
function onStepHit()
if curStep==20 then
	doTweenX('StartDAD','dad',getCharacterX('dad')-screenWidth,stepCrochet/1000*8,'circOut')
elseif curStep==24 then
doTweenX('StartBF','boyfriend',getCharacterX('bf')+screenWidth,stepCrochet/1000*8,'circOut')
elseif curStep==32 then
cameraFlash('hud','FFFFFF',stepCrochet/1000*8)
	setProperty('boyfriend.color',getColorFromHex('FFFFFF'))
    setProperty('dad.color',getColorFromHex('FFFFFF'))
	triggerEvent('Camera Follow Pos','','')
	removeLuaSprite('Black',true)
	removeLuaSprite('White',true)
	playAnim('WigglesQuestClose','glitch')


end
end
function onTweenCompleted(tag)
if tag=='TransitionVigette2' then
	HoverNotes=true
end
if tag=='Rotation7' then
for i=0,7 do 
	setPropertyFromGroup('strumLineNotes',i,'angle',0)
end
end
end
function FlipStrum(separation,Strumline)
	midPoint = (screenWidth / 2) + separation
	if Strumline=='playerStrums' then
        Position=4
	end
	if Strumline=='StrumNote' then
		for i=0,3 do
			realX= midPoint - ((3 / 2) * getPropertyFromGroup('strumLineNotes',i,'width')) + (getPropertyFromGroup('strumLineNotes',i,'width') * i)
			doTweenX('XTweenDAD'..i,'StrumNote'..i,realX - 16,(stepCrochet / 1000) * 16,'circInOut')
			OriginalXNotes[i]=realX - 16
		end
	else
for i=0,3 do
	realX= midPoint - ((3 / 2) * getPropertyFromGroup('strumLineNotes',Position+i,'width')) + (getPropertyFromGroup('strumLineNotes',Position+i,'width') * i)
    noteTweenX('XTween'..i,Position+i,realX - 16,(stepCrochet / 1000) * 16,'circInOut')
	OriginalXNotes[Position+i]=realX - 16
end
end
end
function onSongStart()
	callScript('custom_events/Vignette Fade.lua','ChangeMaxAlpha',{0.25,'Static'})
	callScript('custom_events/Vignette Fade.lua','ChangeMaxAlpha',{0.6,'StaticOverlay'})
	screenCenter('QuestionareBackground','x')
	screenCenter('WigglesQuest','x')
	screenCenter('WigglesQuestClose','x')
	setProperty('WigglesQuestClose.x',getProperty('WigglesQuestClose.x')+50)

	runHaxeCode([[
		Application.current.window.title="]]..'Pokemon'..''..'SoulSilver'..[[";
	]])
	
end
function onEvent(eventName, value1, value2)
if eventName=='ChangeToTerror' then
	useTerror=true
	setProperty('dad.idleSuffix','-alt')
    characterDance('dad')
	ChangeZoom(0.25,'dad')
end
if eventName=='Amusia Run Away' then
	doTweenAlpha('Vigette1','Static',1,8*(stepCrochet/1000),'linear')
	doTweenAlpha('Vigette2','StaticOverlay',1,8*(stepCrochet/1000),'linear')
	triggerEvent('Camera Follow Pos',"640","150")
	runningAway=true
end
end
function onDestroy()
    runHaxeCode([[
        Application.current.window.title="FNF : Mikan Engine";
    ]])
end



