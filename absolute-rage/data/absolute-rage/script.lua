


--perlin stuffs
--https://gist.github.com/kymckay/25758d37f8e3872e1636d90ad41fe2ed
--from here, edited to fix some of the hash stuff that didnt work
perlin = {}
p = {}



-- Hash lookup table as defined by Ken Perlin
-- This is a randomly arranged array of all numbers from 0-255 inclusive
local permutation = {151,160,137,91,90,15,
  131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,
  190, 6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,
  88,237,149,56,87,174,20,125,136,171,168, 68,175,74,165,71,134,139,48,27,166,
  77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,
  102,143,54, 65,25,63,161, 1,216,80,73,209,76,132,187,208, 89,18,169,200,196,
  135,130,116,188,159,86,164,100,109,198,173,186, 3,64,52,217,226,250,124,123,
  5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,
  223,183,170,213,119,248,152, 2,44,154,163, 70,221,153,101,155,167, 43,172,9,
  129,22,39,253, 19,98,108,110,79,113,224,232,178,185, 112,104,218,246,97,228,
  251,34,242,193,238,210,144,12,191,179,162,241, 81,51,145,235,249,14,239,107,
  49,192,214, 31,181,199,106,157,184, 84,204,176,115,121,50,45,127, 4,150,254,
  138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180
}
function onCreate()
    triggerEvent('Camera Follow Pos', 1, 1)
    --luaDebugMode = true
    -- p is used to hash unit cube coordinates to [0, 255]
    for i=0,255 do
        -- Convert to 0 based index table
        p[i] = permutation[i+1]
        -- Repeat the array to avoid buffer overflow in hash function
        p[i+256] = permutation[i+1]
    end
end

function grad(hash, x, y, z)

    local h = hash % 16
    local u = 0
    if (h < 8) then 
        u = x 
    else 
        u = y 
    end

    local v
    if (h < 4) then 
        v = y
    elseif (h == 12 or h == 14) then 
        v=x 
    else 
        v=z 
    end
    local val = 0

    if ((h%2) == 0) then 
        val = u 
    else 
        val = -u 
    end
    if ((h%4) == 0) then 
        val = val+v 
    else 
        val = val-v end

    return val
end

-- Fade function is used to smooth final output
function fade(t)
    return t * t * t * (t * (t * 6 - 15) + 10)
end

function lerp(t, a, b)
    return a + t * (b - a)
end

-- Return range: [-1, 1]
function noise(x, y, z)
    y = y or 0
    z = z or 0

    -- Calculate the "unit cube" that the point asked will be located in
    local xi = math.floor(x) % 255
    local yi = math.floor(y) % 255
    local zi = math.floor(z) % 255

    -- Next we calculate the location (from 0 to 1) in that cube
    x = x - math.floor(x)
    y = y - math.floor(y)
    z = z - math.floor(z)

    -- We also fade the location to smooth the result
    local u = fade(x)
    local v = fade(y)
    local w = fade(z)

    -- Hash all 8 unit cube coordinates surrounding input coordinate
    local A, AA, AB, AAA, ABA, AAB, ABB, B, BA, BB, BAA, BBA, BAB, BBB
    A   = p[xi  ] + yi
    AA  = p[A   ] + zi
    AB  = p[A+1 ] + zi
    AAA = p[ AA ]
    ABA = p[ AB ]
    AAB = p[ AA+1 ]
    ABB = p[ AB+1 ]

    B   = p[xi+1] + yi
    BA  = p[B   ] + zi
    BB  = p[B+1 ] + zi
    BAA = p[ BA ]
    BBA = p[ BB ]
    BAB = p[ BA+1 ]
    BBB = p[ BB+1 ]

    -- Take the weighted average between all 8 unit cube coordinates
    return lerp(w,
        lerp(v,
            lerp(u,
                grad(AAA,x,y,z),
                grad(BAA,x-1,y,z)
            ),
            lerp(u,
                grad(ABA,x,y-1,z),
                grad(BBA,x-1,y-1,z)
            )
        ),
        lerp(v,
            lerp(u,
                grad(AAB,x,y,z-1), grad(BAB,x-1,y,z-1)
            ),
            lerp(u,
                grad(ABB,x,y-1,z-1), grad(BBB,x-1,y-1,z-1)
            )
        )
    )
end



--everything else

local characterList = {}


local charToNoteTypeMap = {
    {'agoti', 'AgotiSing'},
    {'whitty', 'WhittySing'},
    {'tabi', 'TabiSing'},
    {'tricky', 'TrickySing'}
}

