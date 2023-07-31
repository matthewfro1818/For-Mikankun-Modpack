--Made by Drawoon_
--If you using this code in some mods give me credits
local SET=false
function onEvent(eventName, value1, value2)
if eventName=='Morph' then
    if SET==false then
        SET=true
    triggerEvent('Play Animation','transmorph','bf')	
    triggerEvent('Alt Idle Animation','bf','-morph')
    for i = 0, getProperty('unspawnNotes.length')-1 do
       if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~='Alt Animation'  then
        setPropertyFromGroup('unspawnNotes', i, 'animSuffix','-morph')  
       end
    end
    for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'noteType') ~='Alt Animation'  then
        setPropertyFromGroup('notes', i, 'animSuffix','-morph')
        end
    end
else
    triggerEvent('Alt Idle Animation','bf','')
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~='Alt Animation'  then
         setPropertyFromGroup('unspawnNotes', i, 'animSuffix','')  
        end
     end
     for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'noteType') ~='Alt Animation'  then
         setPropertyFromGroup('notes', i, 'animSuffix','')
        end
     end
end
end
end