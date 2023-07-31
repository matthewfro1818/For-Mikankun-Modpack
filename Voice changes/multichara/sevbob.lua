-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bob') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bob', 'characters/bob', 0, 0)

		addAnimationByPrefix('bob', 'idle', 'bob_idle', 24, false) 
		
        addAnimationByPrefix('bob', 'singLEFT', 'bob_LEFT0', 24, false) 
		
		addAnimationByPrefix('bob', 'singDOWN', 'bob_DOWN', 24, false) 
		
		addAnimationByPrefix('bob', 'singUP', 'bob_UP0', 24, false) 
		
		addAnimationByPrefix('bob', 'singRIGHT', 'bob_RIGHT0', 24, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bob', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bob', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bob.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bob','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bob.animation.curAnim.name') ~= 'idle' and not getProperty('bob.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bob.animation.curAnim.name') == 'idle' then
                setProperty('bob.offset.x',-5)
				setProperty('bob.offset.y',1)
                
			
			elseif getProperty('bob.animation.curAnim.name') == 'singLEFT' then
                setProperty('bob.offset.x',-6)
				setProperty('bob.offset.y',2)
              
			
			elseif getProperty('bob.animation.curAnim.name') == 'singUP' then
                setProperty('bob.offset.x',-7)
				setProperty('bob.offset.y',1)
               
			
			elseif getProperty('bob.animation.curAnim.name') == 'singDOWN' then
                setProperty('bob.offset.x',-9)
				setProperty('bob.offset.y',0)
                
			
			elseif getProperty('bob.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bob.offset.x',-4)
				setProperty('bob.offset.y',0)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bob' and noteData == 0 then

objectPlayAnimation('bob', 'singLEFT',true);

end

if noteType == 'bob' and noteData == 1 then

	objectPlayAnimation('bob', 'singDOWN',true);

end

if noteType == 'bob' and noteData == 2 then

	objectPlayAnimation('bob', 'singUP',true);

end

if noteType == 'bob' and noteData == 3 then

	objectPlayAnimation('bob', 'singRIGHT',true);

end

if noteType == 'bob' and noteData == 4 then

	objectPlayAnimation('bob', 'singUP',true);

end

if noteType == 'bob' and noteData == 5 then

	objectPlayAnimation('bob', 'singUP',true);

end

if noteType == 'bob' and noteData == 6 then

objectPlayAnimation('bob', 'singLEFT',true);

end

if noteType == 'bob' and noteData == 7 then

	objectPlayAnimation('bob', 'singDOWN',true);

end

if noteType == 'bob' and noteData == 8 then

	objectPlayAnimation('bob', 'singUP',true);

end

if noteType == 'bob' and noteData == 9 then

	objectPlayAnimation('bob', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


