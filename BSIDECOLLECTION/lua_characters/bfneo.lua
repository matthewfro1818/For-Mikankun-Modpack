-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bfneo_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bfneo', 'characters/bfneo', 0, 0)

		addAnimationByPrefix('bfneo', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('bfneo', 'singLEFT', 'BF NOTE LEFT0', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singDOWN', 'BF NOTE DOWN0', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singUP', 'BF NOTE UP0', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singRIGHT', 'BF NOTE RIGHT0', 24, false) 

		addAnimationByPrefix('bfneo', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singUPmiss', 'BF NOTE UP MISS', 24, false) 
		
		addAnimationByPrefix('bfneo', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bfneo', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bfneo', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bfneo.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bfneo','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bfneo.animation.curAnim.name') ~= 'idle' and not getProperty('bfneo.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bfneo.animation.curAnim.name') == 'idle' then
                setProperty('bfneo.offset.x',-10)
				setProperty('bfneo.offset.y',5)
                
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singLEFT' then
                setProperty('bfneo.offset.x',25)
				setProperty('bfneo.offset.y',-6)
              
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singUP' then
                setProperty('bfneo.offset.x',-19)
				setProperty('bfneo.offset.y',17)
               
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singDOWN' then
                setProperty('bfneo.offset.x',0)
				setProperty('bfneo.offset.y',-45)
                
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bfneo.offset.x',-18)
				setProperty('bfneo.offset.y',-7)

			elseif getProperty('bfneo.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('bfneo.offset.x',27)
				setProperty('bfneo.offset.y',8)
              
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singUPmiss' then
                setProperty('bfneo.offset.x',-19)
				setProperty('bfneo.offset.y',17)
               
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('bfneo.offset.x',-5)
				setProperty('bfneo.offset.y',-29)
                
			
			elseif getProperty('bfneo.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('bfneo.offset.x',-24)
				setProperty('bfneo.offset.y',12)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bfneo_Sing' and noteData == 0 then

	objectPlayAnimation('bfneo', 'singLEFT',true);

end

if noteType == 'bfneo_Sing' and noteData == 1 then

	objectPlayAnimation('bfneo', 'singDOWN',true);

end

if noteType == 'bfneo_Sing' and noteData == 2 then

	objectPlayAnimation('bfneo', 'singUP',true);

end

if noteType == 'bfneo_Sing' and noteData == 3 then

	objectPlayAnimation('bfneo', 'singRIGHT',true);

end

if noteType == 'bfneo_Sing' and noteData == 4 then

	objectPlayAnimation('bfneo', 'singUP',true);

end

if noteType == 'bfneo_Sing' and noteData == 5 then

	objectPlayAnimation('bfneo', 'singDOWN',true);

end

if noteType == 'bfneo_Sing' and noteData == 6 then

	objectPlayAnimation('bfneo', 'singLEFT',true);

end

if noteType == 'bfneo_Sing' and noteData == 7 then

	objectPlayAnimation('bfneo', 'singDOWN',true);

end

if noteType == 'bfneo_Sing' and noteData == 8 then

	objectPlayAnimation('bfneo', 'singUP',true);

end

if noteType == 'bfneo_Sing' and noteData == 9 then

	objectPlayAnimation('bfneo', 'singRIGHT',true);

end

if noteType == 'BOBF' and noteData == 0 then

	objectPlayAnimation('bfneo', 'singLEFT',true);

end

if noteType == 'BOBF' and noteData == 1 then

	objectPlayAnimation('bfneo', 'singDOWN',true);

end

if noteType == 'BOBF' and noteData == 2 then

	objectPlayAnimation('bfneo', 'singUP',true);

end

if noteType == 'BOBF' and noteData == 3 then

	objectPlayAnimation('bfneo', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bfneo_Sing' and noteData == 0 then

		objectPlayAnimation('bfneo', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 1 then
	
		objectPlayAnimation('bfneo', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 2 then
	
		objectPlayAnimation('bfneo', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 3 then
	
		objectPlayAnimation('bfneo', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bfneo_Sing' and noteData == 4 then

		objectPlayAnimation('bfneo', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 5 then
	
		objectPlayAnimation('bfneo', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 6 then
	
		objectPlayAnimation('bfneo', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 7 then
	
		objectPlayAnimation('bfneo', 'singDOWNmiss',true);
	
	end

	if noteType == 'bfneo_Sing' and noteData == 8 then
	
		objectPlayAnimation('bfneo', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfneo_Sing' and noteData == 9 then
	
		objectPlayAnimation('bfneo', 'singRIGHTmiss',true);
	
	end

end


