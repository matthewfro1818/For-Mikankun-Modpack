-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bfmonky_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bfmonky', 'characters/bf-monky', 0, 0)

		addAnimationByPrefix('bfmonky', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('bfmonky', 'singLEFT', 'BF NOTE LEFT0', 13, false) 
		
		addAnimationByPrefix('bfmonky', 'singDOWN', 'BF NOTE DOWN0', 29, false) 
		
		addAnimationByPrefix('bfmonky', 'singUP', 'BF NOTE UP0', 14, false) 
		
		addAnimationByPrefix('bfmonky', 'singRIGHT', 'BF NOTE RIGHT0', 45, false) 

		addAnimationByPrefix('bfmonky', 'singLEFTmiss', 'BF NOTE LEFT MISS', 33, false) 
		
		addAnimationByPrefix('bfmonky', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('bfmonky', 'singUPmiss', 'BF NOTE UP MISS', 23, false) 
		
		addAnimationByPrefix('bfmonky', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)

		addAnimationByPrefix('bfmonky', 'hey', 'BF HEY!!', 24, false) 

		addAnimationByPrefix('bfmonky', 'hurt', 'BF hit', 24, false) 

		addAnimationByPrefix('bfmonky', 'scared', 'BF idle shaking', 24, false) 

		addAnimationByPrefix('bfmonky', 'dodge', 'boyfriend dodge', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bfmonky', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bfmonky', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bfmonky.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bfmonky','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bfmonky.animation.curAnim.name') ~= 'idle' and not getProperty('bfmonky.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bfmonky.animation.curAnim.name') == 'idle' then
                setProperty('bfmonky.offset.x',-5)
				setProperty('bfmonky.offset.y',0)
                
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singLEFT' then
                setProperty('bfmonky.offset.x',5)
				setProperty('bfmonky.offset.y',-6)
              
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singUP' then
                setProperty('bfmonky.offset.x',-29)
				setProperty('bfmonky.offset.y',27)
               
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singDOWN' then
                setProperty('bfmonky.offset.x',-10)
				setProperty('bfmonky.offset.y',-50)
                
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bfmonky.offset.x',-48)
				setProperty('bfmonky.offset.y',-7)

			elseif getProperty('bfmonky.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('bfmonky.offset.x',7)
				setProperty('bfmonky.offset.y',31)
              
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singUPmiss' then
                setProperty('bfmonky.offset.x',-36)
				setProperty('bfmonky.offset.y',33)
               
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('bfmonky.offset.x',-15)
				setProperty('bfmonky.offset.y',166)
                
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('bfmonky.offset.x',-44)
				setProperty('bfmonky.offset.y',32)
				
				
			elseif getProperty('bfmonky.animation.curAnim.name') == 'hey' then
                setProperty('bfmonky.offset.x',-3)
				setProperty('bfmonky.offset.y',5)
              
			
			elseif getProperty('bfmonky.animation.curAnim.name') == 'scared' then
                setProperty('bfmonky.offset.x',-4)
				setProperty('bfmonky.offset.y',0)
              
			elseif getProperty('bfmonky.animation.curAnim.name') == 'hrut' then
                setProperty('bfmonky.offset.x',15)
				setProperty('bfmonky.offset.y',18)
              
			elseif getProperty('bfmonky.animation.curAnim.name') == 'dodge' then
                setProperty('bfmonky.offset.x',-10)
				setProperty('bfmonky.offset.y',-16)
              
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bfmonky' and noteData == 0 then

	objectPlayAnimation('bfmonky', 'singLEFT',true);

end

if noteType == 'bfmonky' and noteData == 1 then

	objectPlayAnimation('bfmonky', 'singDOWN',true);

end

if noteType == 'bfmonky' and noteData == 2 then

	objectPlayAnimation('bfmonky', 'singUP',true);

end

if noteType == 'bfmonky' and noteData == 3 then

	objectPlayAnimation('bfmonky', 'singRIGHT',true);

end

if noteType == 'hank_bfmonky' and noteData == 0 then

	objectPlayAnimation('bfmonky', 'dodge',true);

end

if noteType == 'hank_bfmonky' and noteData == 1 then

	objectPlayAnimation('bfmonky', 'dodge',true);

end

if noteType == 'hank_bfmonky' and noteData == 2 then

	objectPlayAnimation('bfmonky', 'dodge',true);

end

if noteType == 'hank_bfmonky' and noteData == 3 then

	objectPlayAnimation('bfmonky', 'dodge',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('bfmonky', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('bfmonky', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('bfmonky', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('bfmonky', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('bfmonky', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('bfmonky', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('bfmonky', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('bfmonky', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bfmonky' and noteData == 0 then

		objectPlayAnimation('bfmonky', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfmonky' and noteData == 1 then
	
		objectPlayAnimation('bfmonky', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfmonky' and noteData == 2 then
	
		objectPlayAnimation('bfmonky', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfmonky' and noteData == 3 then
	
		objectPlayAnimation('bfmonky', 'singRIGHTmiss',true);
	
	end

	if noteType == 'hank_bfmonky' and noteData == 0 then

		objectPlayAnimation('bfmonky', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'hank_bfmonky' and noteData == 1 then
	
		objectPlayAnimation('bfmonky', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'hank_bfmonky' and noteData == 2 then
	
		objectPlayAnimation('bfmonky', 'singUPmiss',true);
	
	end
	
	if noteType == 'hank_bfmonky' and noteData == 3 then
	
		objectPlayAnimation('bfmonky', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('bfmonky', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('bfmonky', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('bfmonky', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('bfmonky', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('bfmonky', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('bfmonky', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('bfmonky', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('bfmonky', 'singRIGHTmiss',true);
	
	end

end


