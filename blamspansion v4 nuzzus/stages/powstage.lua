local xx = 500
local yy = 600
local xx2 = 1000

function onCreate()

    makeLuaSprite('MOOGU_bg3', 'lobbybg', -1000, 0);
	addLuaSprite('MOOGU_bg3', false); 
    scaleObject('MOOGU_bg3', 1.3, 1.3)

	makeLuaSprite('MOOGU_bg4', 'box', 50, 550);
	addLuaSprite('MOOGU_bg4', false); 
    scaleObject('MOOGU_bg4', 1, 1)

end

function onUpdate()
    setProperty("gf.alpha", 0)
    if mustHitSection == false then
		triggerEvent('Camera Follow Pos',xx,yy)
	else
		triggerEvent('Camera Follow Pos',xx2,yy)
	end
end

