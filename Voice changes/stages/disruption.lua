function onCreate()
	local sprite_directory = "disruption/"
	
	makeLuaSprite("bg", sprite_directory .. "disruptor", -(1280 / 2), -(720 / 2))
	scaleObject("bg", 1, 1)
	setScrollFactor("bg", 0.25, 0.25)
	addLuaSprite("bg", false)
	addGlitchEffect("bg", 1.5, 4, 0.1)
	
	makeLuaSprite("black", sprite_directory .. "black", -320, -160)
	scaleObject("black", 1, 1)
	setScrollFactor("black", 0, 0)
	setBlendMode("black", "multiply")
	setProperty("black.alpha", 0.2)
	addLuaSprite("black", false)
	
	setProperty("cameraSpeed", 1.25)
	
	setCharacterY("gf", -4096)
end

local window_default = {}
local window_offset = {0, 0}

local receptor_offset = 0

local beat = 0
local step = 0

local lerp_alpha = 0.1
local function lerp(start, goal, alpha)
	return (start + ((goal - start) * alpha))
end

function onBeatHit()
	beat = beat + 1
	
	if beat >= 32 then
		bop_count = bop_count + 1
		bop_counter = bop_counter + 1
		
		if bop_counter == 2 then
			bop(15)
		end
		
		if bop_counter >= 4 then
			bop_counter = 0
			
			bop(30)
		end
	end
end

function onStepHit()
	step = step + 1
end

local receptor_default = {}
local receptor_offset = {}
local receptor_small_speed = 0.5
local receptor_speed = 0.1
local receptor_multiplier = 0

local bg_tween_count = 1

function onSongStart()
	
    for i = 0, 7 do 
        local x = getPropertyFromGroup("strumLineNotes", i, "x")
        local y = getPropertyFromGroup("strumLineNotes", i, "y")
 
        receptor_default[i] = {x, y}
		receptor_offset[i] = {0, 0}
    end
end

local song_position = 0
function onUpdate()
	if beat >= 32 then
		receptor_multiplier = receptor_multiplier + 0.0005
		if receptor_multiplier > 1 then
			receptor_multiplier = 1
		end
	end
	
	if curStep == 1669 then
	setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
	end
	if curStep == 3162 then
	setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	end
	song_position = -(getPropertyFromClass("Conductor", "songPosition") / 1000) / receptor_small_speed
	
	for i = 0, 3 do
		local opp_receptor_x = {
			[1] = 4 * math.sin((song_position + (i * 0.25)) * math.pi)
		}
		local opp_receptor_y = {
			[1] = 4 * math.cos((song_position + (i * 0.25)) * math.pi)
		}
		local opp_receptor_angle
		
		if i % 2 == 0 then
			opp_receptor_x[2] = (52 * receptor_multiplier) * math.sin((song_position + (i * 0.25)) * (math.pi / 8))
			opp_receptor_y[2] = (52 * receptor_multiplier) * math.cos((song_position + (i * 0.25)) * (math.pi / 8))
			opp_receptor_angle = (4 * receptor_multiplier) * math.sin((song_position + (i * 0.25)) * (math.pi / 4))
		else
			opp_receptor_x[2] = (52 * receptor_multiplier) * -math.sin((song_position + (i * 0.25)) * (math.pi / 8))
			opp_receptor_y[2] = (52 * receptor_multiplier) * -math.cos((song_position + (i * 0.25)) * (math.pi / 8))
			opp_receptor_angle = (4 * receptor_multiplier) * -math.sin((song_position + (i * 0.25)) * (math.pi / 4))
		end
		
		if lowQuality then
			setPropertyFromGroup("strumLineNotes", i, "x",
			receptor_default[i][1] + opp_receptor_x[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "y",
				receptor_default[i][2] + opp_receptor_y[2]
			)
		else
			setPropertyFromGroup("strumLineNotes", i, "x",
			receptor_default[i][1] + opp_receptor_x[1] + opp_receptor_x[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "y",
				receptor_default[i][2] + opp_receptor_y[1] + opp_receptor_y[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "angle",
				opp_receptor_angle
			)
		end
	end
	
	for i = 4, 7 do
		local bf_receptor_x = {
			[1] = 4 * math.cos((song_position + (i * 0.25)) * math.pi)
		}
		local bf_receptor_y = {
			[1] = 4 * math.sin((song_position + (i * 0.25)) * math.pi)
		}
		local bf_receptor_angle
		
		if i % 2 == 0 then
			bf_receptor_x[2] = (52 * receptor_multiplier) * math.sin((song_position + (i * 0.25)) * (math.pi / 8))
			bf_receptor_y[2] = (52 * receptor_multiplier) * math.cos((song_position + (i * 0.25)) * (math.pi / 8))
			bf_receptor_angle = (4 * receptor_multiplier) * math.sin((song_position + (i * 0.25)) * (math.pi / 4))
		else
			bf_receptor_x[2] = (52 * receptor_multiplier) * -math.sin((song_position + (i * 0.25)) * (math.pi / 8))
			bf_receptor_y[2] = (52 * receptor_multiplier) * -math.cos((song_position + (i * 0.25)) * (math.pi / 8))
			bf_receptor_angle = (4 * receptor_multiplier) * -math.sin((song_position + (i * 0.25)) * (math.pi / 4))
		end
		
		if lowQuality then
			setPropertyFromGroup("strumLineNotes", i, "x",
			receptor_default[i][1] + bf_receptor_x[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "y",
				receptor_default[i][2] + bf_receptor_y[2]
			)
		else
			setPropertyFromGroup("strumLineNotes", i, "x",
			receptor_default[i][1] + bf_receptor_x[1] + bf_receptor_x[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "y",
				receptor_default[i][2] + bf_receptor_y[1] + bf_receptor_y[2]
			)
			setPropertyFromGroup("strumLineNotes", i, "angle",
				bf_receptor_angle
			)
		end
	end
	
	setProperty("dad.y", 200 + (52 * (math.sin(song_position) * (math.pi / 4))))
	
	setProperty("black.alpha", 0.25 + (math.sin(song_position * (math.pi / 6)) / 4))
	
	
	
	if not lowQuality then
		
		setProperty("camHUD.angle", 1 * math.cos((song_position) * (math.pi / 2)))
	end
end

function opponentNoteHit()
    if getProperty("health") > 0.05 then
        setProperty("health", getProperty("health") - 0.01)
    end
	
	if lowQuality then
		cameraShake("game", 0.01, 0.05)
		cameraShake("hud", 0.01, 0.05)
	else
		window_offset[1] = window_offset[1] + 5
		window_offset[2] = window_offset[2] + 5
		
		cameraShake("game", 0.005, 0.05)
		cameraShake("hud", 0.005, 0.05)
	end
end