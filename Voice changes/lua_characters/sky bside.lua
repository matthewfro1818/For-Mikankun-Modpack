-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/sky bside_Sing') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('sky bside', 'characters/bside sky', 0, 0)

		addAnimationByPrefix('sky bside', 'idle', 'sky annoyed idle', 24, false) 
		
        addAnimationByPrefix('sky bside', 'singLEFT', 'sky annoyed LEFT', 24, false) 
		
		addAnimationByPrefix('sky bside', 'singDOWN', 'sky annoyed down', 24, false) 
		
		addAnimationByPrefix('sky bside', 'singUP', 'sky annoyed up', 24, false) 
		
		addAnimationByPrefix('sky bside', 'singRIGHT', 'sky annoyed right', 24, false) 

		-- you can add more animation if ur character xml has more animation

		addLuaSprite('sky bside', true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('sky bside.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('sky bside','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('sky bside.animation.curAnim.name') ~= 'idle' and not getProperty('sky bside.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('sky bside.animation.curAnim.name') == 'idle' then
                setProperty('sky bside.offset.x',0)
				setProperty('sky bside.offset.y',0)
                
			
			elseif getProperty('sky bside.animation.curAnim.name') == 'singLEFT' then
                setProperty('sky bside.offset.x',0)
				setProperty('sky bside.offset.y',0)
              
			
			elseif getProperty('sky bside.animation.curAnim.name') == 'singUP' then
                setProperty('sky bside.offset.x',0)
				setProperty('sky bside.offset.y',0)
               
			
			elseif getProperty('sky bside.animation.curAnim.name') == 'singDOWN' then
                setProperty('sky bside.offset.x',0)
				setProperty('sky bside.offset.y',0)
                
			
			elseif getProperty('sky bside.animation.curAnim.name') == 'singRIGHT' then
                setProperty('sky bside.offset.x',0)
				setProperty('sky bside.offset.y',0)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'sky bside_Sing' and noteData == 0 then

	objectPlayAnimation('sky bside', 'singLEFT',true);

end

if noteType == 'sky bside_Sing' and noteData == 1 then

	objectPlayAnimation('sky bside', 'singDOWN',true);

end

if noteType == 'sky bside_Sing' and noteData == 2 then

	objectPlayAnimation('sky bside', 'singUP',true);

end

if noteType == 'sky bside_Sing' and noteData == 3 then

	objectPlayAnimation('sky bside', 'singRIGHT',true);

end

if noteType == 'allbf_Sing' and noteData == 0 then

	objectPlayAnimation('sky bside', 'singLEFT',true);

end

if noteType == 'allbf_Sing' and noteData == 1 then

	objectPlayAnimation('sky bside', 'singDOWN',true);

end

if noteType == 'allbf_Sing' and noteData == 2 then

	objectPlayAnimation('sky bside', 'singUP',true);

end

if noteType == 'allbf_Sing' and noteData == 3 then

	objectPlayAnimation('sky bside', 'singRIGHT',true);

end

if noteType == 'bothbf1' and noteData == 0 then

	objectPlayAnimation('sky bside', 'singLEFT',true);

end

if noteType == 'bothbf1' and noteData == 1 then

	objectPlayAnimation('sky bside', 'singDOWN',true);

end

if noteType == 'bothbf1' and noteData == 2 then

	objectPlayAnimation('sky bside', 'singUP',true);

end

if noteType == 'bothbf1' and noteData == 3 then

	objectPlayAnimation('sky bside', 'singRIGHT',true);

end

end

