-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/amor_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('amor', 'characters/amor-assets', 0, 0)

		addAnimationByPrefix('amor', 'idle', 'Amor idle dance', 24, false) 
		
        addAnimationByPrefix('amor', 'singLEFT', 'Amor Sing Note LEFT', 24, false) 
		
		addAnimationByPrefix('amor', 'singDOWN', 'Amor Sing Note DOWN', 24, false) 
		
		addAnimationByPrefix('amor', 'singUP', 'Amor Sing Note UP', 24, false) 
		
		addAnimationByPrefix('amor', 'singRIGHT', 'Amor Sing Note RIGHT', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('amor', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('amor', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('amor.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('amor','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('amor.animation.curAnim.name') ~= 'idle' and not getProperty('amor.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('amor.animation.curAnim.name') == 'idle' then
                setProperty('amor.offset.x',0)
				setProperty('amor.offset.y',0)
                
			
			elseif getProperty('amor.animation.curAnim.name') == 'singLEFT' then
                setProperty('amor.offset.x',27)
				setProperty('amor.offset.y',1)
              
			
			elseif getProperty('amor.animation.curAnim.name') == 'singUP' then
                setProperty('amor.offset.x',-9)
				setProperty('amor.offset.y',42)
               
			
			elseif getProperty('amor.animation.curAnim.name') == 'singDOWN' then
                setProperty('amor.offset.x',-30)
				setProperty('amor.offset.y',-15)
                
			
			elseif getProperty('amor.animation.curAnim.name') == 'singRIGHT' then
                setProperty('amor.offset.x',-18)
				setProperty('amor.offset.y',13)
				
				
		
            end

			
end

function opponentNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'amor_Sing' and noteData == 0 then

	objectPlayAnimation('amor', 'singLEFT',true);

end

if noteType == 'amor_Sing' and noteData == 1 then

	objectPlayAnimation('amor', 'singDOWN',true);

end

if noteType == 'amor_Sing' and noteData == 2 then

	objectPlayAnimation('amor', 'singUP',true);

end

if noteType == 'amor_Sing' and noteData == 3 then

	objectPlayAnimation('amor', 'singRIGHT',true);
end

if noteType == 'bees_Sing' and noteData == 0 then

	objectPlayAnimation('amor', 'singLEFT',true);

end

if noteType == 'bees_Sing' and noteData == 1 then

	objectPlayAnimation('amor', 'singDOWN',true);

end

if noteType == 'bees_Sing' and noteData == 2 then

	objectPlayAnimation('amor', 'singUP',true);

end

if noteType == 'bees_Sing' and noteData == 3 then

	objectPlayAnimation('amor', 'singRIGHT',true);
end

end

function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


