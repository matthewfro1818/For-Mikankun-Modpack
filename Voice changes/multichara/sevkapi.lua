-- Script made by RealReal
-- uhhhh I made it before Catbrother so it's mine right?
-- https://www.youtube.com/channel/UCBiEI00nFRfvR8it0z8zmzw

	
	
	
	
	
-- These Comment is made for Helping People to understand the code
-- Put this in new Created Folder in mods/ur mod folder/new created folder

local singing = 0

function onCreate()

addLuaScript('custom_notetypes/kapi') -- Load the Note Type

-- CUSTOM SPRITE
makeAnimatedLuaSprite('kapi', 'characters/kapi', 0, 0)

		addAnimationByPrefix('kapi', 'idle', 'Dad idle dance', 24, false) 
		
        addAnimationByPrefix('kapi', 'singLEFT', 'Dad Sing Note RIGHT0', 24, false) 
		
		addAnimationByPrefix('kapi', 'singDOWN', 'Dad Sing Note DOWN', 24, false) 
		
		addAnimationByPrefix('kapi', 'singUP', 'Dad Sing Note UP0', 24, false) 
		
		addAnimationByPrefix('kapi', 'singRIGHT', 'Dad Sing Note LEFT0', 24, false) 

		-- you can add more animation if ur character xml has more animation
		-- addAnimationByPrefix('kapi', 'singRIGHT', 'your character right Pose animation', 24, false) 
		
		addLuaSprite('kapi', true)
		setProperty ("kapi.flipX", true)
		
	
end

function onStepHit() -- Idle Function
    -- Make Bopping Idle Match the Dad and Boyfriend
    if getProperty('kapi.animation.curAnim.name')  ~= null and curBeat % 1 == 0 and singing ~= 1 then -- avoiding Glitchy animation like Kade Engine LMAO
        objectPlayAnimation('kapi','idle');	
    end
		
    -- Change curBeat % 2 to 1 for Bopping Every Beat
	
end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('kapi.animation.curAnim.name') ~= 'idle' and not getProperty('kapi.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end

end

function onUpdatePost(elapsed) -- This is the Offset Function 

            if getProperty('kapi.animation.curAnim.name') == 'idle' then
                setProperty('kapi.offset.x',0)
				setProperty('kapi.offset.y',1)
                
			
			elseif getProperty('kapi.animation.curAnim.name') == 'singLEFT' then
                setProperty('kapi.offset.x',0)
				setProperty('kapi.offset.y',26)
              
			
			elseif getProperty('kapi.animation.curAnim.name') == 'singUP' then
                setProperty('kapi.offset.x',5)
				setProperty('kapi.offset.y',51)
               
			
			elseif getProperty('kapi.animation.curAnim.name') == 'singDOWN' then
                setProperty('kapi.offset.x',0)
				setProperty('kapi.offset.y',-29)
                
			
			elseif getProperty('kapi.animation.curAnim.name') == 'singRIGHT' then
                setProperty('kapi.offset.x',10)
				setProperty('kapi.offset.y',11)
            end

			
end

function goodNoteHit(id, noteData, noteType, isSustainNote) -- I like making easy code so this is different from Catbrother everything code :D

if noteType == 'kapi' and noteData == 0 then

objectPlayAnimation('kapi', 'singLEFT',true);

end

if noteType == 'kapi' and noteData == 1 then

	objectPlayAnimation('kapi', 'singDOWN',true);

end

if noteType == 'kapi' and noteData == 2 then

	objectPlayAnimation('kapi', 'singUP',true);

end

if noteType == 'kapi' and noteData == 3 then

	objectPlayAnimation('kapi', 'singRIGHT',true);

end

if noteType == 'kapi' and noteData == 4 then

	objectPlayAnimation('kapi', 'singUP',true);

end

if noteType == 'kapi' and noteData == 5 then

	objectPlayAnimation('kapi', 'singUP',true);

end

if noteType == 'kapi' and noteData == 6 then

objectPlayAnimation('kapi', 'singLEFT',true);

end

if noteType == 'kapi' and noteData == 7 then

	objectPlayAnimation('kapi', 'singDOWN',true);

end

if noteType == 'kapi' and noteData == 8 then

	objectPlayAnimation('kapi', 'singUP',true);

end

if noteType == 'kapi' and noteData == 9 then

	objectPlayAnimation('kapi', 'singRIGHT',true);

end

end


function noteMiss(id, noteData, noteType, isSustainNote) -- You can add Miss animation if The Character is on BF side
	
end


