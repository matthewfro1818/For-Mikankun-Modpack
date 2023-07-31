-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bfbside_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bfbside', 'characters/b_bf', 0, 0)

		addAnimationByPrefix('bfbside', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('bfbside', 'singLEFT', 'BF NOTE LEFT0', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singDOWN', 'BF NOTE DOWN0', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singUP', 'BF NOTE UP0', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singRIGHT', 'BF NOTE RIGHT0', 24, false) 

		addAnimationByPrefix('bfbside', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singUPmiss', 'BF NOTE UP MISS', 24, false) 
		
		addAnimationByPrefix('bfbside', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bfbside', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bfbside', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bfbside.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bfbside','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bfbside.animation.curAnim.name') ~= 'idle' and not getProperty('bfbside.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bfbside.animation.curAnim.name') == 'idle' then
                setProperty('bfbside.offset.x',-5)
				setProperty('bfbside.offset.y',0)
                
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singLEFT' then
                setProperty('bfbside.offset.x',5)
				setProperty('bfbside.offset.y',-6)
              
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singUP' then
                setProperty('bfbside.offset.x',-29)
				setProperty('bfbside.offset.y',27)
               
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singDOWN' then
                setProperty('bfbside.offset.x',-10)
				setProperty('bfbside.offset.y',-50)
                
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bfbside.offset.x',-48)
				setProperty('bfbside.offset.y',-7)

			elseif getProperty('bfbside.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('bfbside.offset.x',7)
				setProperty('bfbside.offset.y',19)
              
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singUPmiss' then
                setProperty('bfbside.offset.x',-36)
				setProperty('bfbside.offset.y',27)
               
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('bfbside.offset.x',-15)
				setProperty('bfbside.offset.y',-19)
                
			
			elseif getProperty('bfbside.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('bfbside.offset.x',-44)
				setProperty('bfbside.offset.y',22)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bfbside_Sing' and noteData == 0 then

	objectPlayAnimation('bfbside', 'singLEFT',true);

end

if noteType == 'bfbside_Sing' and noteData == 1 then

	objectPlayAnimation('bfbside', 'singDOWN',true);

end

if noteType == 'bfbside_Sing' and noteData == 2 then

	objectPlayAnimation('bfbside', 'singUP',true);

end

if noteType == 'bfbside_Sing' and noteData == 3 then

	objectPlayAnimation('bfbside', 'singRIGHT',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('bfbside', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('bfbside', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('bfbside', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('bfbside', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('bfbside', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('bfbside', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('bfbside', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('bfbside', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bfbside_Sing' and noteData == 0 then

		objectPlayAnimation('bfbside', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfbside_Sing' and noteData == 1 then
	
		objectPlayAnimation('bfbside', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfbside_Sing' and noteData == 2 then
	
		objectPlayAnimation('bfbside', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfbside_Sing' and noteData == 3 then
	
		objectPlayAnimation('bfbside', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('bfbside', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('bfbside', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('bfbside', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('bfbside', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('bfbside', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('bfbside', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('bfbside', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('bfbside', 'singRIGHTmiss',true);
	
	end

end


