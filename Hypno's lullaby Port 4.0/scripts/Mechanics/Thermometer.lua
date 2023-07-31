--That Code is Made by Drawoon_
local Path='Mechanics/'
function onCreatePost()
  initSaveData('HypnosPref')
  Cold=1
  CanUse=10
  ColdDown=false
  GuideCan=false
  coldnessRate=0
  camZoomOverwrite=false
  CanThermometer=not getDataFromSave('HypnosPref','Pussy mode',false)
  if getDataFromSave('HypnosPref','Hell mode',false) then
    CanUse=8
  end
  if CanThermometer then
  precacheSound('TyphlosionUse')
  precacheSound('TyphlosionDeath')

  makeLuaSprite('Thermometer_BarBG', nil, 1161 + 36 - 1134, 172 + 14);
  makeGraphic('Thermometer_BarBG', 16, 325, '133551')
  setObjectCamera('Thermometer_BarBG', 'hud')
  addLuaSprite('Thermometer_BarBG',false)

  makeLuaSprite('Thermometer_Bar', nil, 1161 + 36 - 1134, 172 + 14);
  makeGraphic('Thermometer_Bar', 16, 1, 'AAD6FF')
  setObjectCamera('Thermometer_Bar', 'hud')
  addLuaSprite('Thermometer_Bar',false)

  makeAnimatedLuaSprite('Typhlosion_Thermometer',Path..'TyphlosionVit',1164 - 1134, 119)
  addAnimationByPrefix('Typhlosion_Thermometer', '-10', 'Typh1 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-8', 'Typh2 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-6', 'Typh3 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-4', 'Typh4 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-2', 'Typh5 instance ', 24,true)
	setObjectCamera('Typhlosion_Thermometer', 'hud')
  addLuaSprite('Typhlosion_Thermometer', false)
  if CanUse<=2 then
    playAnim('Typhlosion_Thermometer', '-2', true)
  elseif CanUse<=4 then
    playAnim('Typhlosion_Thermometer', '-4', true)
  elseif CanUse<=6 then
    playAnim('Typhlosion_Thermometer', '-6', true)
  elseif CanUse<=8 then
    playAnim('Typhlosion_Thermometer', '-8', true)
  else
    playAnim('Typhlosion_Thermometer', '-10', true)
  end

  makeAnimatedLuaSprite('Thermometer',Path..'Thermometer', 1161 - 1134, 172)
  addAnimationByPrefix('Thermometer', 'cold', 'Therm1', 24,false)
  addAnimationByPrefix('Thermometer', 'veryCold', 'Therm2', 24,false)
  addAnimationByPrefix('Thermometer', 'Frozen', 'Therm3', 24,false)
	setObjectCamera('Thermometer', 'hud')
  addLuaSprite('Thermometer', false);
  playAnim('Thermometer', 'cold', true)

  makeAnimatedLuaSprite('Guide',Path..'Extras', 0, 0)
  addAnimationByPrefix('Guide', 'idle', 'Spacebar', 24,true)
	setObjectCamera('Guide', 'hud')
  addLuaSprite('Guide', false);
  playAnim('Guide', 'idle', true)
  screenCenter('Guide','xy')
  setProperty('Guide.alpha',0)
  end

  
  makeAnimatedLuaSprite('Typhlosion', 'characters/Gold/TYPHLOSION_MECHANIC', getProperty('boyfriend.x')+150,getProperty('boyfriend.y')+180)
  addAnimationByIndicesLoop('Typhlosion', 'idle','TYPHLOSION MECHANIC','0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24)
  addAnimationByIndices('Typhlosion', 'Flame', 'TYPHLOSION MECHANIC', '1516,17,18,19,20,21,22,23,24,25,26,27,28,29',24)
  setObjectOrder('Typhlosion', 20)
  addLuaSprite('Typhlosion', false);
  playAnim('Typhlosion', 'idle', true)



  
end
local DisplayCold=0
local isDead=false
function Lerp(Min,Max,Ratio)
  return Min + Ratio * (Max - Min);

end
function onStepHit()
    if curStep%4==0 and CanThermometer and not getDataFromSave('HypnosPref','Hell mode',false) then
      Cold=Cold+coldnessRate
    elseif curStep%3==0 and CanThermometer and getDataFromSave('HypnosPref','Hell mode',false) then
      Cold=Cold+coldnessRate
    end
end

function onUpdate(elapsed)
  if getHealth()<=0 then
    isDead=true
  end
  if getDataFromSave('HypnosPref','Hell mode',false) then
    setProperty('cpuControlled',false)
    setProperty('botplayTxt.visible',false)
  end
if keyJustPressed('space') and CanUse> 0 and not ColdDown and CanThermometer then
  Change_TyphlosionVit()
doTweenAlpha('Guiade', 'Guide', 0, 0.5, 'cubeInOut')
end

if isDead then
  DisplayCold=0
  camZoomOverwrite=true
else
  DisplayCold=Lerp(DisplayCold,Cold,(elapsed / (1 / 120)) * 0.03)

end
if DisplayCold<=0 then
  setProperty('Thermometer_Bar.visible',false)
else
setProperty('Thermometer_Bar.visible',true)
end
if luaSpriteExists('Fog') and not isDead then
  setProperty('Fog.alpha',DisplayCold/100)
end

if luaSpriteExists('Thermometer_Bar') then
  setGraphicSize('Thermometer_Bar',15,getProperty('Thermometer_BarBG.height')*DisplayCold/100)  
setProperty('Thermometer_Bar.y',getProperty('Thermometer_BarBG.y')+getProperty('Thermometer_BarBG.height')-getProperty('Thermometer_Bar.height'))
end
  if botPlay and CanUse> 0 and ColdDown==false and Cold>42 and CanThermometer then
  
    Change_TyphlosionVit()
  
  
    doTweenAlpha('Guiade', 'Guide', 0, 0.5, 'cubeInOut')
  end
  if Cold~=0 and not getPropertyFromClass('PlayState','seenCutscene') and getProperty('camHUD.alpha')==1 then
    local Multiply=1
    if getDataFromSave('HypnosPref','Hell mode',false) then
      Multiply=6
    end
    addHealth(-(((DisplayCold/1000)*0.00300) * ((elapsed) * 120))*Multiply)
      
  end
  if not camZoomOverwrite then
    setProperty('defaultCamZoom',0.8 + ((DisplayCold/100)* 0.15))
    setProperty('boyfriendCameraOffset',{0 + ((DisplayCold/100) * 300),-160 + ((DisplayCold/100) * 150)})
  end
end
function onUpdatePost()

if Cold>=100 then
setHealth(-1)
end
if Cold<33 then
  playAnim('Thermometer', 'cold', true)
  
 
elseif Cold<66  then
playAnim('Thermometer', 'veryCold', true)
else
  playAnim('Thermometer', 'Frozen', true)
end
if Cold>35 and GuideCan==false and CanThermometer and not getDataFromSave('HypnosPref','Hell mode',false) then
  GuideCan=true
  doTweenAlpha('Guiade', 'Guide', 1, 0.5, 'cubeInOut')
end
if getProperty('Summon.animation.curAnim.finished') and camZoomOverwrite then
  camZoomOverwrite=false
end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag =='use' then
    
  end
  if tag =='Coldown'then
    ColdDown=false
  end
  if tag =='change'then
    playAnim('Typhlosion', 'idle', true)
  end
end
function Change_TyphlosionVit()
  CanUse=CanUse-1
  playSound('TyphlosionUse',0.5)
  
  ColdDown=true
  local Warn=((0.35 * (CanUse * 0.075)) + 0.20)*100
  if getDataFromSave('HypnosPref','Hell mode',false) then
      local WarmUse={31,35,39,44,49,55,62,70}
      Warn=WarmUse[CanUse+1]
  end
  Cold=Cold-Warn
  if Cold<=0 then
    Cold=0
  end
  runTimer('Coldown',1,1)
  if CanUse<=2 then
    playAnim('Typhlosion_Thermometer', '-2', true)
  elseif CanUse<=4 then
    playAnim('Typhlosion_Thermometer', '-4', true)
  elseif CanUse<=6 then
    playAnim('Typhlosion_Thermometer', '-6', true)
  elseif CanUse<=8 then
    playAnim('Typhlosion_Thermometer', '-8', true)
  else
    playAnim('Typhlosion_Thermometer', '-10', true)
  end
  playAnim('Typhlosion', 'Flame', true)
runTimer('change',0.5,1)
if CanUse==0 then
  playSound('TyphlosionDeath',1)
  doTweenY('death','Typhlosion',getProperty('Typhlosion.y')+500,1.5,'quadInOut')
end
end
local OneTrigger=false
function onGameOver()
  camZoomOverwrite=true
    if not OneTrigger and CanUse>0 then
      OneTrigger=true
      playSound('TyphlosionDeath',0.75,'GameOverTyphlosion')
      soundFadeOut('GameOverTyphlosion',1,0)
      doTweenY('death','Typhlosion',getProperty('Typhlosion.y')+500,1.5,'quadInOut')
    end
end
function onEvent(tag,v1,v2)
  if tag =='Tylosion_Cry' then
    playAnim('Typhlosion', 'Flame', true)
    runTimer('change',0.5,1)
    runTimer('Coldown',1,1)
  end
  if tag=='End_Frostbite' then
    coldnessRate=0
    CanUse=-1
end
if tag=='summonFreakachu'then
  camZoomOverwrite=true
end
if tag=='StartFreeze' then
  coldnessRate=1
end
end