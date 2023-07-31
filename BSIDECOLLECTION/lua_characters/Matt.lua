-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/Matt_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('Matt', 'characters/noncanon_matt_bside', 0, 0)

		addAnimationByPrefix('Matt', 'idle', 'matt idle', 24, true) 
		
        addAnimationByPrefix('Matt', 'singLEFT', 'matt left note0', 24, false) 
		
		addAnimationByPrefix('Matt', 'singDOWN', 'matt down note0', 24, false) 
		
		addAnimationByPrefix('Matt', 'singUP', 'matt up note0', 24, false) 
		
		addAnimationByPrefix('Matt', 'singRIGHT', 'matt right note0', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('Matt', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('Matt', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('Matt.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('Matt','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('Matt.animation.curAnim.name') ~= 'idle' and not getProperty('Matt.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('Matt.animation.curAnim.name') == 'idle' then
                setProperty('Matt.offset.x',-12)
				setProperty('Matt.offset.y',-247)
                
			
			elseif getProperty('Matt.animation.curAnim.name') == 'singLEFT' then
                setProperty('Matt.offset.x',-7)
				setProperty('Matt.offset.y',-286)
              
			
			elseif getProperty('Matt.animation.curAnim.name') == 'singUP' then
                setProperty('Matt.offset.x',-60)
				setProperty('Matt.offset.y',-226)
               
			
			elseif getProperty('Matt.animation.curAnim.name') == 'singDOWN' then
                setProperty('Matt.offset.x',-96)
				setProperty('Matt.offset.y',-274)
                
			
			elseif getProperty('Matt.animation.curAnim.name') == 'singRIGHT' then
                setProperty('Matt.offset.x',-48)
				setProperty('Matt.offset.y',-268)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'Matt_Sing' and noteData == 0 then

	objectPlayAnimation('Matt', 'singLEFT',true);

end

if noteType == 'Matt_Sing' and noteData == 1 then

	objectPlayAnimation('Matt', 'singDOWN',true);

end

if noteType == 'Matt_Sing' and noteData == 2 then

	objectPlayAnimation('Matt', 'singUP',true);

end

if noteType == 'Matt_Sing' and noteData == 3 then

	objectPlayAnimation('Matt', 'singRIGHT',true);

end

if noteType == 'Matt_Sing' and noteData == 4 then

	objectPlayAnimation('Matt', 'singUP',true);

end

if noteType == 'Matt_Sing' and noteData == 5 then

	objectPlayAnimation('Matt', 'singDOWN',true);

end

if noteType == 'Matt_Sing' and noteData == 6 then

	objectPlayAnimation('Matt', 'singLEFT',true);

end

if noteType == 'Matt_Sing' and noteData == 7 then

	objectPlayAnimation('Matt', 'singDOWN',true);

end

if noteType == 'Matt_Sing' and noteData == 8 then

	objectPlayAnimation('Matt', 'singLEFT',true);

end

if noteType == 'Matt_Sing' and noteData == 9 then

	objectPlayAnimation('Matt', 'singDOWN',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


