--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='ChangeAnim' then
    value=tonumber(value1)
if value==0 then
    Suffix='-wigglytuff'
    Color='A36775'
    Zoom=-0.20
    Intensity=0.0125
elseif value==1 then
    Suffix=''
    Color='7B4A56'
    Zoom=-0.125
    Intensity=0.05
elseif value==2 then
    Suffix='-DECAY 2'
    Color='633843'
    Zoom=-0.05
    Intensity=0.125
else
    Suffix='-STARE'
    Color='542F38'
    Zoom=0
    Intensity=0.5
end
callScript('stages/Disabled','ChangeZoom',{Zoom,'dad'})
callScript('stages/Disabled','ChangeIntensity',{Intensity})
setHealthBarColors(Color,'FFC400')
playAnim('iconWiggly',tostring(value))
setProperty('dad.idleSuffix',Suffix)
characterDance('dad')
for i = 0, getProperty('notes.length')-1 do
    if getPropertyFromGroup('notes', i, 'noteType') == 'DisabledNotes' then
        setPropertyFromGroup('notes', i, 'animSuffix', Suffix);			
    end
end
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DisabledNotes' then
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', Suffix);			
		end
	end
    
end
end
