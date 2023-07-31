local songPos = 0
local sinmult = 0
local shake = 0
local sinspeed = 0.85

function onCreate() --setting variables and making sprites
	setProperty('skipCountdown',true)
    makeLuaSprite('introfade','',0,0)
    makeLuaSprite('epicflash','',0,0)
    makeLuaSprite('chrchange','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setBlendMode('epicflash', 'add')
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    setProperty('health', 2)
    doTweenZoom('introzoom1','camGame',0.7,2,'sineInOut')
    for i = 0,17 do
        makeLuaSprite('strumwhite' .. i,'',0,0)
        makeGraphic('strumwhite' .. i,10,3000,'FFFFFF')
        setObjectCamera('strumwhite' .. i,'HUD')
        setProperty('strumwhite' .. i .. '.alpha',0)
        addLuaSprite('strumwhite' .. i,false)
    end
    makeLuaText('dis', "modchart by: gaming man#4758. THIS IS UNFINISHED! expect this to be finished Exospheric Corruption's next update..", 600, 20, 540)
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onCreatePost() --extra stuff
	addCharacterToList('EpitomeExpunged', 'dad')
	addCharacterToList('OppositionExpunged', 'dad')
	addCharacterToList('thebambi', 'dad')
	addCharacterToList('ExosphericExpunged', 'dad')
    for i = 0,11 do
		setPropertyFromGroup('strumLineNotes',i,'y',downscroll and 730 or -110)
    end
end

function onBeatHit() --events but better
    local currentBeat = math.floor((songPos/1000)*(curBpm/60))
    if currentBeat == 32 then
		triggerEvent('Change Mania', 5)
        for i = 0,11 do
			setPropertyFromGroup('strumLineNotes',i,'y',downscroll and 730 or -110)
			noteTweenY('1-2-' .. i,i,downscroll and 570 or 50,1,'sineOut')
        end
        doTweenAlpha('disfade','dis',0,1,'linear')
   end
    if currentBeat == 126 then
        for i = 0,5 do
            noteTweenX('2-1-' .. i,i,136+i*84,0.7,'expoOut')
        end
        for i = 6,11 do
            noteTweenY('2-2-' .. i,i,downscroll and -180 or 800,0.7,'expoIn')
        end
    end
    if currentBeat == 128 then
        doFlash(0.3,1.5)
    end
    if currentBeat == 140 then
        for i = 0,5 do
            noteTweenX('3-1-' .. i,i,136+i*84,0.7,'expoOut')
        end
        for i = 6,11 do
            noteTweenX('3-2-' .. i,i,136+i*84,0.7,'expoOut')
            noteTweenY('3-3-' .. i,i,downscroll and 570 or 50,0.7,'expoOut')
        end
    end
    if currentBeat == 192 then
        doTweenAlpha('funny','introfade',0.95,0.7,'linear')
        doTweenZoom('funny2','camGame',1.2,crochet*0.004,'sineOut')
    end
    if currentBeat == 196 then
        doTweenAlpha('funny','introfade',0,0.8,'linear')
        doTweenZoom('funny3','camGame',1,crochet*0.002,'sineInOut')
    end
    if currentBeat == 200 then
        doTweenAlpha('funny','introfade',0.95,0.7,'linear')
        doTweenZoom('funny2','camGame',1.2,crochet*0.004,'sineOut')
    end
    if currentBeat == 204 then
        doTweenAlpha('funny','introfade',0,0.8,'linear')
        doTweenZoom('funny3','camGame',1,crochet*0.002,'sineInOut')
    end
    if currentBeat == 256 then
        setProperty('epicflash.alpha',0.3)
        doTweenAlpha('epicparts','epicflash',0,1,'linear')
    end
    if currentBeat == 320 then
        doFlash(0.5,1)
        setProperty('health',2)
        for i = 0,6 do
            noteTweenX('4-1-' .. i,i,40+i*77,2,'expoOut')
            noteTweenY('4-2-' .. i,i,downscroll and 590+(i-7)*15 or 120+i*-15,2,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',downscroll and 105 or 75)
            setPropertyFromGroup('strumLineNotes',i,'angle',downscroll and 15 or -15)
        end
        for i = 7,13 do
            noteTweenX('4-1-' .. i,i,130+i*77,2,'expoOut')
            noteTweenY('4-2-' .. i,i,downscroll and 680+i*-15 or 30+(i-7)*15,2,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',downscroll and 75 or 105)
            setPropertyFromGroup('strumLineNotes',i,'angle',downscroll and -15 or 15)
        end
        for i = 0,13 do
            setProperty('strumwhite' .. i .. '.alpha',0.2)
        end
    end
    if currentBeat == 380 then
        for i = 0,6 do
            noteTweenX('4-1-' .. i,i,370+i*77,crochet*0.004,'expoIn')
            noteTweenY('4-2-' .. i,i,downscroll and 570 or 50,crochet*0.004,'expoIn')
            noteTweenAlpha('4-3-' .. i,i,0.3,crochet*0.004,'expoOut')
            noteTweenDirection('4-4-' .. i,i,90,crochet*0.004,'expoIn')
        end
        for i = 7,13 do
            noteTweenX('4-1-' .. i,i,-169+i*77,crochet*0.004,'expoIn')
            noteTweenY('4-2-' .. i,i,downscroll and 570 or 50,crochet*0.004,'expoIn')
            noteTweenDirection('4-4-' .. i,i,90,crochet*0.004,'expoIn')
        end
    end
    if currentBeat == 480 then
        doFlash(0.5,1.3)
    end
    if currentBeat == 608 then
        doFlash(0.3,3)
    end
    if currentBeat == 672 then
        doFlash(0.5,0.8)
        for i = 0,6 do
            setPropertyFromGroup('strumLineNotes',i,'alpha',1)
        end
    end
    if currentBeat == 732 then
        makeLuaSprite('filter','',0,0)
        makeLuaSprite('darken','',0,0)
        makeGraphic('filter',3000,3000,'FFFFFF')
        makeGraphic('darken',3000,3000,'999999  ')
        setObjectCamera('filter','other')
        setObjectCamera('darken','other')
        addLuaSprite('filter',true)
        addLuaSprite('darken',true)
        setProperty('filter.alpha', 0.1)
        setProperty('darken.alpha', 0)
        doTweenColor('filtercolorset','filter','003344',0.001,'linear')
        doTweenAlpha('epic','darken',0.4,crochet*0.004-0.01,'sineInOut')
        setBlendMode('filter', 'subtract')
        setBlendMode('darken', 'subtract')
        for i = 0,6 do
            noteTweenX('5-1-' .. i,i,-110,1,'expoOut')
            noteTweenY('5-2-' .. i,i,downscroll and 570 or 50,1,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
            setPropertyFromGroup('strumLineNotes',i,'alpha',0)
        end
        for i = 7,13 do
            noteTweenX('5-1-' .. i,i,-169+i*77,1,'expoOut')
            noteTweenY('5-2-' .. i,i,downscroll and 570 or 50,1,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
        end
    end
    if currentBeat == 736 then
        for i = 14,17 do
            setProperty('strumwhite' .. i .. '.alpha',0.2)
        end
    end
    if currentBeat >= 736 and currentBeat < 1056 then
        if math.fmod(currentBeat,8) == 0 then
            doTweenAlpha('epic','darken',0.1,crochet*0.004-0.01,'sineInOut')
        end
        if math.fmod(currentBeat,8) == 4 then
            doTweenAlpha('epic','darken',0.4,crochet*0.004-0.01,'sineInOut')
        end
    end
    if currentBeat >= 736 and currentBeat < 800 then
        if math.fmod(currentBeat,2) == 0 then
        shake = 200*0.56
        sinmult = 140*0.56
        end
    end
    if currentBeat >= 800 and currentBeat < 864 then
        shake = 80
        if math.fmod(currentBeat,2) == 0 then
            sinmult = -50*0.56
        end
        if math.fmod(currentBeat,2) == 1 then
            sinmult = 50*0.56
        end
        sinspeed = 0.9*0.56
    end
    if currentBeat == 864 then
        for i = 0,8 do
            noteTweenDirection('6-1-' .. i,i,-90,1,'expoOut')
            noteTweenX('6-2-' .. i,i,350+63*i,1,'expoOut')
            noteTweenY('6-3-' .. i,i,downscroll and 50 or 570,1,'expoOut')
            noteTweenAngle('6-4-' .. i,i,0,1,'expoOut')
        end
        for i = 9,17 do
            noteTweenDirection('6-1-' .. i,i,90,1,'expoOut')
            noteTweenX('6-2-' .. i,i,-217+63*i,1,'expoOut')
            noteTweenY('6-3-' .. i,i,downscroll and 570 or 50,1,'expoOut')
            noteTweenAngle('6-4-' .. i,i,0,1,'expoOut')
        end
    end
    if currentBeat == 992 then
        for i = 0,8 do
            noteTweenDirection('7-1-' .. i,i,90,1,'expoOut')
            noteTweenX('7-2-' .. i,i,20+63*i,1,'expoOut')
            noteTweenY('7-3-' .. i,i,downscroll and 570 or 50,1,'expoOut')
            noteTweenAngle('7-4-' .. i,i,0,1,'expoOut')
        end
        for i = 9,17 do
            noteTweenDirection('7-1-' .. i,i,90,1,'expoOut')
            noteTweenX('7-2-' .. i,i,93+63*i,1,'expoOut')
            noteTweenY('7-3-' .. i,i,downscroll and 570 or 50,1,'expoOut')
            noteTweenAngle('7-4-' .. i,i,0,1,'expoOut')
        end
    end
    if currentBeat >= 1056 and currentBeat < 1060 then
		doTweenAlpha('epic','darken',0.1,crochet*0.004-0.01,'sineInOut')
    end
end

function onUpdate(elapsed)
	setProperty('health',getProperty('health')+0.075*elapsed)
end

function onUpdatePost() --events but every frame
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(curBpm/60)
    sinmult = sinmult*sinspeed
    shake = shake*-0.85
    if currentBeat >= 320 and currentBeat < 732 then
        notesLength = getProperty('notes.length')
	    for i1 = 0, notesLength, 1 do
	    	Thisnote = getPropertyFromGroup('notes',i1,'noteData')
	    	Thisnoteorigindir = getPropertyFromGroup('strumLineNotes',Thisnote,'direction')-getPropertyFromGroup('strumLineNotes',Thisnote,'angle')
            setPropertyFromGroup('notes',i1,'angle',Thisnoteorigindir-90)
            setPropertyFromGroup('notes',i1,'scale.x',getPropertyFromGroup('strumLineNotes',Thisnote,'scale.x'))
			if getPropertyFromGroup('notes',i1,'isSustainNote') == false then
				setPropertyFromGroup('notes',i1,'scale.y',getPropertyFromGroup('strumLineNotes',Thisnote,'scale.x'))
			end
	    end
    end
    if currentBeat >= 128 and currentBeat < 144 then
        bambiPartDrops(0,37.5,0,5)
    end
    if currentBeat >= 144 and currentBeat < 192 then
        bambiPartDrops(0,37.5,0,11)
    end
    if currentBeat >= 256 and currentBeat < 320 then
        bambiPartDrops(45,30,0,11)
    end
    if currentBeat >= 384 and currentBeat < 400 then
        multicornMain((currentBeat-384)*130/16*0.7)
    end
    if currentBeat >= 400 and currentBeat < 480 then
        multicornMain(90)
    end
    if currentBeat >= 480 and currentBeat < 608 then
        multicornDrop(70)
    end
    if currentBeat >= 608 and currentBeat < 672 then
        multicornMain(80)
    end
    if currentBeat >= 672 and currentBeat < 732 then
        multicornFinal(1600)
    end
    if currentBeat >= 736 and currentBeat < 800 then
        for i = 0,8 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'x',-100)
            setPropertyFromGroup('strumLineNotes',i,'y',110)
        end
        for i = 9,17 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90+shake*0.25)
            setPropertyFromGroup('strumLineNotes',i,'x',-217+i*63+shake)
            setPropertyFromGroup('strumLineNotes',i,'y',(downscroll and 570 or 50)+math.sin((currentBeat+i/8)*math.pi*4)*sinmult)
            setPropertyFromGroup('strumLineNotes',i,'angle',shake*0.25)
        end
    end
    if currentBeat >= 800 and currentBeat < 864 then
        for i = 9,17 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'x',-217+i*63+shake)
            setPropertyFromGroup('strumLineNotes',i,'y',downscroll and 570 or 50)
            setPropertyFromGroup('strumLineNotes',i,'angle',shake*0.33)
        end
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
            Thisnotex = getPropertyFromGroup('notes',i1,'x')
            Thisnotey = getPropertyFromGroup('notes',i1,'y')
            Thisnote = getPropertyFromGroup('notes',i1,'noteData')
            Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
            Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
			if getPropertyFromGroup('notes',i1,'mustPress') then
				setPropertyFromGroup('notes',i1,'x',Thisnotex+math.sin(((downscroll and Thisnoteoriginy-Thisnotey or Thisnotey-Thisnoteoriginy)*0.001)*math.pi*2)*5*sinmult)
				setPropertyFromGroup('notes',i1,'angle',math.cos((currentBeat+Thisnotey*0.001)*math.pi*-2)*0.3*sinmult)
				setPropertyFromGroup('notes',i1,'y',Thisnotey+math.sin(currentBeat*math.pi*2)*40)
				setPropertyFromGroup('notes',i1,'scale.x',0.46+(downscroll and Thisnoteoriginy-Thisnotey or Thisnotey-Thisnoteoriginy)*-0.0003)
				if getPropertyFromGroup('notes',i1,'isSustainNote') == false then
					setPropertyFromGroup('notes',i1,'scale.y',0.46+(downscroll and Thisnoteoriginy-Thisnotey or Thisnotey-Thisnoteoriginy)*-0.0003)
				end
			end
        end
    end

    for i = 0,17 do
        setProperty('strumwhite' .. i .. '.x',getPropertyFromGroup('strumLineNotes',i,'x')+45)
        setProperty('strumwhite' .. i .. '.y',getPropertyFromGroup('strumLineNotes',i,'y')-1445)
        setProperty('strumwhite' .. i .. '.angle',getPropertyFromGroup('strumLineNotes',i,'direction')-90)
    end
end

function onEvent(tag, val1, val2)
    if tag == 'Change Mania' then
		for i = val1*2-1,17 do
			setProperty('strumwhite' .. i .. '.x',-100)
		end
	end
end

function doFlash(brightness,length) --self explanatory
    setProperty('epicflash.alpha',brightness)
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end

function bambiPartDrops(xmult,ymult,istart,iend) --i love sine waves
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = istart,iend do
        setPropertyFromGroup('strumLineNotes',i,'x',136+(i*84)+math.sin((currentBeat+i*0.333)*math.pi*0.25)*math.sin(currentBeat*math.pi/16)*xmult)
        setPropertyFromGroup('strumLineNotes',i,'y',(downscroll and 570 or 50)+math.sin((currentBeat+i*0.333)*math.pi)*math.sin(currentBeat*math.pi/16)*ymult)
        setPropertyFromGroup('strumLineNotes',i,'scale.y',0.6+math.cos((currentBeat+i*0.333)*math.pi)*math.sin(currentBeat*math.pi/16)*ymult/400)
    end
end

function multicornMain(xmult) --i love sine waves: 2
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,6 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'x',370+i*77+math.sin((currentBeat+i/2)*math.pi/8)*xmult)
    end
    for i = 7,13 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+(i-4)/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'x',-169+i*77+math.sin((currentBeat+i/2)*math.pi/8)*xmult)
    end
