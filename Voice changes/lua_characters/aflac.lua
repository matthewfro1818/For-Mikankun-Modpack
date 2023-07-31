-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/aflac_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('aflac', 'characters/aflactheend', 0, 0)

		addAnimationByPrefix('aflac', 'idle', 'AflacGod_Idle', 24, false) 
		
        addAnimationByPrefix('aflac', 'singLEFT', 'AflacGod_Left', 24, false) 
		
		addAnimationByPrefix('aflac', 'singDOWN', 'AflacGod_Down', 24, false) 
		
		addAnimationByPrefix('aflac', 'singUP', 'AflacGod_Up', 24, false) 
		
		addAnimationByPrefix('aflac', 'singRIGHT', 'AflacGod_Right', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('aflac', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('aflac', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('aflac.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('aflac','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('aflac.animation.curAnim.name') ~= 'idle' and not getProperty('aflac.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('aflac.animation.curAnim.name') == 'idle' then
                setProperty('aflac.offset.x',-55)
				setProperty('aflac.offset.y',155)
                
			
			elseif getProperty('aflac.animation.curAnim.name') == 'singLEFT' then
                setProperty('aflac.offset.x',297)
				setProperty('aflac.offset.y',151)
              
			
			elseif getProperty('aflac.animation.curAnim.name') == 'singUP' then
                setProperty('aflac.offset.x',-26)
				setProperty('aflac.offset.y',236)
               
			
			elseif getProperty('aflac.animation.curAnim.name') == 'singDOWN' then
                setProperty('aflac.offset.x',33)
				setProperty('aflac.offset.y',83)
                
			
			elseif getProperty('aflac.animation.curAnim.name') == 'singRIGHT' then
                setProperty('aflac.offset.x',-157)
				setProperty('aflac.offset.y',152)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'aflac_Sing' and noteData == 0 then

	objectPlayAnimation('aflac', 'singLEFT',true);

end

if noteType == 'aflac_Sing' and noteData == 1 then

	objectPlayAnimation('aflac', 'singDOWN',true);

end

if noteType == 'aflac_Sing' and noteData == 2 then

	objectPlayAnimation('aflac', 'singUP',true);

end

if noteType == 'aflac_Sing' and noteData == 3 then

	objectPlayAnimation('aflac', 'singRIGHT',true);
end

if noteType == 'bees_Sing' and noteData == 0 then

	objectPlayAnimation('aflac', 'singLEFT',true);

end

if noteType == 'bees_Sing' and noteData == 1 then

	objectPlayAnimation('aflac', 'singDOWN',true);

end

if noteType == 'bees_Sing' and noteData == 2 then

	objectPlayAnimation('aflac', 'singUP',true);

end

if noteType == 'bees_Sing' and noteData == 3 then

	objectPlayAnimation('aflac', 'singRIGHT',true);
end

end

function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


