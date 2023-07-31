local selected = 1
local optionSelected = false

local allowStart=false
function onStartCountdown()
playSound('songCredits', 1, 'creditsSONG')
	if allowStart==false then
		setProperty('inCutscene', true)
		return Function_Stop;
	end	 
	return Function_Continue;
end

function onCreate()
   makeLuaSprite('bgb', 'MENU/creditsMenu', 0, 0)
   setObjectCamera('bgb', 'camOther')
   addLuaSprite('bgb', true)     
addHaxeLibrary('FlxG', 'flixel')
end

function onUpdate()
	if keyJustPressed('back') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
	   loadSong('menu')
	end
	if keyJustPressed('accept') then
       runHaxeCode([[
        #if linux
          Sys.command('/usr/bin/xdg-open', https://gamebanana.com/mods/308568);
        #else
         FlxG.openURL('https://gamebanana.com/mods/308568');
         #end
        ]]) --THX БОРЩ (легенда)
	end	
end	
function onSoundFinished(tag)
   if tag == 'creditsSONG' then
      playSound('songCredits', 1, 'creditsSONG')
   end
end