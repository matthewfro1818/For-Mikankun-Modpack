-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/bfrs_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('bfrs', 'characters/rsbf', 0, 0)

		addAnimationByPrefix('bfrs', 'idle', 'BF idle dance instance', 24, false) 
		
        addAnimationByPrefix('bfrs', 'singLEFT', 'BF NOTE LEFT instance', 24, false) 
		
		addAnimationByPrefix('bfrs', 'singDOWN', 'BF NOTE DOWN instance', 24, false) 
		
		addAnimationByPrefix('bfrs', 'singUP', 'BF NOTE UP instance', 24, false) 
		
		addAnimationByPrefix('bfrs', 'singRIGHT', 'BF NOTE RIGHT instance', 24, false) 
		
		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('bfrs', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('bfrs', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('bfrs.animation.curAnim.name')  ~= null and curBeat % 2 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('bfrs','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('bfrs.animation.curAnim.name') ~= 'idle' and not getProperty('bfrs.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('bfrs.animation.curAnim.name') == 'idle' then
                setProperty('bfrs.offset.x',-5)
				setProperty('bfrs.offset.y',0)
                
			
			elseif getProperty('bfrs.animation.curAnim.name') == 'singLEFT' then
                setProperty('bfrs.offset.x',12)
				setProperty('bfrs.offset.y',6)
              
			
			elseif getProperty('bfrs.animation.curAnim.name') == 'singUP' then
                setProperty('bfrs.offset.x',-29)
				setProperty('bfrs.offset.y',27)
               
			
			elseif getProperty('bfrs.animation.curAnim.name') == 'singDOWN' then
                setProperty('bfrs.offset.x',-10)
				setProperty('bfrs.offset.y',-50)
                
			
			elseif getProperty('bfrs.animation.curAnim.name') == 'singRIGHT' then
                setProperty('bfrs.offset.x',-38)
				setProperty('bfrs.offset.y',-7)
				
				
		
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'bothbf2' and noteData == 0 then

	objectPlayAnimation('bfrs', 'singLEFT',true);
	
end
	
if noteType == 'bothbf2' and noteData == 1 then
	
	objectPlayAnimation('bfrs', 'singDOWN',true);
	
end
	
if noteType == 'bothbf2' and noteData == 2 then
	
	objectPlayAnimation('bfrs', 'singUP',true);
	
end
	
if noteType == 'bothbf2' and noteData == 3 then
	
	objectPlayAnimation('bfrs', 'singRIGHT',true);
	
end

if noteType == 'bfrs_Sing' and noteData == 0 then

objectPlayAnimation('bfrs', 'singLEFT',true);

end

if noteType == 'bfrs_Sing' and noteData == 1 then

	objectPlayAnimation('bfrs', 'singDOWN',true);

end

if noteType == 'bfrs_Sing' and noteData == 2 then

	objectPlayAnimation('bfrs', 'singUP',true);

end

if noteType == 'bfrs_Sing' and noteData == 3 then

	objectPlayAnimation('bfrs', 'singRIGHT',true);

end

if noteType == 'bfrs_Sing' and noteData == 4 then

	objectPlayAnimation('bfrs', 'singUP',true);

end

if noteType == 'bfrs_Sing' and noteData == 5 then

	objectPlayAnimation('bfrs', 'singUP',true);

end

if noteType == 'bfrs_Sing' and noteData == 6 then

objectPlayAnimation('bfrs', 'singLEFT',true);

end

if noteType == 'bfrs_Sing' and noteData == 7 then

	objectPlayAnimation('bfrs', 'singDOWN',true);

end

if noteType == 'bfrs_Sing' and noteData == 8 then

	objectPlayAnimation('bfrs', 'singUP',true);

end

if noteType == 'bfrs_Sing' and noteData == 9 then

	objectPlayAnimation('bfrs', 'singRIGHT',true);

end


if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('bfrs', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('bfrs', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('bfrs', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('bfrs', 'singRIGHT',true);

end

end




function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side 

end


