local baittbl = {
  {
    name="bait",
    pos={981,181,741}
  },
  {
    name="bait1",
    pos={662,405,422}
  },
  {
    name="bait2",
    pos={985,500,745}
  },
  {
    name="bait3",
    pos={680,8,440}
  },
  {
    name="bait4",
    pos={981,181,741}
  },
  {
    name="bait5",
    pos={959,10,719}
  },
  {
    name="bait6",
    pos={630,235,390}
  },
  {
    name="bait7",
    pos={722,500,482}
  },
  {
    name="bait8",
    pos={975,300,682}
  },
}
  -- Probably a good idea to put this outside of the function or something
function onCreate()
--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a sage note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'sage' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'sagenotes'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	for i,v in pairs(baittbl) do -- I is the current position, V is the current object
	if not middlescroll then
  makeLuaSprite(v.name, "bait/pic".. i, v.pos[1], v.pos[2])
  elseif middlescroll then
  makeLuaSprite(v.name, "bait/pic".. i, v.pos[3], v.pos[2])
		end
  setObjectCamera(v.name, 'hud')
  setScrollFactor(v.name, 0, 0)
	end
end

--function onSongStart()
--debugPrint("misses ", getProperty('songMisses'))
--end

function min(a,b) if a > b then return b else return a end end
local notes = {
  ["sage"] = {
    misses = 0,
    max = 7,
    func = function(self)
      addLuaSprite('bait' .. min(self.misses,self.max), true);
 --     debugPrint("Lua sprite should've spawned!")
    end,
  },
}
function noteMiss(id, direction, noteType, isSus)
  if (notes[noteType]) then

 --   debugPrint(noteType .. " found")
    notes[noteType].misses = notes[noteType].misses + 1
 --   debugPrint(noteType .. " has " .. notes[noteType].misses .. "misses")
    if notes[noteType].func then
--      debugPrint("Note has function")
      notes[noteType].func(notes[noteType])
    end
  end
end