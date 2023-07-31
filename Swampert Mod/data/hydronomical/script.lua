function opponentNoteHit()
    if characterPlayingAs == 0 then
        health = getProperty('health')
        if getProperty('health') > 0.05 then
            setProperty('health', health- 0.02);
        end
    end
end

function goodNoteHit()
    if characterPlayingAs == 1 then
        health = getProperty('health')
        if getProperty('health') > 0.05 then
            setProperty('health', health- 0.02);
        end
    end
end 