function onCreatePost()
    addHaxeLibrary('NoteSplash')
    addHaxeLibrary('ColorSwap')
    addHaxeLibrary('Math')
    
    triggerEvent('createCharacter', 'whitty', '') --create character
    triggerEvent('createCharacter', 'tricky', '') --create character
    triggerEvent('createCharacter', 'tabi', '')
    triggerEvent('createCharacter', 'agoti', '')


    runHaxeCode('game.variables["agoti"].x += -200;')
    runHaxeCode('game.variables["agoti"].y += 150;')

    runHaxeCode('game.variables["tricky"].x -= 650;')
    runHaxeCode('game.variables["tricky"].y += 100;')

    runHaxeCode('game.variables["tabi"].x += 800;')
    runHaxeCode('game.variables["tabi"].y += 80;')

    runHaxeCode('game.variables["whitty"].x += 300;')
    runHaxeCode('game.variables["whitty"].y += 0;')

    runHaxeCode('game.variables["whitty"].flipX = true;')
    runHaxeCode('game.variables["tabi"].flipX = true;')

    runHaxeCode('game.variables["whitty"].alpha = 0;')
    runHaxeCode('game.variables["tabi"].alpha = 0;')
    runHaxeCode('game.variables["tricky"].alpha = 0;')
    runHaxeCode('game.variables["agoti"].alpha = 0;')

    setProperty('boyfriend.visible', false)
    setProperty('dad.visible', false)

    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    initLuaShader('vignette')
    initLuaShader('outline')

    makeLuaSprite('vigData', '', 25, 0.2)

    runHaxeCode([[
        game.variables["vigShader"] = game.createRuntimeShader("vignette");
        game.variables["vigShader"].setFloat("strength", 25);
        game.variables["vigShader"].setFloat("size", 0.2);
        game.variables["vigShader"].setFloat("red", 255);
        game.variables["vigShader"].setFloat("green", 20);
        game.variables["vigShader"].setFloat("blue", 20);
        game.camHUD.setFilters([new ShaderFilter(game.variables["vigShader"])]);

        game.variables["outlinewhitty"] = game.createRuntimeShader("outline");
        game.variables["outlinetricky"] = game.createRuntimeShader("outline");
        game.variables["outlineagoti"] = game.createRuntimeShader("outline");
        game.variables["outlinetabi"] = game.createRuntimeShader("outline");

        game.variables["outlineagoti"].setFloat("red", 255);
        game.variables["outlineagoti"].setFloat("green", 255);
        game.variables["outlineagoti"].setFloat("blue", 255);
        game.variables["outlineagoti"].setBool("invert", false);
        game.variables["outlineagoti"].setBool("enabled", false);

        game.variables["outlinewhitty"].setFloat("red", 110);
        game.variables["outlinewhitty"].setFloat("green", 14);
        game.variables["outlinewhitty"].setFloat("blue", 209);
        game.variables["outlinewhitty"].setBool("invert", false);
        game.variables["outlinewhitty"].setBool("enabled", false);

        game.variables["outlinetricky"].setFloat("red", 95);
        game.variables["outlinetricky"].setFloat("green", 2);
        game.variables["outlinetricky"].setFloat("blue", 5);
        game.variables["outlinetricky"].setBool("invert", false);
        game.variables["outlinetricky"].setBool("enabled", false);

        game.variables["outlinetabi"].setFloat("red", 239);
        game.variables["outlinetabi"].setFloat("green", 146);
        game.variables["outlinetabi"].setFloat("blue", 6);
        game.variables["outlinetabi"].setBool("invert", false);
        game.variables["outlinetabi"].setBool("enabled", false);

        game.variables["whitty"].shader = game.variables["outlinewhitty"];
        game.variables["tricky"].shader = game.variables["outlinetricky"];
        game.variables["agoti"].shader = game.variables["outlineagoti"];
        game.variables["tabi"].shader = game.variables["outlinetabi"];


        /*game.healthBar.createGradientBar(
            [0xFFFF0000],[
            0xFF5F0205, 0xFF5F0205, 0xFF5F0205, 0xFF5F0205, 0xFF5F0205, 0xFF5F0205, 0xFF5F0205, 
			0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
			0xFF6E0ED1,0xFF6E0ED1,0xFF6E0ED1,0xFF6E0ED1,0xFF6E0ED1, 0xFF6E0ED1,0xFF6E0ED1,
            0xFFEF9206,0xFFEF9206,0xFFEF9206,0xFFEF9206,0xFFEF9206, 0xFFEF9206,0xFFEF9206,
		], 1, 90);*/
        game.healthBar.createGradientBar(
            [0xFF000000, 0xFFFF0000, 0xFFFF0000],[0xFFFF0000, 0xFFFF0000, 0xFF000000], 1, 0);
        game.healthBar.updateBar();

        //game.healthBar.scale.x = 2;
        //game.healthBar.scale.y = 2;
        //game.healthBar.y -= 30;
        //game.healthBar.updateHitbox();
        //game.healthBarBG.scale.x = 2;
        //game.healthBarBG.scale.y = 2;
        //game.healthBarBG.updateHitbox();
        

        //game.variables["desat"].saturation = -1;
    ]])
    --screenCenter('healthBar', 'x')
    makeLuaSprite('backSmoke', '', 0,0)
    makeGraphic('backSmoke', 3400, 2000, '0xFF000000')
    screenCenter('backSmoke')
    addLuaSprite('backSmoke', false)
    --makeLuaSprite('frontSmoke', '', 0,0)
    initLuaShader('perlinSmoke')
    runHaxeCode([[
        game.variables["smoke"] = game.createRuntimeShader("perlinSmoke");
        game.variables["smoke"].setFloat("iTime", 0);
        game.variables["smoke"].setFloat("x", 0);
        game.variables["smoke"].setFloat("y", 0);
        game.variables["smoke"].setFloat("zoom", 1);
        game.modchartSprites["backSmoke"].shader = game.variables["smoke"];
    ]])

    makeLuaSprite('beam0', 'beam', -600, -200)
    setProperty('beam0.scale.x', 1.5)
    setProperty('beam0.scale.y', 1.5)
    
    setProperty('beam0.scrollFactor.y', 0)
    addLuaSprite('beam0', false)
    doTweenColor('beam0', 'beam0', '0x005F0205', 0.01, 'linear')
    setProperty('beam0.alpha', 0)
    makeLuaSprite('beam1', 'beam', -170, -200)
    setProperty('beam1.scale.x', 1.5)
    setProperty('beam1.scale.y', 1.5)
    setProperty('beam1.alpha', 0)
    setProperty('beam1.scrollFactor.y', 0)
    addLuaSprite('beam1', false)

    makeLuaSprite('beam2', 'beam', 300, -200)
    setProperty('beam2.scale.x', 1.5)
    setProperty('beam2.scale.y', 1.5)
    
    setProperty('beam2.scrollFactor.y', 0)
    addLuaSprite('beam2', false)
    doTweenColor('beam2', 'beam2', '0x006E0ED1', 0.01, 'linear')

    setProperty('beam2.alpha', 0)
    makeLuaSprite('beam3', 'beam', 800, -200)
    setProperty('beam3.scale.x', 1.5)
    setProperty('beam3.scale.y', 1.5)
    
    setProperty('beam3.scrollFactor.y', 0)
    addLuaSprite('beam3', false)
    doTweenColor('beam3', 'beam3', '0x00EF9206', 0.01, 'linear')
    setProperty('beam3.alpha', 0)


    makeLuaText('YOU', 'YOU', -2000)
    setProperty('YOU.scrollFactor.x', 1)
    setProperty('YOU.scrollFactor.y', 1)
    setObjectCamera('YOU', 'game')
    addLuaText('YOU')
    setTextSize('YOU', 32)

    setProperty('camHUD.alpha', 0)

    local noteCount = getProperty('unspawnNotes.length')
    for i = 0, noteCount-1 do
        for j = 0, #characterList-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == getCharNoteType(characterList[j+1]) then 
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            end
        end
        local nt = getPropertyFromGroup('unspawnNotes', i, 'noteType')

        if string.lower(difficultyName) ~= 'regular' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
        end

        if string.lower(difficultyName) == 'insane' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
        elseif string.lower(difficultyName) == 'tabi' and nt == 'TabiSing' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
        elseif string.lower(difficultyName) == 'tricky' and nt == 'TrickySing' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
        elseif string.lower(difficultyName) == 'whitty' and nt == 'WhittySing' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
        elseif string.lower(difficultyName) == 'agoti' and nt == 'AgotiSing' then 
            setPropertyFromGroup('unspawnNotes', i, 'mustPress', true)
        end
        --

        if string.find(getPropertyFromGroup('unspawnNotes', i, 'noteType'), 'sing') then
           -- runHaxeCode('game.unspawnNotes['..i..'].cameras = [game.camGame];') --set cam
            --local n = getPropertyFromGroup('unspawnNotes', i, 'noteType')
            
            
            setPropertyFromGroup('unspawnNotes', i, 'copyX', false) --doing positioning myself
            setPropertyFromGroup('unspawnNotes', i, 'copyY', false)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
            --setPropertyFromGroup('unspawnNotes', i, 'hitByOpponent', true) --stops being hit normally
            setPropertyFromGroup('unspawnNotes', i, 'scrollFactor.x', 1)
            setPropertyFromGroup('unspawnNotes', i, 'scrollFactor.y', 1)

            
            --setPropertyFromGroup('unspawnNotes', i, 'flipY', false) --for upscroll
            --setPropertyFromGroup('unspawnNotes', i, 'x', 10000) --hide offscreen lol
		end
    end

    runHaxeCode([[
        game.remove(game.notes);
        game.remove(game.strumLineNotes);
        game.remove(game.grpNoteSplashes);
        game.add(game.strumLineNotes);
        game.add(game.notes);
        game.add(game.grpNoteSplashes);
    ]])
    runHaxeCode([[
        game.notes.cameras = [FlxG.camera];
        game.strumLineNotes.cameras = [FlxG.camera];
        game.grpNoteSplashes.cameras = [FlxG.camera];
    ]])



