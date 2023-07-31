local followchars = false;

function onCreate()
    makeLuaSprite('normalback', 'finale/iluminao omaga', -500,400);
	setScrollFactor('normalback', 1, 1);
	addLuaSprite('normalback', true);
    scaleObject('normalback', 1, 1)


    -- -- background shit
	makeLuaSprite('bgg', 'finale/bgg', -600, -400);
	setLuaSpriteScrollFactor('bgg', 0.8, 0.8);
	makeLuaSprite('dead', 'finale/dead', 800, -270);
	setLuaSpriteScrollFactor('dead', 0.8, 0.8);
	makeLuaSprite('bg', 'finale/bg', -790, -530);
	setLuaSpriteScrollFactor('bg', 1, 1);
	makeLuaSprite('splat', 'finale/splat', 370, 1200);
	makeLuaSprite('fore', 'finale/fore', -750, 160);
  setLuaSpriteScrollFactor('fore', 1.1, 1.1);
  
	makeLuaSprite('dark', 'finale/dark', -720, -350);
	setLuaSpriteScrollFactor('dark', 1.05, 1.05);

	makeLuaSprite('lamp', 'finale/lamp', 1190, -280);

	makeAnimatedLuaSprite('light', 'finale/light', -230, -100);
	setLuaSpriteScrollFactor('light', 1.05, 1.05);
  addAnimationByPrefix('light','finale/light','light',24,true);
	setBlendMode('light','add')
	setBlendMode('dark','multiply')
    makeLuaSprite('wow', 'finale/first section', -740, -900);
    addLuaSprite('wow', true)
    scaleObject('wow', 10, 10)
    setObjectCamera('wow', 'Hud')

	scaleLuaSprite('bgg', 1.1, 1.1)
	scaleLuaSprite('dead', 1.1, 1.1)
	scaleLuaSprite('bg', 1.1, 1.1)
	scaleLuaSprite('lamp', 1.1, 1.1)
	scaleLuaSprite('fore', 1.1, 1.1)
  scaleLuaSprite('splat', 1.1, 1.1)
	scaleLuaSprite('dark', 1.1, 1.1)
	scaleLuaSprite('light', 1.1, 1.1)

end

function onBeatHit()

end
function onStepHit()
    if curStep == 64 then
        makeLuaSprite('flashback', 'MOOGU_bg', 0,0);
        setProperty('flashback.alpha',0.5)
        scaleLuaSprite('bgg', 1.1, 1.1)
    elseif curStep == 3 then
    removeLuaSprite('wow')
    end
    if curStep == 80 then
        makeLuaSprite('flashback', 'TOOGU_bg', 0,0);
        setProperty('flashback.alpha',0.5)
        scaleLuaSprite('bgg', 1.1, 1.1)
    end
    if curStep == 95 then
        makeLuaSprite('flashback', 'DLOW_bg', 0,0);
        setProperty('flashback.alpha',0.5)
        scaleLuaSprite('bgg', 1.1, 1.1)
    end
    if curStep == 272 then
        addLuaSprite('bgg', false);
	    addLuaSprite('dead', false);
	    addLuaSprite('bg', false)
	    addLuaSprite('splat', true)
	    addLuaSprite('lamp', false);
	    addLuaSprite('fore', true);
	    addLuaSprite('dark', true);
	    addLuaSprite('light', true)
        removeLuaSprite('normalback', false);
    end
end

function onSongStart()
        doTweenZoom('camzoom', 'camGame', 0.8, 9.6,smootherStepIn)
end
function onUpdate()
    setProperty('gf.alpha', 0);
end