--[[function opponentNoteHit(id,direction) OLD
    if mustHitSection == false then
        if direction == 0 then
            characterPlayAnim('boyfriend', 'singLEFT')
        end
        if direction == 1 then
            characterPlayAnim('boyfriend', 'singUP')
        end
        if direction == 2 then
            characterPlayAnim('boyfriend', 'singDOWN')
        end
        if direction == 3 then
            characterPlayAnim('boyfriend', 'singRIGHT')
        end
    end
end]]


PlayerAnims = 
    {   
        "singLEFT", 
        "singDOWN", 
        "singUP", 
        "singRIGHT"
    }

function onCreate()
    triggerEvent('Change Character', 'BF', 'bluehit');
end

function opponentNoteHit(id,direction)
        triggerEvent('Change Character', 'BF', 'bluehit');
        characterPlayAnim('boyfriend', PlayerAnims[direction + 1])
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    
	triggerEvent('Change Character', 'BF', 'blue');
end