end

function multicornDrop(xmult) --i love sine waves: 3
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,6 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+i/2)*math.pi/4)*45)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*15)
        setPropertyFromGroup('strumLineNotes',i,'x',370+i*77+math.cos((currentBeat+i*2)*math.pi/8)*xmult*2)
    end
    for i = 7,13 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+(i-4)/2)*math.pi/4)*4)
        setPropertyFromGroup('strumLineNotes',i,'angle',0)
        setPropertyFromGroup('strumLineNotes',i,'x',-169+i*77)
    end
end

function multicornFinal(modulo) --i love sine waves: 4
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,13 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat)*math.pi/4)*30)
        setPropertyFromGroup('strumLineNotes',i,'angle',0)
        setPropertyFromGroup('strumLineNotes',i,'x',math.fmod(currentBeat*300+i*(modulo/14),modulo)-modulo/14)
        setPropertyFromGroup('strumLineNotes',i,'y',(downscroll and 550 or 80)+math.sin((currentBeat+(i*2))*math.pi/14)*60)
    end
end

function opponentNoteHit()
    hp = getProperty('health')
    if hp > 0.2 then
		setProperty('health',hp-0.016)
    end
end
function goodNoteHit()
    setProperty('health',getProperty('health')+0.05)
end
function noteMiss()
    setProperty('health',getProperty('health')-0.1)
end