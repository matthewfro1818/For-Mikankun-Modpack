-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bees_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bee', 'characters/Cynthia', 0, 0)

		addAnimationByPrefix('bee', 'idle', 'Cynthia Idle', 24, false) 
		
        addAnimationByPrefix('bee', 'singLEFT', 'Cynthia Left', 24, false) 
		
		addAnimationByPrefix('bee', 'singDOWN', 'Cynthia Down', 24, false) 
		
		addAnimationByPrefix('bee', 'singUP', 'Cynthia Up', 24, false) 
		
		addAnimationByPrefix('bee', 'singRIGHT', 'Cynthia Right', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bee', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bee', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bee.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bee','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bee.animation.curAnim.name') ~= 'idle' and not getProperty('bee.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bee.animation.curAnim.name') == 'idle' then
                setProperty('bee.offset.x',2)
				setProperty('bee.offset.y',0)
                
			
			elseif getProperty('bee.animation.curAnim.name') == 'singLEFT' then
                setProperty('bee.offset.x',120)
				setProperty('bee.offset.y',-46)
              
			
			elseif getProperty('bee.animation.curAnim.name') == 'singUP' then
                setProperty('bee.offset.x',40)
				setProperty('bee.offset.y',10)
               
			
			elseif getProperty('bee.animation.curAnim.name') == 'singDOWN' then
                setProperty('bee.offset.x',-30)
				setProperty('bee.offset.y',-148)
                
			
			elseif getProperty('bee.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bee.offset.x',-252)
				setProperty('bee.offset.y',-100)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bee_Sing' and noteData == 0 then

	objectPlayAnimation('bee', 'singLEFT',true);

end

if noteType == 'bee_Sing' and noteData == 1 then

	objectPlayAnimation('bee', 'singDOWN',true);

end

if noteType == 'bee_Sing' and noteData == 2 then

	objectPlayAnimation('bee', 'singUP',true);

end

if noteType == 'bee_Sing' and noteData == 3 then

	objectPlayAnimation('bee', 'singRIGHT',true);
end

if noteType == 'bees_Sing' and noteData == 0 then

	objectPlayAnimation('bee', 'singLEFT',true);

end

if noteType == 'bees_Sing' and noteData == 1 then

	objectPlayAnimation('bee', 'singDOWN',true);

end

if noteType == 'bees_Sing' and noteData == 2 then

	objectPlayAnimation('bee', 'singUP',true);

end

if noteType == 'bees_Sing' and noteData == 3 then

	objectPlayAnimation('bee', 'singRIGHT',true);
end

end

function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