end

function getCharNoteType(char)
    for i = 1, #charToNoteTypeMap do 
        if charToNoteTypeMap[i][1] == char then 
            return charToNoteTypeMap[i][2]
        end
    end
    return ''
end


function onEvent(tag, val1, val2)
    if tag == 'createCharacter' then
        local character = val1
        runHaxeCode('game.variables["'..character..'"] = new Character(0,0, "'..character..'");')
        runHaxeCode('game.insert(game.members.indexOf(game.boyfriendGroup), game.variables["'..character..'"]);')
        table.insert(characterList, character)
    end
end


local singAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
local maniaShit = {
    {2},
    {0,3},
    {0,2,3},
    {0,1,2,3},
    {0,1,2,2,3},
    {0,2,3,0,1,3},
    {0,2,3,2,0,1,3},
    {0,1,2,3,0,1,2,3},
    {0,1,2,3,2,0,1,2,3},
    {0,1,2,3,2,2,0,1,2,3},
    {0,1,2,3,2,2,2,0,1,2,3}
}
function getSingAnim(data)

    --return maniaShit[getPropertyFromClass('PlayState', 'mania')+1][data+1]+1
    return data+1
end


function onBeatHit()
	--play idle
    for i = 0, #characterList-1 do 
        --debugPrint(characterList[i+1])
        runHaxeCode('if (game.curBeat % game.variables["'..characterList[i+1]..'"].danceEveryNumBeats == 0 && game.variables["'..characterList[i+1]..'"].animation.curAnim != null && game.variables["'..characterList[i+1]..'"].animation.curAnim.name == "idle" && !game.variables["'..characterList[i+1]..'"].stunned) { game.variables["'..characterList[i+1]..'"].dance();}')
    end
