-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/hex') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('hex', 'characters/hex', 0, 0)

		addAnimationByPrefix('hex', 'idle', 'Dad idle dance', 24, false) 
		
        addAnimationByPrefix('hex', 'singLEFT', 'Dad Sing Note RIGHT0', 12, false) 
		
		addAnimationByPrefix('hex', 'singDOWN', 'Dad Sing Note DOWN', 12, false) 
		
		addAnimationByPrefix('hex', 'singUP', 'Dad Sing Note UP0', 12, false) 
		
		addAnimationByPrefix('hex', 'singRIGHT', 'Dad Sing Note LEFT0', 12, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('hex', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('hex', true)
		setProperty ("hex.flipX", true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('hex.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('hex','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('hex.animation.curAnim.name') ~= 'idle' and not getProperty('hex.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('hex.animation.curAnim.name') == 'idle' then
                setProperty('hex.offset.x',-90)
				setProperty('hex.offset.y',1)
                
			
			elseif getProperty('hex.animation.curAnim.name') == 'singLEFT' then
                setProperty('hex.offset.x',-50)
				setProperty('hex.offset.y',23)
              
			
			elseif getProperty('hex.animation.curAnim.name') == 'singUP' then
                setProperty('hex.offset.x',-135)
				setProperty('hex.offset.y',40)
               
			
			elseif getProperty('hex.animation.curAnim.name') == 'singDOWN' then
                setProperty('hex.offset.x',-30)
				setProperty('hex.offset.y',-35)
                
			
			elseif getProperty('hex.animation.curAnim.name') == 'singRIGHT' then
                setProperty('hex.offset.x',-140)
				setProperty('hex.offset.y',1)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'hex' and noteData == 0 then

objectPlayAnimation('hex', 'singLEFT',true);

end

if noteType == 'hex' and noteData == 1 then

	objectPlayAnimation('hex', 'singDOWN',true);

end

if noteType == 'hex' and noteData == 2 then

	objectPlayAnimation('hex', 'singUP',true);

end

if noteType == 'hex' and noteData == 3 then

	objectPlayAnimation('hex', 'singRIGHT',true);

end

if noteType == 'hex' and noteData == 4 then

	objectPlayAnimation('hex', 'singUP',true);

end

if noteType == 'hex' and noteData == 5 then

	objectPlayAnimation('hex', 'singUP',true);

end

if noteType == 'hex' and noteData == 6 then

objectPlayAnimation('hex', 'singLEFT',true);

end

if noteType == 'hex' and noteData == 7 then

	objectPlayAnimation('hex', 'singDOWN',true);

end

if noteType == 'hex' and noteData == 8 then

	objectPlayAnimation('hex', 'singUP',true);

end

if noteType == 'hex' and noteData == 9 then

	objectPlayAnimation('hex', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


