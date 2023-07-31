local angleshit = 1;
local anglevar = 10;

function onStartCountdown()
modchart = true
	return Function_Continue;
end

function onCreate()
   makeLuaSprite('table','gamble/table',-1000,-420)
   setScrollFactor('table', 1.0, 1.0)
   scaleObject('table',1.1,1.1)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'death')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', '')

   makeLuaSprite('cover','gamble/table2',600,-420)
   setScrollFactor('cover', 1.0, 1.0)
   scaleObject('cover',1.1,1.1)

   makeLuaSprite('light','gamble/light',-900,-210)
   setScrollFactor('light', 1.0, 1.0)
   setProperty('light.alpha',0.375)
   scaleObject('light',1.0,1.0)
   doTweenAngle('rightangle','light',10,2.5,'sineInOut')
   doTweenX('right','light',getProperty('light.x')-115,2.5,'sineInOut')

   addLuaSprite('table',true);
   addLuaSprite('cover',true);
   addLuaSprite('light',true);
end

function onTweenCompleted(tag)
   if tag == 'rightangle' then
      doTweenAngle('leftangle','light',-5,2.5,'sineInOut')
   end
   if tag == 'leftangle' then
      doTweenAngle('rightangle','light',5,2.5,'sineInOut')
   end
   if tag == 'right' then
   	doTweenX('left','light',getProperty('light.x')+125,2.5,'sineInOut')
   end
   if tag == 'left' then
   	doTweenX('right','light',getProperty('light.x')-125,2.5,'sineInOut')
   end
end

function onUpdate(elapsed)
	if modchart == true then
    		for i = 0,3 do
        		setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
			setPropertyFromGroup('strumLineNotes', 4, 'x', 410)
			setPropertyFromGroup('strumLineNotes', 5, 'x', 520)
			setPropertyFromGroup('strumLineNotes', 6, 'x', 630)
			setPropertyFromGroup('strumLineNotes', 7, 'x', 740)

		end
    	end
end

function onGameOver()
	modchart = false
	return Function_Continue;
end