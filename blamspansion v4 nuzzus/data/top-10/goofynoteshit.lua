function opponentNoteHit(id,direction)
    triggerEvent('Change Scroll Speed', 1 * math.random(800,2000) / 1000, 0);
    
        setProperty('health', tonumber(1 - math.random(1,900)/1000));
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if mustHitSection == true then
        triggerEvent('Change Scroll Speed', 1, 0);
    end
end