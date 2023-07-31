-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/Tricky_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('Tricky', 'characters/tricky_but_cheeto_man', 0, 0)

		addAnimationByPrefix('Tricky', 'idle', 'Idle', 24, true) 
		
        addAnimationByPrefix('Tricky', 'singLEFT', 'Sing Left', 24, false) 
		
		addAnimationByPrefix('Tricky', 'singDOWN', 'Sing Down', 24, false) 
		
		addAnimationByPrefix('Tricky', 'singUP', 'Sing Up', 24, false) 
		
		addAnimationByPrefix('Tricky', 'singRIGHT', 'Sing Right', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('Tricky', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('Tricky', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('Tricky.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('Tricky','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('Tricky.animation.curAnim.name') ~= 'idle' and not getProperty('Tricky.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('Tricky.animation.curAnim.name') == 'idle' then
                setProperty('Tricky.offset.x',32)
				setProperty('Tricky.offset.y',260)
                
			
			elseif getProperty('Tricky.animation.curAnim.name') == 'singLEFT' then
                setProperty('Tricky.offset.x',148)
				setProperty('Tricky.offset.y',259)
              
			
			elseif getProperty('Tricky.animation.curAnim.name') == 'singUP' then
                setProperty('Tricky.offset.x',121)
				setProperty('Tricky.offset.y',257)
               
			
			elseif getProperty('Tricky.animation.curAnim.name') == 'singDOWN' then
                setProperty('Tricky.offset.x',40)
				setProperty('Tricky.offset.y',240)
                
			
			elseif getProperty('Tricky.animation.curAnim.name') == 'singRIGHT' then
                setProperty('Tricky.offset.x',62)
				setProperty('Tricky.offset.y',163)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'Tricky_Sing' and noteData == 0 then

	objectPlayAnimation('Tricky', 'singLEFT',true);

end

if noteType == 'Tricky_Sing' and noteData == 1 then

	objectPlayAnimation('Tricky', 'singDOWN',true);

end

if noteType == 'Tricky_Sing' and noteData == 2 then

	objectPlayAnimation('Tricky', 'singUP',true);

end

if noteType == 'Tricky_Sing' and noteData == 3 then

	objectPlayAnimation('Tricky', 'singRIGHT',true);

end

if noteType == 'Tricky_Sing' and noteData == 4 then

	objectPlayAnimation('Tricky', 'singUP',true);

end

if noteType == 'Tricky_Sing' and noteData == 5 then

	objectPlayAnimation('Tricky', 'singDOWN',true);

end

if noteType == 'Tricky_Sing' and noteData == 6 then

	objectPlayAnimation('Tricky', 'singLEFT',true);

end

if noteType == 'Tricky_Sing' and noteData == 7 then

	objectPlayAnimation('Tricky', 'singDOWN',true);

end

if noteType == 'Tricky_Sing' and noteData == 8 then

	objectPlayAnimation('Tricky', 'singLEFT',true);

end

if noteType == 'Tricky_Sing' and noteData == 9 then

	objectPlayAnimation('Tricky', 'singDOWN',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


