function onUpdate(elapsed)
if curBeat >= 0 and curBeat <= 1111 then
doTweenY('dad1moves', 'dad1', 150, 0.001)
doTweenX('dad1move', 'dad1', -50, 0.001)

doTweenY('dad2moves', 'dad2', 500, 0.001)
doTweenX('dad2move', 'dad2', 250, 0.001)

doTweenY('bf1moves', 'boyfriend1', 450, 0.001)
doTweenX('bf1move', 'boyfriend1', 900, 0.001)

doTweenY('bf2moves', 'boyfriend2', 600, 0.001)
doTweenX('bf2move', 'boyfriend2', 1100, 0.001)

end
end