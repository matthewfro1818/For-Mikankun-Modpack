function onCreate()
    makeLuaSprite('idkbackground', 'stagehenry', -245, -480);
	addLuaSprite('idkbackground', false);
end
function onStepHit()
if curStep== 40 then
doTweenX('MoveX', 'dad', 800, 1, 'circIn')
end
end