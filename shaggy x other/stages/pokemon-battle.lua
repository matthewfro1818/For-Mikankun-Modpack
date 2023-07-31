function onCreate()

    if (songName == recursed) then
        makeLuaSprite('background2', 'pokemon battle/background2', -1000, -600);
        addLuaSprite('background2', false)
        setGraphicSize('background2', '8000', '4000')
        setLuaSpriteScrollFactor('background2', 0.125, 0.5);
        setProperty('background2.visible', false)
    end

	makeLuaSprite('background', 'pokemon battle/background', -1000, -600);
    addLuaSprite('background', false)
    setGraphicSize('background', '8000', '4000')
    setLuaSpriteScrollFactor('background', 0.125, 0.5);

	makeLuaSprite('place1', 'pokemon battle/Purple_place', 2400, 1000);
    addLuaSprite('place1', false)
    setGraphicSize('place1', '1000', '500')
    
	makeLuaSprite('place2', 'pokemon battle/Purple_place', 780, 1470);
    addLuaSprite('place2', false)
    setGraphicSize('place2', '1250', '750')
end

local lerpedsh_r = 600

function onUpdate(elapsed)
    if mustHitSection == false then
        setProperty('defaultCamZoom', 0.6); --0.64
    else
        setProperty('defaultCamZoom', 0.7);        
    end

    --if (songName == recursed) then
        local rotRateSh = curStep / 9.5

		local sh_toy = 1000 + math.sin(rotRateSh * 2) * lerpedsh_r * 0.45
		local sh_tox = 1500 - math.cos(rotRateSh) * lerpedsh_r;

        setProperty('dad.y', getProperty('dad.y') + (sh_toy-getProperty('dad.y'))/12);
        setProperty('dad.x', getProperty('dad.x') + (sh_tox-getProperty('dad.x'))/12);
        setProperty('place2.x', getProperty('dad.x') - (getProperty('place2.height')/ 1.7)) 
    --end
end