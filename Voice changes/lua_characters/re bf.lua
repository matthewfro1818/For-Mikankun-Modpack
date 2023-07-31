-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/re bf_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('re bf', 'characters/re bf', 0, 0)

		addAnimationByPrefix('re bf', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('re bf', 'singLEFT', 'BF NOTE LEFT0', 13, false) 
		
		addAnimationByPrefix('re bf', 'singDOWN', 'BF NOTE DOWN0', 29, false) 
		
		addAnimationByPrefix('re bf', 'singUP', 'BF NOTE UP0', 14, false) 
		
		addAnimationByPrefix('re bf', 'singRIGHT', 'BF NOTE RIGHT0', 45, false) 

		addAnimationByPrefix('re bf', 'singLEFTmiss', 'BF NOTE LEFT MISS', 33, false) 
		
		addAnimationByPrefix('re bf', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('re bf', 'singUPmiss', 'BF NOTE UP MISS', 23, false) 
		
		addAnimationByPrefix('re bf', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)

		addAnimationByPrefix('re bf', 'hey', 'BF HEY!!', 24, false) 

		addAnimationByPrefix('re bf', 'hurt', 'BF hit', 24, false) 

		addAnimationByPrefix('re bf', 'scared', 'BF idle shaking', 24, false) 

		addAnimationByPrefix('re bf', 'dodge', 'boyfriend dodge', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('re bf', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('re bf', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('re bf.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('re bf','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('re bf.animation.curAnim.name') ~= 'idle' and not getProperty('re bf.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('re bf.animation.curAnim.name') == 'idle' then
                setProperty('re bf.offset.x',-5)
				setProperty('re bf.offset.y',0)
                
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singLEFT' then
                setProperty('re bf.offset.x',10)
				setProperty('re bf.offset.y',7)
              
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singUP' then
                setProperty('re bf.offset.x',-7)
				setProperty('re bf.offset.y',29)
               
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singDOWN' then
                setProperty('re bf.offset.x',-2)
				setProperty('re bf.offset.y',-1)
                
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singRIGHT' then
                setProperty('re bf.offset.x',-6)
				setProperty('re bf.offset.y',-5)

			elseif getProperty('re bf.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('re bf.offset.x',7)
				setProperty('re bf.offset.y',16)
              
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singUPmiss' then
                setProperty('re bf.offset.x',-55)
				setProperty('re bf.offset.y',30)
               
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('re bf.offset.x',-26)
				setProperty('re bf.offset.y',-18)
                
			
			elseif getProperty('re bf.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('re bf.offset.x',-6)
				setProperty('re bf.offset.y',16)
				
				
			elseif getProperty('re bf.animation.curAnim.name') == 'hey' then
                setProperty('re bf.offset.x',-5)
				setProperty('re bf.offset.y',1)
              
			
			elseif getProperty('re bf.animation.curAnim.name') == 'scared' then
                setProperty('re bf.offset.x',-4)
				setProperty('re bf.offset.y',0)
              
			elseif getProperty('re bf.animation.curAnim.name') == 'hrut' then
                setProperty('re bf.offset.x',15)
				setProperty('re bf.offset.y',18)
              
			elseif getProperty('re bf.animation.curAnim.name') == 'dodge' then
                setProperty('re bf.offset.x',-10)
				setProperty('re bf.offset.y',-16)
              
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 're bf' and noteData == 0 then

	objectPlayAnimation('re bf', 'singLEFT',true);

end

if noteType == 're bf' and noteData == 1 then

	objectPlayAnimation('re bf', 'singDOWN',true);

end

if noteType == 're bf' and noteData == 2 then

	objectPlayAnimation('re bf', 'singUP',true);

end

if noteType == 're bf' and noteData == 3 then

	objectPlayAnimation('re bf', 'singRIGHT',true);

end

if noteType == 'hank_bf' and noteData == 0 then

	objectPlayAnimation('re bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 1 then

	objectPlayAnimation('re bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 2 then

	objectPlayAnimation('re bf', 'dodge',true);

end

if noteType == 'hank_bf' and noteData == 3 then

	objectPlayAnimation('re bf', 'dodge',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('re bf', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('re bf', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('re bf', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('re bf', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('re bf', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('re bf', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('re bf', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('re bf', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 're bf' and noteData == 0 then

		objectPlayAnimation('re bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 're bf' and noteData == 1 then
	
		objectPlayAnimation('re bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 're bf' and noteData == 2 then
	
		objectPlayAnimation('re bf', 'singUPmiss',true);
	
	end
	
	if noteType == 're bf' and noteData == 3 then
	
		objectPlayAnimation('re bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'hank_bf' and noteData == 0 then

		objectPlayAnimation('re bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 1 then
	
		objectPlayAnimation('re bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 2 then
	
		objectPlayAnimation('re bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'hank_bf' and noteData == 3 then
	
		objectPlayAnimation('re bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'allbf_Sing' and noteData == 0 then

		objectPlayAnimation('re bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 1 then
	
		objectPlayAnimation('re bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 2 then
	
		objectPlayAnimation('re bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'allbf_Sing' and noteData == 3 then
	
		objectPlayAnimation('re bf', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bothbf1' and noteData == 0 then

		objectPlayAnimation('re bf', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 1 then
	
		objectPlayAnimation('re bf', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 2 then
	
		objectPlayAnimation('re bf', 'singUPmiss',true);
	
	end
	
	if noteType == 'bothbf1' and noteData == 3 then
	
		objectPlayAnimation('re bf', 'singRIGHTmiss',true);
	
	end

end


