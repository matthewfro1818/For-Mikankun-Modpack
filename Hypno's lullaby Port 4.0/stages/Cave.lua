local Path='stage/Cave/'
function onCreate()
    StrumX={}
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',0.15)
	setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',-0.15)
	makeLuaSprite('Cave',Path..'cave', -450, -400);
	addLuaSprite('Cave', false);
	
	makeAnimatedLuaSprite('HypnoEntrace','characters/Hypno/ABOMINATION_HYPNO_ENTRANCE',585, -155)
	addAnimationByPrefix('HypnoEntrace','Entrance','Entrance instance', 24, false)
	makeAnimatedLuaSprite('HypnoEnd','characters/Hypno/hypno_ending_sequence',385, -165)
	addAnimationByPrefix('HypnoEnd','Ending','Ending instance 1', 24, false)
	scaleObject('HypnoEnd',0.67,0.67)

	setPropertyFromClass('GameOverSubstate', 'characterName', 'LostCauseGO')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'GF_dies')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'LostCauseLoop')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'LostCauseEnd')



    callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{-150, 400})

end
function onUpdate(elapsed)
	if luaSpriteExists('HypnoIcon') then
	setProperty('iconP2.alpha',0)
	setObjectOrder('HypnoIcon',getObjectOrder('iconP2'))
	setProperty('HypnoIcon.x',getProperty('iconP2.x')-100)
	setProperty('HypnoIcon.y',getProperty('iconP2.y')-125)
	setProperty('HypnoIcon.scale.x',getProperty('iconP2.scale.x')-0.55)
	setProperty('HypnoIcon.scale.y',getProperty('iconP2.scale.y')-0.55)
	end

end
function onCreatePost()
	runHaxeCode([[
		game.iconP2.changeIcon('bfhypno');
	]])
	setHealthBarColors('31B0D1','A5004C')
    setProperty('boyfriend.idleSuffix','-alt')
	characterDance('bf')
    setProperty('dad.visible',false)
	for i=0,7 do
        StrumX[i]=getPropertyFromGroup('strumLineNotes',i,'x')
	end
	for i=0,3 do
		if not middlescroll then
			setPropertyFromGroup('playerStrums',i,'x',StrumX[i])
			setPropertyFromGroup('strumLineNotes',i,'x',StrumX[i+4])
		end
		setPropertyFromGroup('strumLineNotes',i,'visible',false)
	end
	CreatePendelum(false)
	setProperty('Pendelum.visible',false)
end