end

function onCountdownTick()
    for i = 0, #characterList-1 do 
        --debugPrint(characterList[i+1])
        runHaxeCode('if (game.curBeat % game.variables["'..characterList[i+1]..'"].danceEveryNumBeats == 0 && game.variables["'..characterList[i+1]..'"].animation.curAnim != null && game.variables["'..characterList[i+1]..'"].animation.curAnim.name == "idle" && !game.variables["'..characterList[i+1]..'"].stunned) { game.variables["'..characterList[i+1]..'"].dance();}')
    end
end

local lastHitCharacter = 'tricky'
local lastOpponentHitCharacter = 'agoti'
local doTrails = false
function opponentNoteHit(id, noteData, ntype, sus)
    for i = 0, #characterList-1 do 
        if ntype == getCharNoteType(characterList[i+1]) then 
            runHaxeCode('game.variables["'..characterList[i+1]..'"].playAnim("'..singAnims[getSingAnim(noteData)]..'", true);')
		    runHaxeCode('game.variables["'..characterList[i+1]..'"].holdTimer = 0;')
            lastOpponentHitCharacter = characterList[i+1]
        end
    end
    hitStrum(id, noteData, ntype, sus, false)
end
function goodNoteHit(id, noteData, ntype, sus)
    for i = 0, #characterList-1 do 
        if ntype == getCharNoteType(characterList[i+1]) then 
            runHaxeCode('game.variables["'..characterList[i+1]..'"].playAnim("'..singAnims[getSingAnim(noteData)]..'", true);')
		    runHaxeCode('game.variables["'..characterList[i+1]..'"].holdTimer = 0;')
            lastHitCharacter = characterList[i+1]
        end
    end
    hitStrum(id, noteData, ntype, sus, true)
