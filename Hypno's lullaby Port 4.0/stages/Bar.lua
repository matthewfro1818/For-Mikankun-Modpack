--Code made by Drawoon_
--if you use this please give me credit
local Path='stage/Bar/'
function onCreate()
    consistentPosition= {-625, -100};
	consistentSize= 1.25;
	isDead=false
	pastaBoppers={'Widemouth','Mousetable','Jack','Jeff','JeffArm','Squid','Herobrine','SquidHead','SlenderBitch','CoronationPeach','Shinto','POW'}
	setProperty('skipCountdown',true)
	addLuaScript('scripts/Stuff/PlayStuff.lua')

    makeLuaSprite('ShaderObj')
    
makeLuaSprite('Sky',Path..'SKY',consistentPosition[1]+914*consistentSize,consistentPosition[2]+263*consistentSize)
setScrollFactor('Sky',0.9, 0.9)
scaleObject('Sky',consistentSize+0.1,consistentSize+0.1)
addLuaSprite('Sky',false)

makeLuaSprite('Shine',Path..'shine',consistentPosition[1]+916*consistentSize,consistentPosition[2]+265*consistentSize)
setScrollFactor('Shine',0.9, 0.9)
scaleObject('Shine',consistentSize,consistentSize)
addLuaSprite('Shine',false)

makeLuaSprite('Bar',Path..'bar',consistentPosition[1],consistentPosition[2])
setScrollFactor('Bar',0.9, 0.9)
scaleObject('Bar',consistentSize,consistentSize)
addLuaSprite('Bar',false)

makeLuaSprite('Holder',Path..'holder',consistentPosition[1]+1180*consistentSize,consistentPosition[2]+228*consistentSize)
setScrollFactor('Holder',0.9, 0.9)
scaleObject('Holder',consistentSize,consistentSize)
addLuaSprite('Holder',false)

makeAnimatedLuaSprite('Saled',Path..'SFingers',consistentPosition[1]+1050*consistentSize,math.floor(consistentPosition[2]+390*consistentSize)-1)
addAnimationByPrefix('Saled','bop','SFingers',24,true)
setScrollFactor('Saled',0.9, 0.9)
scaleObject('Saled',consistentSize,consistentSize)
addLuaSprite('Saled',false)
setProperty('Saled.x',getProperty('Saled.x')-getProperty('Saled.width')/2)
setProperty('Saled.y',getProperty('Saled.y')-getProperty('Saled.height')+10)

makeAnimatedLuaSprite('Widemouth',Path..'MrWidemouth',consistentPosition[1]+1150*consistentSize,consistentPosition[2] + 390 * consistentSize)
addAnimationByPrefix('Widemouth','bop','MrWidemouth instance 1',24,false)
setScrollFactor('Widemouth',0.9, 0.9)
scaleObject('Widemouth',consistentSize,consistentSize)
addLuaSprite('Widemouth',false)
setProperty('Widemouth.x',getProperty('Widemouth.x')-getProperty('Widemouth.width')/2)
setProperty('Widemouth.y',getProperty('Widemouth.y')-getProperty('Widemouth.height')+8)

makeLuaSprite('Machine',Path..'Machine',200*1.55, 70*3.5)
setScrollFactor('Machine',0.9, 0.9)
scaleObject('Machine',consistentSize* 0.35,consistentSize* 0.35)
addLuaSprite('Machine',false)

makeAnimatedLuaSprite('Herobrine',Path..'brian_idle',315,308)
addAnimationByPrefix('Herobrine','bop','brian idle ',24,false)
setScrollFactor('Herobrine',0.9, 0.9)
scaleObject('Herobrine',consistentSize,consistentSize)
addLuaSprite('Herobrine',false)

makeAnimatedLuaSprite('CoronationPeach',Path..'CoronationPeach',490*1.035, 279*1.11)
addAnimationByPrefix('CoronationPeach','bop','CoronationPeach',24,false)
setScrollFactor('CoronationPeach',0.9, 0.9)
scaleObject('CoronationPeach',consistentSize* 0.5,consistentSize* 0.5)

makeAnimatedLuaSprite('Shinto',Path..'ShintoPastaNight',610*1.035, 312*1.08)
addAnimationByPrefix('Shinto','bop','Shitno',24,false)
setScrollFactor('Shinto',0.9, 0.9)
scaleObject('Shinto',consistentSize* 0.5,consistentSize* 0.5)
addLuaSprite('Shinto',false)

addLuaSprite('CoronationPeach',false)

makeAnimatedLuaSprite('Jack',Path..'Jack',100*1.4, 180*1.4)
addAnimationByPrefix('Jack','bop','Body with tar instance 1',24,false)
setScrollFactor('Jack',0.9, 0.9)
scaleObject('Jack',consistentSize* 0.5,consistentSize* 0.5)
addLuaSprite('Jack',false)

makeLuaSprite('OtherTable',Path..'TableMisc',595*1.4-630,355*1.3)
setScrollFactor('OtherTable',0.9, 0.9)
scaleObject('OtherTable',consistentSize* 0.5,consistentSize* 0.5)


