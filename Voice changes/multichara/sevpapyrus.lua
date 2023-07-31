-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/papyrus') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('papyrus', 'characters/papyrus', 0, 0)

		addAnimationByPrefix('papyrus', 'idle', 'Papyrus Dance instancia 1', 24, false) 
		
        addAnimationByPrefix('papyrus', 'singLEFT', 'Paps Note RIGHT instancia 1', 24, false) 
		
		addAnimationByPrefix('papyrus', 'singDOWN', 'Paps Note DOWN instancia 1', 24, false) 
		
		addAnimationByPrefix('papyrus', 'singUP', 'Paps Note UP instancia 1', 24, false) 
		
		addAnimationByPrefix('papyrus', 'singRIGHT', 'Paps Note LEFT instancia 1', 24, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('papyrus', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('papyrus', true)
		setProperty ("papyrus.flipX", true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('papyrus.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('papyrus','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('papyrus.animation.curAnim.name') ~= 'idle' and not getProperty('papyrus.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('papyrus.animation.curAnim.name') == 'idle' then
                setProperty('papyrus.offset.x',70)
				setProperty('papyrus.offset.y',9)
                
			
			elseif getProperty('papyrus.animation.curAnim.name') == 'singLEFT' then
                setProperty('papyrus.offset.x',30)
				setProperty('papyrus.offset.y',-20)
              
			
			elseif getProperty('papyrus.animation.curAnim.name') == 'singUP' then
                setProperty('papyrus.offset.x',70)
				setProperty('papyrus.offset.y',60)
               
			
			elseif getProperty('papyrus.animation.curAnim.name') == 'singDOWN' then
                setProperty('papyrus.offset.x',30)
				setProperty('papyrus.offset.y',-59)
                
			
			elseif getProperty('papyrus.animation.curAnim.name') == 'singRIGHT' then
                setProperty('papyrus.offset.x',30)
				setProperty('papyrus.offset.y',-20)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'papyrus' and noteData == 0 then

objectPlayAnimation('papyrus', 'singLEFT',true);

end

if noteType == 'papyrus' and noteData == 1 then

	objectPlayAnimation('papyrus', 'singDOWN',true);

end

if noteType == 'papyrus' and noteData == 2 then

	objectPlayAnimation('papyrus', 'singUP',true);

end

if noteType == 'papyrus' and noteData == 3 then

	objectPlayAnimation('papyrus', 'singRIGHT',true);

end

if noteType == 'papyrus' and noteData == 4 then

	objectPlayAnimation('papyrus', 'singUP',true);

end

if noteType == 'papyrus' and noteData == 5 then

	objectPlayAnimation('papyrus', 'singUP',true);

end

if noteType == 'papyrus' and noteData == 6 then

objectPlayAnimation('papyrus', 'singLEFT',true);

end

if noteType == 'papyrus' and noteData == 7 then

	objectPlayAnimation('papyrus', 'singDOWN',true);

end

if noteType == 'papyrus' and noteData == 8 then

	objectPlayAnimation('papyrus', 'singUP',true);

end

if noteType == 'papyrus' and noteData == 9 then

	objectPlayAnimation('papyrus', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