end
function hitStrum(id, noteData, n, sus, isPlayer)
    setProperty('camZooming', true)
    local keyCount = 4
    local isSusEnd = string.find(string.lower(getPropertyFromGroup('notes', id, 'animation.curAnim.name')), 'end')
    local time = 0.15
    if isSusEnd then  
        time = time + 0.15
    end

    if n == 'TrickySing' then
        noteData = noteData+keyCount
        makeTrail('tricky')
    elseif n == 'AgotiSing' then
        noteData = noteData+(keyCount*2)
        makeTrail('agoti')
    elseif n == 'WhittySing' then
        noteData = noteData+(keyCount*3)
        makeTrail('whitty')
    elseif n == 'TabiSing' then
        noteData = noteData+(keyCount*4)
        makeTrail('tabi')
    end
    runHaxeCode('game.StrumPlayAnim(true, '..(noteData+keyCount)..', '..time..');') --play strum anim

    if isPlayer and getPropertyFromClass('ClientPrefs', 'noteSplashes') and not sus and getPropertyFromGroup('notes', id, 'rating') == 'sick' then 
        runHaxeCode([[
        var skin = 'noteSplashes';
        var data = ]]..(noteData%4)..[[;
        var strum = game.strumLineNotes.members[]]..(noteData+keyCount)..[[];

		var hue = 0;
		var sat = 0;
		var brt = 0;
		if (data > -1 && data < ClientPrefs.arrowHSV.length)
		{
			hue = ClientPrefs.arrowHSV[data][0] / 360;
			sat = ClientPrefs.arrowHSV[data][1] / 100;
			brt = ClientPrefs.arrowHSV[data][2] / 100;
		}

		var splash = game.grpNoteSplashes.recycle(NoteSplash);
		splash.setupNoteSplash(strum.x, strum.y, data, skin, hue, sat, brt);
        splash.scrollFactor.x = 1;
        splash.scrollFactor.y = 1;
		game.grpNoteSplashes.add(splash);
        ]])
    end

end
local iTime = 0
local camXNoiseTime = 0
local camYNoiseTime = 0
local camAngleNoiseTime = 0
local camPosRange = 25
local camAngleRange = 2
local perlinSpeed = 1

local YOULerp = -2000.0
local currentChar = -1
function onUpdatePost(elapsed)
    if getProperty('isDead') then 
        return
    end
    camXNoiseTime = camXNoiseTime + elapsed*math.random()*perlinSpeed
    camYNoiseTime = camYNoiseTime + elapsed*math.random()*perlinSpeed
    camAngleNoiseTime = camAngleNoiseTime + elapsed*math.random()*perlinSpeed

    local camXOffset = noise(camXNoiseTime, 0, 0)*camPosRange
    local camYOffset = noise(0, camYNoiseTime, 0)*camPosRange
    local camZOffset = noise(0, 0, camAngleNoiseTime)*camAngleRange

    setProperty('camGame.angle', camZOffset)
    if mustHitSection or string.lower(difficultyName) ~= 'regular' then
        runHaxeCode('game.camFollow.set(game.variables["'..lastHitCharacter..'"].getMidpoint().x + 150, game.variables["'..lastHitCharacter..'"].getMidpoint().y - 100);')
        runHaxeCode('game.camFollow.x += game.variables["'..lastHitCharacter..'"].cameraPosition[0] + '..camXOffset..';')
        runHaxeCode('game.camFollow.y += game.variables["'..lastHitCharacter..'"].cameraPosition[1] + '..camYOffset..';')
    else 
        runHaxeCode('game.camFollow.set(game.variables["'..lastOpponentHitCharacter..'"].getMidpoint().x + 150, game.variables["'..lastOpponentHitCharacter..'"].getMidpoint().y - 100);')
        runHaxeCode('game.camFollow.x += game.variables["'..lastOpponentHitCharacter..'"].cameraPosition[0] + '..camXOffset..';')
        runHaxeCode('game.camFollow.y += game.variables["'..lastOpponentHitCharacter..'"].cameraPosition[1] + '..camYOffset..';')
    end
   
    --runHaxeCode('game.variables["smoke"].setFloat("iTime", '..(tonumber(iTime))..');')
    --setMod('camX', -(getProperty('camFollowPos.x')*getProperty('camGame.zoom'))+1000)
    --setMod('camY', -(getProperty('camFollowPos.y')*getProperty('camGame.zoom'))+300)
    updateNotes()

    
    setProperty('YOU.x', lerp(elapsed*8, getProperty('YOU.x'), YOULerp))
