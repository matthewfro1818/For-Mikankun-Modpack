-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bf_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bf', 'characters/bfCar', 0, 0)

		addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('bf', 'singLEFT', 'BF NOTE LEFT0', 13, false) 
		
		addAnimationByPrefix('bf', 'singDOWN', 'BF NOTE DOWN0', 29, false) 
		
		addAnimationByPrefix('bf', 'singUP', 'BF NOTE UP0', 14, false) 
		
		addAnimationByPrefix('bf', 'singRIGHT', 'BF NOTE RIGHT0', 45, false) 

		addAnimationByPrefix('bf', 'singLEFTmiss', 'BF NOTE LEFT MISS', 33, false) 
		
		addAnimationByPrefix('bf', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('bf', 'singUPmiss', 'BF NOTE UP MISS', 23, false) 
		
		addAnimationByPrefix('bf', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)

		addAnimationByPrefix('bf', 'hey', 'BF HEY!!', 24, false) 

		addAnimationByPrefix('bf', 'hurt', 'BF hit', 24, false) 

		addAnimationByPrefix('bf', 'scared', 'BF idle shaking', 24, false) 

		addAnimationByPrefix('bf', 'dodge', 'boyfriend dodge', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bf', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bf', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bf.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bf','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bf.animation.curAnim.name') ~= 'idle' and not getProperty('bf.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bf.animation.curAnim.name') == 'idle' then
                setProperty('bf.offset.x',-5)
				setProperty('bf.offset.y',0)
                
			
			elseif getProperty('bf.animation.curAnim.name') == 'singLEFT' then
                setProperty('bf.offset.x',5)
				setProperty('bf.offset.y',-6)
              
			
			elseif getProperty('bf.animation.curAnim.name') == 'singUP' then
                setProperty('bf.offset.x',-29)
				setProperty('bf.offset.y',27)
               
			
			elseif getProperty('bf.animation.curAnim.name') == 'singDOWN' then
                setProperty('bf.offset.x',-10)
				setProperty('bf.offset.y',-50)
                
			
			elseif getProperty('bf.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bf.offset.x',-48)
				setProperty('bf.offset.y',-7)

			elseif getProperty('bf.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('bf.offset.x',7)
				setProperty('bf.offset.y',19)
              
			
			elseif getProperty('bf.animation.curAnim.name') == 'singUPmiss' then
                setProperty('bf.offset.x',-36)
				setProperty('bf.offset.y',27)
               
			
			elseif getProperty('bf.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('bf.offset.x',-15)
				setProperty('bf.offset.y',-19)
                
			
			elseif getProperty('bf.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('bf.offset.x',-44)
				setProperty('bf.offset.y',22)
				
				
			elseif getProperty('bf.animation.curAnim.name') == 'hey' then
                setProperty('bf.offset.x',-3)
				setProperty('bf.offset.y',5)
              
			
			elseif getProperty('bf.animation.curAnim.name') == 'scared' then
                setProperty('bf.offset.x',-4)
				setProperty('bf.offset.y',0)
              
			elseif getProperty('bf.animation.curAnim.name') == 'hrut' then
                setProperty('bf.offset.x',15)
				setProperty('bf.offset.y',18)
              
			elseif getProperty('bf.animation.curAnim.name') == 'dodge' then
                setProperty('bf.offset.x',-10)
				setProperty('bf.offset.y',-16)
              
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bf' and noteData == 0 then

	objectPlayAnimation('bf', 'singLEFT',true);

end

if noteType == 'bf' and noteData == 1 then

	objectPlayAnimation('bf', 'singDOWN',true);

end

if noteType == 'bf' and noteData == 2 then

	objectPlayAnimation('bf', 'singUP',true);

end

if noteType == 'bf' and noteData == 3 then

	objectPlayAnimation('bf', 'singRIGHT',true);

end

if noteType == 'hank_bf' and noteData == 0 then

	objectPlayAnimation('bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 1 then

	objectPlayAnimation('bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 2 then

	objectPlayAnimation('bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 3 then

	objectPlayAnimation('bf', 'dodge',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('bf', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('bf', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('bf', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('bf', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('bf', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('bf', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('bf', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('bf', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bf' and noteData == 0 then

		objectPlayAnimation('bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 1 then
	
		objectPlayAnimation('bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 2 then
	
		objectPlayAnimation('bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'bf' and noteData == 3 then
	
		objectPlayAnimation('bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'hank_bf' and noteData == 0 then

		objectPlayAnimation('bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 1 then
	
		objectPlayAnimation('bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 2 then
	
		objectPlayAnimation('bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 3 then
	
		objectPlayAnimation('bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('bf', 'singRIGHTmiss',true);
	
	end

end


