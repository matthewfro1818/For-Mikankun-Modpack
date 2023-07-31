-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bfplayer_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bfplayer', 'characters/bfplayer', 0, 0)

		addAnimationByPrefix('bfplayer', 'idle', 'BF idle dance', 24, false) 
		
        addAnimationByPrefix('bfplayer', 'singLEFT', 'BF NOTE LEFT0', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singDOWN', 'BF NOTE DOWN0', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singUP', 'BF NOTE UP0', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singRIGHT', 'BF NOTE RIGHT0', 24, false) 

		addAnimationByPrefix('bfplayer', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singUPmiss', 'BF NOTE UP MISS', 24, false) 
		
		addAnimationByPrefix('bfplayer', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bfplayer', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bfplayer', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bfplayer.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bfplayer','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bfplayer.animation.curAnim.name') ~= 'idle' and not getProperty('bfplayer.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bfplayer.animation.curAnim.name') == 'idle' then
                setProperty('bfplayer.offset.x',-5)
				setProperty('bfplayer.offset.y',0)
                
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singLEFT' then
                setProperty('bfplayer.offset.x',5)
				setProperty('bfplayer.offset.y',-6)
              
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singUP' then
                setProperty('bfplayer.offset.x',-29)
				setProperty('bfplayer.offset.y',27)
               
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singDOWN' then
                setProperty('bfplayer.offset.x',-10)
				setProperty('bfplayer.offset.y',-50)
                
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bfplayer.offset.x',-48)
				setProperty('bfplayer.offset.y',-7)

			elseif getProperty('bfplayer.animation.curAnim.name') == 'singLEFTmiss' then
                setProperty('bfplayer.offset.x',7)
				setProperty('bfplayer.offset.y',19)
              
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singUPmiss' then
                setProperty('bfplayer.offset.x',-36)
				setProperty('bfplayer.offset.y',27)
               
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singDOWNmiss' then
                setProperty('bfplayer.offset.x',-15)
				setProperty('bfplayer.offset.y',-19)
                
			
			elseif getProperty('bfplayer.animation.curAnim.name') == 'singRIGHTmiss' then
                setProperty('bfplayer.offset.x',-44)
				setProperty('bfplayer.offset.y',22)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bfplayer_Sing' and noteData == 0 then

	objectPlayAnimation('bfplayer', 'singLEFT',true);

end

if noteType == 'bfplayer_Sing' and noteData == 1 then

	objectPlayAnimation('bfplayer', 'singDOWN',true);

end

if noteType == 'bfplayer_Sing' and noteData == 2 then

	objectPlayAnimation('bfplayer', 'singUP',true);

end

if noteType == 'bfplayer_Sing' and noteData == 3 then

	objectPlayAnimation('bfplayer', 'singRIGHT',true);

end

if noteType == 'bfplayer_Sing' and noteData == 4 then

	objectPlayAnimation('bfplayer', 'singUP',true);

end

if noteType == 'bfplayer_Sing' and noteData == 5 then

	objectPlayAnimation('bfplayer', 'singDOWN',true);

end

if noteType == 'bfplayer_Sing' and noteData == 6 then

	objectPlayAnimation('bfplayer', 'singLEFT',true);

end

if noteType == 'bfplayer_Sing' and noteData == 7 then

	objectPlayAnimation('bfplayer', 'singDOWN',true);

end

if noteType == 'bfplayer_Sing' and noteData == 8 then

	objectPlayAnimation('bfplayer', 'singUP',true);

end

if noteType == 'bfplayer_Sing' and noteData == 9 then

	objectPlayAnimation('bfplayer', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
	if noteType == 'bfplayer_Sing' and noteData == 0 then

		objectPlayAnimation('bfplayer', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 1 then
	
		objectPlayAnimation('bfplayer', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 2 then
	
		objectPlayAnimation('bfplayer', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 3 then
	
		objectPlayAnimation('bfplayer', 'singRIGHTmiss',true);
	
	end

	if noteType == 'bfplayer_Sing' and noteData == 4 then

		objectPlayAnimation('bfplayer', 'singDOWNmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 5 then
	
		objectPlayAnimation('bfplayer', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 6 then
	
		objectPlayAnimation('bfplayer', 'singLEFTmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 7 then
	
		objectPlayAnimation('bfplayer', 'singDOWNmiss',true);
	
	end

	if noteType == 'bfplayer_Sing' and noteData == 8 then
	
		objectPlayAnimation('bfplayer', 'singUPmiss',true);
	
	end
	
	if noteType == 'bfplayer_Sing' and noteData == 9 then
	
		objectPlayAnimation('bfplayer', 'singRIGHTmiss',true);
	
	end

end