end
function onGhostTap(key)
    if currentChar == -1 then 
        return
    end
    local strum = 8+(currentChar*4)+key
    runHaxeCode([[
        var strum = game.strumLineNotes.members[]]..strum..[[];
        strum.playAnim("pressed");
        strum.resetAnim = 0;
    ]])
end
function onKeyRelease(key)
    if currentChar == -1 then 
        return
    end
    local strum = 8+(currentChar*4)+key
    runHaxeCode([[
        var strum = game.strumLineNotes.members[]]..strum..[[];
        strum.playAnim("static");
        strum.resetAnim = 0;
    ]])
end
function onGameOverStart()
    setProperty('boyfriend.visible', false)
end

function onCountdownStarted()
	--luaDebugMode = true
    runHaxeCode('game.generateStaticArrows(2);') --make extra strums
    runHaxeCode('game.generateStaticArrows(3);')
    runHaxeCode('game.generateStaticArrows(4);')
    runHaxeCode('game.generateStaticArrows(5);')
    for i = 8,23 do
        runHaxeCode([[
            var i = ]]..i..[[;
            //game.strumLineNotes.members[i].cameras = [FlxG.camera];
            game.strumLineNotes.members[i].scrollFactor.x = 1;
            game.strumLineNotes.members[i].scrollFactor.y = 1;
            game.strumLineNotes.members[i].visible = false;
        ]])
        --runHaxeCode('game.strumLineNotes.members['..i..'].cameras = [FlxG.camera];') --set cam
        --runHaxeCode('game.strumLineNotes.members['..i..'].scrollFactor.x = 1;')
        --runHaxeCode('game.strumLineNotes.members['..i..'].scrollFactor.y = 1;')
    end
    for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i , 'visible', false)
        setPropertyFromGroup('playerStrums', i , 'visible', false)
    end

end
local susScaleY = -1
local susEndScaleY = -1
function updateNotes()
    local noteCount = getProperty('notes.length');
    local fakeCrochet = (60 / bpm) * 1000

    local keyCount = 4;
    local arrowSize = 112

    local currentBeat = (getSongPosition() / 1000)*(bpm/60)

    local strumY = 700
    if not downscroll then 
        strumY = -50
        setProperty('YOU.y', 700)
    end

    for i = 8,23 do
        local gap = 50*math.floor((i-8)/4)
        setPropertyFromGroup('strumLineNotes', i, 'x', -1500+(112*i)+gap)
        setPropertyFromGroup('strumLineNotes', i, 'y', strumY)
        if (curBeat >= 456) then 
            setPropertyFromGroup('strumLineNotes', i, 'y', strumY+ 10*math.cos((currentBeat + i*0.25) * math.pi))
        end
    end

    local YOUPos = -1
    local YOUNoteStrumtime = 0

    for i = 0, noteCount-1 do
        
        local noteData = math.abs(getPropertyFromGroup('notes', i, 'noteData'));
        local isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
        local n = getPropertyFromGroup('notes', i, 'noteType')
        local isSusEnd = string.find(string.lower(getPropertyFromGroup('notes', i, 'animation.curAnim.name')), 'end')
        local speed = getProperty('songSpeed')
        local st = getPropertyFromGroup('notes', i, 'strumTime')
        --local yOffset = 50 - getPropertyFromGroup('strumLineNotes', noteData+4, 'y')
        local mustPress = getPropertyFromGroup('notes', i, 'mustPress')

        setPropertyFromGroup('notes', i, 'scrollFactor.x', 1)
        setPropertyFromGroup('notes', i, 'scrollFactor.y', 1)
        setPropertyFromGroup('notes', i, 'noteSplashDisabled', true)

        if n == 'TrickySing' then
            noteData = noteData+keyCount
            speed = 3
            if (YOUPos == -1 or st < YOUNoteStrumtime) and mustPress then 
                YOUPos = 0
                YOUNoteStrumtime = st
            end
        elseif n == 'AgotiSing' then
            noteData = noteData+(keyCount*2)
            speed = 3.2
            if (YOUPos == -1 or st < YOUNoteStrumtime) and mustPress then 
                YOUPos = 1
                YOUNoteStrumtime = st
            end
        elseif n == 'WhittySing' then
            noteData = noteData+(keyCount*3)
            speed = 2.6
            if (YOUPos == -1 or st < YOUNoteStrumtime) and mustPress then 
                YOUPos = 2
                YOUNoteStrumtime = st
            end
        elseif n == 'TabiSing' then
            noteData = noteData+(keyCount*4)
            speed = 2.9
            if (YOUPos == -1 or st < YOUNoteStrumtime) and mustPress then 
                YOUPos = 3
                YOUNoteStrumtime = st
            end
        end
        if not mustPress then 
            setPropertyFromGroup('notes', i, 'alpha', 0.35)
        end

        
        local curPos = (getSongPosition()-getPropertyFromGroup('notes', i, 'strumTime')) * speed
        

        noteData = noteData+keyCount
        
        if (downscroll) then 
            local notePosY = 0
            if isSustainNote then --fix downscroll sustains, just psych engine code put into lua
                setPropertyFromGroup('notes', i, 'flipY', true)

                
                if isSusEnd then
                    notePosY = notePosY + 10.5 * (fakeCrochet / 400) * 1.5 * scrollSpeed + (46 * (scrollSpeed - 1));
                    notePosY = notePosY - (46 * (1 - (fakeCrochet / 600)) * scrollSpeed);
                    notePosY = notePosY - 19;
                end
                notePosY = notePosY + ((arrowSize) / 2) - (60.5 * (scrollSpeed - 1));
                notePosY = notePosY + 27.5 * ((bpm / 100) - 1) * (scrollSpeed - 1);						
            end
            setPropertyFromGroup('notes', i, 'y', getPropertyFromGroup('strumLineNotes', noteData, 'y') + (curPos*0.45) + notePosY);


        else 
            setPropertyFromGroup('notes', i, 'y', getPropertyFromGroup('strumLineNotes', noteData, 'y') - (curPos*0.45)); --match y val properly
            setPropertyFromGroup('notes', i, 'flipY', false)
        end

        if isSustainNote then 
            if isSusEnd then 
                if (susEndScaleY == -1) then 
                    susEndScaleY = getPropertyFromGroup('notes', i, 'scale.y')
                end
                setPropertyFromGroup('notes', i, 'scale.y', susEndScaleY*(speed/getProperty('songSpeed')));
            else 
                if (susScaleY == -1) then 
                    susScaleY = getPropertyFromGroup('notes', i, 'scale.y')
                end
                setPropertyFromGroup('notes', i, 'scale.y', susScaleY*(speed/getProperty('songSpeed')));
            end

        end
        setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('strumLineNotes', noteData, 'x') + getPropertyFromGroup('notes', i, 'offsetX'))
    end

    if YOUPos ~= -1 then 
        local note = 8+1+(YOUPos*4)
        local gap = 50*math.floor((note-8)/4)
        YOULerp = -1500+(112*note)+gap+(112*0.5)
        currentChar = YOUPos
        --debugPrint(YOULerp)
    end
