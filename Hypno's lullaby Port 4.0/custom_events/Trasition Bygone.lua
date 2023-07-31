function onEvent(tag,v1,v2)
    if tag=='Trasition Bygone' then
        doTweenAlpha('Clouds','BG2Clouds', 1,10, 'linear')
        doTweenAlpha('Buildings', 'BG2Buildings', 1,10,'linear')
        doTweenAlpha('BigHypno', 'BigHypno', 1,10,'linear')
        doTweenAlpha('Ropes2', 'Ropes2', 1,10,'linear')
        doTweenAlpha('Ropes','Ropes', 0, 10,'linear')
        doTweenAlpha('Bridge2', 'Bridge2', 1, 10,'linear')
        doTweenAlpha('Bridge','Bridge', 0, 10,'linear')
    end
end