-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/Godmatt_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('Godmatt', 'characters/bsidegodmatt', 0, 0)

		addAnimationByPrefix('Godmatt', 'idle', 'matt idle', 24, true) 
		
        addAnimationByPrefix('Godmatt', 'singLEFT', 'matt left note0', 24, false) 
		
		addAnimationByPrefix('Godmatt', 'singDOWN', 'matt down note0', 24, false) 
		
		addAnimationByPrefix('Godmatt', 'singUP', 'matt up note0', 24, false) 
		
		addAnimationByPrefix('Godmatt', 'singRIGHT', 'matt right note0', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('Godmatt', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('Godmatt', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('Godmatt.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('Godmatt','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('Godmatt.animation.curAnim.name') ~= 'idle' and not getProperty('Godmatt.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('Godmatt.animation.curAnim.name') == 'idle' then
                setProperty('Godmatt.offset.x',-12)
				setProperty('Godmatt.offset.y',-247)
                
			
			elseif getProperty('Godmatt.animation.curAnim.name') == 'singLEFT' then
                setProperty('Godmatt.offset.x',3)
				setProperty('Godmatt.offset.y',-274)
              
			
			elseif getProperty('Godmatt.animation.curAnim.name') == 'singUP' then
                setProperty('Godmatt.offset.x',-170)
				setProperty('Godmatt.offset.y',-39)
               
			
			elseif getProperty('Godmatt.animation.curAnim.name') == 'singDOWN' then
                setProperty('Godmatt.offset.x',-141)
				setProperty('Godmatt.offset.y',-154)
                
			
			elseif getProperty('Godmatt.animation.curAnim.name') == 'singRIGHT' then
                setProperty('Godmatt.offset.x',-188)
				setProperty('Godmatt.offset.y',-297)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'Godmatt_Sing' and noteData == 0 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'Godmatt_Sing' and noteData == 1 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'Godmatt_Sing' and noteData == 2 then

	objectPlayAnimation('Godmatt', 'singUP',true);

end

if noteType == 'Godmatt_Sing' and noteData == 3 then

	objectPlayAnimation('Godmatt', 'singRIGHT',true);

end

if noteType == 'Godmatt_Sing' and noteData == 4 then

	objectPlayAnimation('Godmatt', 'singUP',true);

end

if noteType == 'Godmatt_Sing' and noteData == 5 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'Godmatt_Sing' and noteData == 6 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'Godmatt_Sing' and noteData == 7 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'Godmatt_Sing' and noteData == 8 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'Godmatt_Sing' and noteData == 9 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'caution' and noteData == 0 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'caution' and noteData == 1 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'caution' and noteData == 2 then

	objectPlayAnimation('Godmatt', 'singUP',true);

end

if noteType == 'caution' and noteData == 3 then

	objectPlayAnimation('Godmatt', 'singRIGHT',true);

end

if noteType == 'caution' and noteData == 4 then

	objectPlayAnimation('Godmatt', 'singUP',true);

end

if noteType == 'caution' and noteData == 5 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'caution' and noteData == 6 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'caution' and noteData == 7 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

if noteType == 'caution' and noteData == 8 then

	objectPlayAnimation('Godmatt', 'singLEFT',true);

end

if noteType == 'caution' and noteData == 9 then

	objectPlayAnimation('Godmatt', 'singDOWN',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