end

function onStepHit()
    if curStep == 64 then 
        runHaxeCode([[
            FlxTween.tween(game.variables["whitty"], {alpha: 1}, Conductor.crochet*0.001*2, {ease:FlxEase.cubeOut});
        ]])
        for i = 16, 19 do 
            setPropertyFromGroup('strumLineNotes', i , 'visible', true)
            noteTweenAlpha(i, i, 1, crochet*0.001*1.5+(i*0.5), 'cubeOut')
        end
        doTweenAlpha('beam2', 'beam2', 0.7, crochet*0.001*2, 'cubeOut')
    elseif curStep == 80 then 
        runHaxeCode([[
            FlxTween.tween(game.variables["agoti"], {alpha: 1}, Conductor.crochet*0.001*2, {ease:FlxEase.cubeOut});
        ]])
        for i = 12, 15 do 
            setPropertyFromGroup('strumLineNotes', i , 'visible', true)
            noteTweenAlpha(i, i, 1, crochet*0.001*1.5+(i*0.5), 'cubeOut')
        end
        doTweenAlpha('beam1', 'beam1', 0.7, crochet*0.001*2, 'cubeOut')
    elseif curStep == 96 then 
        runHaxeCode([[
            FlxTween.tween(game.variables["tricky"], {alpha: 1}, Conductor.crochet*0.001*2, {ease:FlxEase.cubeOut});
        ]])
        for i = 8, 11 do 
            setPropertyFromGroup('strumLineNotes', i , 'visible', true)
            noteTweenAlpha(i, i, 1, crochet*0.001*1.5+(i*0.5), 'cubeOut')
        end
        doTweenAlpha('beam0', 'beam0', 0.7, crochet*0.001*2, 'cubeOut')
    elseif curStep == 112 then 
        runHaxeCode([[
            FlxTween.tween(game.variables["tabi"], {alpha: 1}, Conductor.crochet*0.001*2, {ease:FlxEase.cubeOut});
        ]])
        for i = 20, 23 do 
            setPropertyFromGroup('strumLineNotes', i , 'visible', true)
            noteTweenAlpha(i, i, 1, crochet*0.001*1.5+(i*0.5), 'cubeOut')
        end
        doTweenAlpha('beam3', 'beam3', 0.7, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 128 then 
        perlinSpeed = 2
        doTweenAlpha('camHUD', 'camHUD', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1824 then 
        setProperty('cameraSpeed', 3.5)
        camPosRange = 50
        camAngleRange = 5
    elseif curStep == 2208 then 
        --setProperty('defaultCamZoom', 0.8)
        perlinSpeed = 1
    elseif curStep == 2336 then 
        --setProperty('defaultCamZoom', 0.5)
        perlinSpeed = 3
        camPosRange = 100
        camAngleRange = 10
        cameraFlash('game', '0xFFFF0000', 1)
        cameraShake('game', 0.05, crochet*0.001*12)
    elseif curStep == 2400 then 
        --setProperty('defaultCamZoom', 0.5)
        perlinSpeed = 0
        camPosRange = 0
        camAngleRange = 0
    end

    --local section = math.floor(curStep/16)

    --if section >= 8 and section < 24 then 
    --    if curStep % 8 == 4 then
    --        triggerEvent('Add Camera Zoom', '0.1', '0.05')
    --    end
    --end

    if curStep == 1792 then 
        makeLuaSprite('white', '', 0,0)
        makeGraphic('white', 3400, 2000, '0xFF000000')
        screenCenter('white')
        addLuaSprite('white', true)
        runHaxeCode([[
            game.variables["outlinetabi"].setBool("enabled", true);
            game.variables["outlineagoti"].setBool("enabled", true);
            game.variables["outlinewhitty"].setBool("enabled", true);
            game.variables["outlinetricky"].setBool("enabled", true);
        ]])
        doTrails = true
    elseif curStep == 1820 then 
        doTweenAlpha('white', 'white', 0, crochet*0.001, 'cubeOut')
    end
end
local trailCount = 0
function makeTrail(char)
    if not doTrails then 
        return
    end
    makeLuaSprite('trail'..trailCount, '', 0, 0)

    runHaxeCode(([[
        var spriteToCopy = game.variables["]]..char..[["];
        var leSprite = game.modchartSprites["trail]]..trailCount..[["];
        leSprite.loadGraphicFromSprite(spriteToCopy);
        leSprite.x = spriteToCopy.x;
        leSprite.y = spriteToCopy.y;
        leSprite.alpha = spriteToCopy.alpha;
        leSprite.angle = spriteToCopy.angle;
        leSprite.offset.x = spriteToCopy.offset.x;
        leSprite.offset.y = spriteToCopy.offset.y;
        leSprite.origin.x = spriteToCopy.origin.x;
        leSprite.origin.y = spriteToCopy.origin.y;
        leSprite.scale.x = spriteToCopy.scale.x;
        leSprite.scale.y = spriteToCopy.scale.y;
        leSprite.active = false;
        leSprite.animation.frameIndex = spriteToCopy.animation.frameIndex;
        leSprite.flipX = spriteToCopy.flipX;
        leSprite.flipY = spriteToCopy.flipY;
        leSprite.animation.curAnim = spriteToCopy.animation.curAnim;
        leSprite.shader = game.variables["outline]]..char..[["];
    ]]))

    doTweenAlpha('traila'..trailCount, 'trail'..trailCount, 0, crochet*0.001*2, 'quadOut')
    doTweenX('trailsx'..trailCount, 'trail'..trailCount..'.scale', 1.4, crochet*0.001*2, 'expoIn')
    doTweenY('trailsy'..trailCount, 'trail'..trailCount..'.scale', 1.4, crochet*0.001*2, 'expoIn')
    addLuaSprite('trail'..trailCount, false)

    --[[if char == 'tricky' then 
        doTweenColor('trailC'..trailCount, 'trail'..trailCount, '0x005F0205', 0.01, 'linear')
    elseif char == 'whitty' then 
        doTweenColor('trailC'..trailCount, 'trail'..trailCount, '0x006E0ED1', 0.01, 'linear')
    elseif char == 'tabi' then 
        doTweenColor('trailC'..trailCount, 'trail'..trailCount, '0x00EF9206', 0.01, 'linear')
    elseif char == 'agoti' then 
        doTweenColor('trailC'..trailCount, 'trail'..trailCount, '0x00888888', 0.01, 'linear')
    end]]--


    trailCount = trailCount + 1
end

