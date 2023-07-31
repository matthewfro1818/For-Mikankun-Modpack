function onCreate()
    makeLuaSprite('idkbackground', 'stagehenry', -245, -480);
	addLuaSprite('idkbackground', false)
    
    makeAnimatedLuaSprite('snowback','characters/GF_assets',2000,0)
	addAnimationByPrefix('snowback','snowback','GF Dancing Beat',24,true)
	objectPlayAnimation('snowback','snowback',false)
	addLuaSprite('snowback',false)
        scaleObject('snowback', 1, 1) ;
        setObjectOrder('gfGroup', getObjectOrder('dad')+10)
end

function onStepHit()
    if curStep== 697 then
    doTweenX('MoveX', 'gf', 1250, 0.1, 'linear')
    end
    end