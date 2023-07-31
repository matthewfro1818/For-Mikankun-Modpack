-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/annie') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('annie', 'characters/annie', 0, 0)

		addAnimationByPrefix('annie', 'idle', 'Pico Idle Dance', 24, false) 
		
        addAnimationByPrefix('annie', 'singLEFT', 'Pico NOTE LEFT0', 24, false) 
		
		addAnimationByPrefix('annie', 'singDOWN', 'Pico Down Note', 24, false) 
		
		addAnimationByPrefix('annie', 'singUP', 'pico Up note0', 24, false) 
		
		addAnimationByPrefix('annie', 'singRIGHT', 'Pico Note Right0', 24, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('annie', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('annie', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('annie.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('annie','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('annie.animation.curAnim.name') ~= 'idle' and not getProperty('annie.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('annie.animation.curAnim.name') == 'idle' then
                setProperty('annie.offset.x',3)
				setProperty('annie.offset.y',0)
                
			
			elseif getProperty('annie.animation.curAnim.name') == 'singLEFT' then
                setProperty('annie.offset.x',55)
				setProperty('annie.offset.y',0)
              
			
			elseif getProperty('annie.animation.curAnim.name') == 'singUP' then
                setProperty('annie.offset.x',21)
				setProperty('annie.offset.y',27)
               
			
			elseif getProperty('annie.animation.curAnim.name') == 'singDOWN' then
                setProperty('annie.offset.x',-206)
				setProperty('annie.offset.y',-70)
                
			
			elseif getProperty('annie.animation.curAnim.name') == 'singRIGHT' then
                setProperty('annie.offset.x',-82)
				setProperty('annie.offset.y',9)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'annie' and noteData == 0 then

objectPlayAnimation('annie', 'singLEFT',true);

end

if noteType == 'annie' and noteData == 1 then

	objectPlayAnimation('annie', 'singDOWN',true);

end

if noteType == 'annie' and noteData == 2 then

	objectPlayAnimation('annie', 'singUP',true);

end

if noteType == 'annie' and noteData == 3 then

	objectPlayAnimation('annie', 'singRIGHT',true);

end

if noteType == 'annie' and noteData == 4 then

	objectPlayAnimation('annie', 'singUP',true);

end

if noteType == 'annie' and noteData == 5 then

	objectPlayAnimation('annie', 'singUP',true);

end

if noteType == 'annie' and noteData == 6 then

objectPlayAnimation('annie', 'singLEFT',true);

end

if noteType == 'annie' and noteData == 7 then

	objectPlayAnimation('annie', 'singDOWN',true);

end

if noteType == 'annie' and noteData == 8 then

	objectPlayAnimation('annie', 'singUP',true);

end

if noteType == 'annie' and noteData == 9 then

	objectPlayAnimation('annie', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


