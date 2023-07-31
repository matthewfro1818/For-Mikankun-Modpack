

function onCreate()
    makeLuaSprite('bg', 'Finale2/BgShip', -2500, -1000 * 2.5);
    addLuaSprite('bg', false);
    scaleObject('bg', 2, 2)

    makeLuaSprite('plat', 'Finale2/fgPlatform', 0, 600);
    addLuaSprite('plat', false);
    scaleObject('plat', 2, 2)



    makeAnimatedLuaSprite('blacklegssprite', 'blacklegs', 485, 625)
    addAnimationByPrefix('blacklegssprite', 'legmovement', 'legs', 24, true)
    addLuaSprite('blacklegssprite', false);
    scaleObject('blacklegssprite', 1.25, 1.5)

    makeAnimatedLuaSprite('bf_legs', 'characters/bf_legs', 1735, 825);
	addAnimationByPrefix('bf_legs', '', '', 24, true);
	 scaleObject('bf_legs', 1, 1);
	setScrollFactor('bf_legs', 1, 1);
    addLuaSprite('bf_legs', true)
    setObjectOrder('bf_legs', 21);
    setObjectOrder('boyfriendGroup', 22);

    makeLuaSprite('vig', 'Finale2/VignetteFin', 200,-400);
    scaleObject('vig', 2, 1.5)

    addLuaSprite('vig', true);

    doTweenX('platformmovingtween','plat',-950,0.6,"Linear")
end

function onTweenCompleted(tag)
	if tag == 'platformmovingtween' then
        setProperty('plat.x',0)
        doTweenX('platformmovingtween','plat',-950,0.6,"Linear")
    end
end
