-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/salty') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('salty', 'characters/salty', 0, 0)

		addAnimationByPrefix('salty', 'idle', 'BF idle dance', 14, false) 
		
		addAnimationByPrefix('salty', 'singLEFT', 'BF NOTE LEFT0', 15, false) 
		
		addAnimationByPrefix('salty', 'singDOWN', 'BF NOTE DOWN0', 30, false) 
		
		addAnimationByPrefix('salty', 'singUP', 'BF NOTE UP0', 15, false) 
		
		addAnimationByPrefix('salty', 'singRIGHT', 'BF NOTE RIGHT0', 62, false) 

		addAnimationByPrefix('salty', 'singLEFTmiss', 'BF NOTE LEFT MISS', 34, false) 
		
		addAnimationByPrefix('salty', 'singDOWNmiss', 'BF NOTE DOWN MISS', 29, false) 
		
		addAnimationByPrefix('salty', 'singUPmiss', 'BF NOTE UP MISS', 24, false) 
		
		addAnimationByPrefix('salty', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 46, false)
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('salty', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('salty', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('salty.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('salty','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('salty.animation.curAnim.name') ~= 'idle' and not getProperty('salty.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('salty.animation.curAnim.name') == 'idle' then
                setProperty('salty.offset.x',-10)
				setProperty('salty.offset.y',5)
                
			
			elseif getProperty('salty.animation.curAnim.name') == 'singLEFT' then
                setProperty('salty.offset.x',25)
				setProperty('salty.offset.y',-6)
              
			
			elseif getProperty('salty.animation.curAnim.name') == 'singUP' then
                setProperty('salty.offset.x',-19)
				setProperty('salty.offset.y',17)
               
			
			elseif getProperty('salty.animation.curAnim.name') == 'singDOWN' then
                setProperty('salty.offset.x',0)
				setProperty('salty.offset.y',-45)
                
			
			elseif getProperty('salty.animation.curAnim.name') == 'singRIGHT' then
                setProperty('salty.offset.x',-18)
				setProperty('salty.offset.y',-7)

			elseif getProperty('salty.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('salty.offset.x',27)
				setProperty('salty.offset.y',8)
              
			
			elseif getProperty('salty.animation.curAnim.name') == 'singUPmiss' then
                setProperty('salty.offset.x',-19)
				setProperty('salty.offset.y',17)
               
			
			elseif getProperty('salty.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('salty.offset.x',-5)
				setProperty('salty.offset.y',-29)
                
			
			elseif getProperty('salty.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('salty.offset.x',-24)
				setProperty('salty.offset.y',12)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'salty' and noteData == 0 then

	objectPlayAnimation('salty', 'singLEFT',true);

end

if noteType == 'salty' and noteData == 1 then

	objectPlayAnimation('salty', 'singDOWN',true);

end

if noteType == 'salty' and noteData == 2 then

	objectPlayAnimation('salty', 'singUP',true);

end

if noteType == 'salty' and noteData == 3 then

	objectPlayAnimation('salty', 'singRIGHT',true);

end

if noteType == 'hank_salty' and noteData == 0 then

	objectPlayAnimation('bf', 'singLEFT',true);

end

if noteType == 'hank_salty' and noteData == 1 then

	objectPlayAnimation('bf', 'singDOWN',true);

end

if noteType == 'hank_salty' and noteData == 2 then

	objectPlayAnimation('bf', 'singUP',true);

end

if noteType == 'hank_salty' and noteData == 3 then

	objectPlayAnimation('bf', 'singRIGHT',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('salty', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('salty', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('salty', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('salty', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('salty', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('salty', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('salty', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('salty', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'salty' and noteData == 0 then

		objectPlayAnimation('salty', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'salty' and noteData == 1 then
	
		objectPlayAnimation('salty', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'salty' and noteData == 2 then
	
		objectPlayAnimation('salty', 'singUPmiss',true);
	
	end
	
	if noteType == 'salty' and noteData == 3 then
	
		objectPlayAnimation('salty', 'singRIGHTmiss',true);
	
	end

	if noteType == 'hank_salty' and noteData == 0 then

		objectPlayAnimation('bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'hank_salty' and noteData == 1 then
	
		objectPlayAnimation('bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'hank_salty' and noteData == 2 then
	
		objectPlayAnimation('bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'hank_salty' and noteData == 3 then
	
		objectPlayAnimation('bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('salty', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('salty', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('salty', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('salty', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('salty', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('salty', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('salty', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('salty', 'singRIGHTmiss',true);
	
	end

end


