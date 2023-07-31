local selected = 1
local colorBG = {'31B0D1', 'FF8C00', 'C10000', '3AC100'}
local songName = {'Sporting', 'Boxing-Match', 'King-hit', 'King-hit-fefe'}
local scaleLikeBeat = {'bgF', 'bgS', 'icons', 'songNameTXT'}

local allowStart=false
function onStartCountdown()
playSound('songFreeplay', 1, 'freeplaySONG')
runTimer('boob', 0.65, 1)
	if allowStart==false then
		setProperty('inCutscene', true)
		return Function_Stop;
	end	 
	return Function_Continue;
end

function onCreatePost()
   makeLuaSprite('bgF', 'MENU/freeplayBG', 0, 0)
   setObjectCamera('bgF', 'camOther')
   addLuaSprite('bgF', true)
   setProperty('bgF.color', getColorFromHex('31B0D1'))
   
   makeLuaSprite('bgS', nil, 330, 160)
   setObjectCamera('bgS', 'camOther')
   makeGraphic('bgS', 640, 350, '000000')
   setProperty('bgS.alpha', 0.5)
   addLuaSprite('bgS', true)   

   makeLuaSprite('icons', 'MENU/FreeplayIcons', 500, 120)
   setObjectCamera('icons', 'camOther')
   scaleObject('icons', 1, 1)
   setProperty('icons.alpha', 1)   
   addLuaSprite('icons', true)     

   makeLuaText('songNameTXT', 'SONG NAME', 680, 310, 300)
   setTextSize('songNameTXT', 75)
   setProperty('songNameTXT.alpha', 1)
   setObjectCamera('songNameTXT', 'camOther')   
   addLuaText('songNameTXT', true)       

end

function onUpdate()	
	if keyJustPressed('back') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
	   loadSong('menu')	   
	end
	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
	   loadSong('freeplay')
	end		
    
	if selected < 1 then
	   selected = 4
	end  
	if selected > 4 then
	   selected = 1
	end 		
    setTextString('songNameTXT', songName[selected])
	if keyJustPressed('left') then
	   selected = selected - 1
	   runTimer('changeColorForBackgroundPLS', 0.1, 1)
	   playSound('scrollMenu', 0.7)	   
	end	
	if keyJustPressed('right') then
	   selected = selected + 1
	   runTimer('changeColorForBackgroundPLS', 0.1, 1)
	   playSound('scrollMenu', 0.7)
	end	
	if keyJustPressed('accept') then
	   loadSong(songName[selected], 1)	   
	end
end	
function onTimerCompleted(tag)
   if tag == 'boob' then
    for i=1,#scaleLikeBeat do
	  setProperty(''..scaleLikeBeat[i]..'.scale.x', 1.1)
	  setProperty(''..scaleLikeBeat[i]..'.scale.y', 1.1)
      doTweenX('beatX'..i, ''..scaleLikeBeat[i]..'.scale', 1, 0.5, 'cubeOut')	  
      doTweenY('beatY'..i, ''..scaleLikeBeat[i]..'.scale', 1, 0.5, 'cubeOut')	  	  
	end
	  runTimer('boob', 0.65, 1)
   end   
   if tag == 'changeColorForBackgroundPLS' then
	   doTweenColor('bgC', 'bgF', colorBG[selected], 0.5, 'linear')	     
   end
end
function onSoundFinished(tag)
   if tag == 'freeplaySONG' then
      playSound('songFreeplay', 1, 'freeplaySONG')
   end
end