makeAnimatedLuaSprite('SlenderBitch',Path..'Buds_Slender_Effects',735*1.15,35*4.8)
addAnimationByPrefix('SlenderBitch','bop','Slenderman Full',24,false)
setScrollFactor('SlenderBitch',0.9, 0.9)
scaleObject('SlenderBitch',consistentSize* 0.55,consistentSize* 0.55)
addLuaSprite('SlenderBitch',false)

makeAnimatedLuaSprite('Ben',Path..'Ben_Drowned_BG',1145+40,175*1.5)
addAnimationByPrefix('Ben','idle','ben drowned0',24,false)
addAnimationByPrefix('Ben','look','ben drowned looking',24,false)
setScrollFactor('Ben',0.9, 0.9)
scaleObject('Ben',consistentSize* 0.55,consistentSize* 0.55)
addLuaSprite('Ben',false)
playAnim('Ben','idle')

makeAnimatedLuaSprite('Squid',Path..'Squirtward',750+40,210*1.3)
addAnimationByPrefix('Squid','bop','Squidward_idleBody',24,false)
setScrollFactor('Squid',0.9, 0.9)
scaleObject('Squid',consistentSize* 0.6,consistentSize* 0.6)
addLuaSprite('Squid',false)


makeAnimatedLuaSprite('SquidHead',Path..'Squirtward',750+40,210*1.3)
addAnimationByPrefix('SquidHead','bop','Squidward_idleHead',24,false)
setScrollFactor('SquidHead',0.9, 0.9)
scaleObject('SquidHead',consistentSize* 0.6,consistentSize* 0.6)
addLuaSprite('SquidHead',false)

addLuaSprite('OtherTable',false)

makeAnimatedLuaSprite('Jeff',Path..'Jeff',472-90, 305-40)
addAnimationByPrefix('Jeff','bop','mynamejeff instance 1',24,false)
setScrollFactor('Jeff',0.9, 0.9)
scaleObject('Jeff',consistentSize* 0.78,consistentSize* 0.78)
addLuaSprite('Jeff',false)

makeAnimatedLuaSprite('Mousetable',Path..'Mousetable',consistentPosition[1] + 825 * consistentSize, consistentPosition[2] + 630 * consistentSize)
addAnimationByPrefix('Mousetable','bop','Mousetable',24,false)
setScrollFactor('Mousetable',0.9, 0.9)
scaleObject('Mousetable',consistentSize* 0.5,consistentSize* 0.5)
addLuaSprite('Mousetable',false)
setProperty('Mousetable.x',getProperty('Mousetable.x')-getProperty('Mousetable.width')/2)
setProperty('Mousetable.y',getProperty('Mousetable.y')-getProperty('Mousetable.height'))

makeAnimatedLuaSprite('JeffArm',Path..'JeffArm',500-90, 445-40)
addAnimationByPrefix('JeffArm','bop','Only the arm shit instance 1',24,false)
setScrollFactor('JeffArm',0.9, 0.9)
scaleObject('JeffArm',consistentSize* 0.78,consistentSize* 0.78)
addLuaSprite('JeffArm',false)

    makeLuaSprite('Table',Path..'TABLE',0,0)
	scaleObject('Table',0.75,0.75)
	screenCenter('Table','xy')
	setProperty('Table.x',getProperty('Table.x')-50)
	setProperty('Table.y',getProperty('Table.y')+750)
	setObjectOrder('Table',40)
	addLuaSprite('Table',false)

	setObjectOrder('boyfriendGroup',getObjectOrder('Table')-1)
    setObjectOrder('dadGroup',getObjectOrder('Table')-1)
    setObjectOrder('gfGroup',getObjectOrder('Table')+1)

	
end
local PendelumAdd=true

function onSongStart()
	for i=0,getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes',i,'mustPress') then
			if getPropertyFromGroup('unspawnNotes',i,'noteType')=='Hypno' then
				PendelumAdd=false
			end
			break
		end
	end
	
	if PendelumAdd then
		CreatePendelum(false)
	end
	runTimer('PendelumDelay',0.5)
	
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='PendelumDelay' then
		if PendelumAdd then
			StartPendelum()
		end
	end
end
function onBeatHit()
	if curBeat % 2 == 0 then
		for i=0,#pastaBoppers do
			playAnim(pastaBoppers[i],'bop')
		end 
	end
	if curBeat >= 84 then
		playAnim('Ben','look')
	end
	
end
function onUpdate(elapsed)
	if shadersEnabled then setShaderFloat('ShaderObj','iTime',getSongPosition() / 1000) end
end
function onCreatePost()
	if shadersEnabled then
	runHaxeCode([[
        var shaderName = "old";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("ShaderObj").shader = shader0;
        shader0.setFloat('iTime', 1);
    ]])
	end
	setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{getCharacterX('gf')+264.5-50,getCharacterY('gf')+245-200})
	setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',true)
	setGlobalFromScript('scripts/Stuff/CameraMove','CamMove',false)
end

function onEvent(eventName, value1, value2)
    if eventName=='Pasta_Camera' then
		if tonumber(value1)==-1 then
			setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{(getCharacterX('gf')+264.5-50)-200,getCharacterY('gf')+245-200})
		elseif tonumber(value1)==1 then
			setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{(getCharacterX('gf')+264.5-50)+200,getCharacterY('gf')+245-200})
		else
			setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{getCharacterX('gf')+264.5-50,getCharacterY('gf')+245-200})
		end
	end 
end




