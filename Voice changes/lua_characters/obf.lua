-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bf') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('obf', 'characters/BOYFRIEND', 0, 0)

		addAnimationByPrefix('obf', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('obf', 'singLEFT', 'BF NOTE LEFT', 24, false) 
		
		addAnimationByPrefix('obf', 'singDOWN', 'BF NOTE DOWN', 24, false) 
		
		addAnimationByPrefix('obf', 'singUP', 'BF NOTE UP', 24, false) 
		
		addAnimationByPrefix('obf', 'singRIGHT', 'BF NOTE RIGHT', 24, false) 

		addAnimationByPrefix('obf', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false) 
		
		addAnimationByPrefix('obf', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('obf', 'singUPmiss', 'BF NOTE UP MISS', 24, false) 
		
		addAnimationByPrefix('obf', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
		
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('obf', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('obf', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('obf.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('obf','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('obf.animation.curAnim.name') ~= 'idle' and not getProperty('obf.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('obf.animation.curAnim.name') == 'idle' then
                setProperty('obf.offset.x',-5)
				setProperty('obf.offset.y',0)
                
			
			elseif getProperty('obf.animation.curAnim.name') == 'singLEFT' then
                setProperty('obf.offset.x',5)
				setProperty('obf.offset.y',-6)
              
			
			elseif getProperty('obf.animation.curAnim.name') == 'singUP' then
                setProperty('obf.offset.x',-29)
				setProperty('obf.offset.y',27)
               
			
			elseif getProperty('obf.animation.curAnim.name') == 'singDOWN' then
                setProperty('obf.offset.x',-10)
				setProperty('obf.offset.y',-50)
                
			
			elseif getProperty('obf.animation.curAnim.name') == 'singRIGHT' then
                setProperty('obf.offset.x',-48)
				setProperty('obf.offset.y',-7)

			elseif getProperty('obf.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('obf.offset.x',7)
				setProperty('obf.offset.y',19)
              
			
			elseif getProperty('obf.animation.curAnim.name') == 'singUPmiss' then
                setProperty('obf.offset.x',-36)
				setProperty('obf.offset.y',27)
               
			
			elseif getProperty('obf.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('obf.offset.x',-15)
				setProperty('obf.offset.y',-19)
                
			
			elseif getProperty('obf.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('obf.offset.x',-44)
				setProperty('obf.offset.y',22)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bf' and noteData == 0 then

	objectPlayAnimation('obf', 'singLEFT',true);

end

if noteType == 'bf' and noteData == 1 then

	objectPlayAnimation('obf', 'singDOWN',true);

end

if noteType == 'bf' and noteData == 2 then

	objectPlayAnimation('obf', 'singUP',true);

end

if noteType == 'bf' and noteData == 3 then

	objectPlayAnimation('obf', 'singRIGHT',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('obf', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('obf', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('obf', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('obf', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('obf', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('obf', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('obf', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('obf', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bf' and noteData == 0 then

		objectPlayAnimation('obf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 1 then
	
		objectPlayAnimation('obf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 2 then
	
		objectPlayAnimation('obf', 'singUPmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 3 then
	
		objectPlayAnimation('obf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('obf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('obf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('obf', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('obf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('obf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('obf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('obf', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('obf', 'singRIGHTmiss',true);
	
	end

end


