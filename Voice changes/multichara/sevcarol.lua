-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/carol') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('carol', 'characters/carol', 0, 0)

		addAnimationByPrefix('carol', 'idle', 'Dad idle dance', 24, false) 
		
        addAnimationByPrefix('carol', 'singLEFT', 'Dad Sing Note RIGHT0', 24, false) 
		
		addAnimationByPrefix('carol', 'singDOWN', 'Dad Sing Note DOWN', 24, false) 
		
		addAnimationByPrefix('carol', 'singUP', 'Dad Sing Note UP0', 24, false) 
		
		addAnimationByPrefix('carol', 'singRIGHT', 'Dad Sing Note LEFT0', 24, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('carol', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('carol', true)
		setProperty ("carol.flipX", true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('carol.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('carol','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('carol.animation.curAnim.name') ~= 'idle' and not getProperty('carol.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('carol.animation.curAnim.name') == 'idle' then
                setProperty('carol.offset.x',-91)
				setProperty('carol.offset.y',1)
                
			
			elseif getProperty('carol.animation.curAnim.name') == 'singLEFT' then
                setProperty('carol.offset.x',-58)
				setProperty('carol.offset.y',30)
              
			
			elseif getProperty('carol.animation.curAnim.name') == 'singUP' then
                setProperty('carol.offset.x',-103)
				setProperty('carol.offset.y',52)
               
			
			elseif getProperty('carol.animation.curAnim.name') == 'singDOWN' then
                setProperty('carol.offset.x',-83)
				setProperty('carol.offset.y',-28)
                
			
			elseif getProperty('carol.animation.curAnim.name') == 'singRIGHT' then
                setProperty('carol.offset.x',-145)
				setProperty('carol.offset.y',13)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'carol' and noteData == 0 then

objectPlayAnimation('carol', 'singLEFT',true);

end

if noteType == 'carol' and noteData == 1 then

	objectPlayAnimation('carol', 'singDOWN',true);

end

if noteType == 'carol' and noteData == 2 then

	objectPlayAnimation('carol', 'singUP',true);

end

if noteType == 'carol' and noteData == 3 then

	objectPlayAnimation('carol', 'singRIGHT',true);

end

if noteType == 'carol' and noteData == 4 then

	objectPlayAnimation('carol', 'singUP',true);

end

if noteType == 'carol' and noteData == 5 then

	objectPlayAnimation('carol', 'singUP',true);

end

if noteType == 'carol' and noteData == 6 then

objectPlayAnimation('carol', 'singLEFT',true);

end

if noteType == 'carol' and noteData == 7 then

	objectPlayAnimation('carol', 'singDOWN',true);

end

if noteType == 'carol' and noteData == 8 then

	objectPlayAnimation('carol', 'singUP',true);

end

if noteType == 'carol' and noteData == 9 then

	objectPlayAnimation('carol', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


