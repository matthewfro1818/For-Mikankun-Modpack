-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/Zardy_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('Zardy', 'characters/bsidegodzardy', 0, 0)

		addAnimationByPrefix('Zardy', 'idle', 'Idle', 24, true) 
		
        addAnimationByPrefix('Zardy', 'singLEFT', 'Sing Left', 24, false) 
		
		addAnimationByPrefix('Zardy', 'singDOWN', 'Sing Down', 24, false) 
		
		addAnimationByPrefix('Zardy', 'singUP', 'Sing Up', 24, false) 
		
		addAnimationByPrefix('Zardy', 'singRIGHT', 'Sing Right', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('Zardy', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('Zardy', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('Zardy.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('Zardy','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('Zardy.animation.curAnim.name') ~= 'idle' and not getProperty('Zardy.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('Zardy.animation.curAnim.name') == 'idle' then
                setProperty('Zardy.offset.x',29)
				setProperty('Zardy.offset.y',14)
                
			
			elseif getProperty('Zardy.animation.curAnim.name') == 'singLEFT' then
                setProperty('Zardy.offset.x',150)
				setProperty('Zardy.offset.y',27)
              
			
			elseif getProperty('Zardy.animation.curAnim.name') == 'singUP' then
                setProperty('Zardy.offset.x',-56)
				setProperty('Zardy.offset.y',31)
               
			
			elseif getProperty('Zardy.animation.curAnim.name') == 'singDOWN' then
                setProperty('Zardy.offset.x',-20)
				setProperty('Zardy.offset.y',10)
                
			
			elseif getProperty('Zardy.animation.curAnim.name') == 'singRIGHT' then
                setProperty('Zardy.offset.x',-50)
				setProperty('Zardy.offset.y',20)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'Zardy_Sing' and noteData == 0 then

	objectPlayAnimation('Zardy', 'singLEFT',true);

end

if noteType == 'Zardy_Sing' and noteData == 1 then

	objectPlayAnimation('Zardy', 'singDOWN',true);

end

if noteType == 'Zardy_Sing' and noteData == 2 then

	objectPlayAnimation('Zardy', 'singUP',true);

end

if noteType == 'Zardy_Sing' and noteData == 3 then

	objectPlayAnimation('Zardy', 'singRIGHT',true);

end

if noteType == 'Zardy_Sing' and noteData == 4 then

	objectPlayAnimation('Zardy', 'singUP',true);

end

if noteType == 'Zardy_Sing' and noteData == 5 then

	objectPlayAnimation('Zardy', 'singDOWN',true);

end

if noteType == 'Zardy_Sing' and noteData == 6 then

	objectPlayAnimation('Zardy', 'singLEFT',true);

end

if noteType == 'Zardy_Sing' and noteData == 7 then

	objectPlayAnimation('Zardy', 'singDOWN',true);

end

if noteType == 'Zardy_Sing' and noteData == 8 then

	objectPlayAnimation('Zardy', 'singUP',true);

end

if noteType == 'Zardy_Sing' and noteData == 9 then

	objectPlayAnimation('Zardy', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


