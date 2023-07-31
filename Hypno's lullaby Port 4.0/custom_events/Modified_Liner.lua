local MultSpeed={1.1,0.9,1.2,0.8}
function onCreate()
    initSaveData('HypnosPref')
end
function onEvent(eventName, value1, value2)
    if eventName=='Modified_Liner' then
        local Multi=1
        if getDataFromSave('HypnosPref','Pussy mode',false) then
            Multi=0.9
        elseif getDataFromSave('HypnosPref','Hell mode',false) then
            Multi=1.2
        end
        
        MultSpeed[tonumber(value1)+1]=tonumber(value2)*Multi
        for i=0,getProperty('notes.length')-1 do
            setPropertyFromGroup('notes',i,'multSpeed',MultSpeed[getPropertyFromGroup('notes',i,'noteData')+1])
        end
    end
end
function onSpawnNote(id,noteData,noteType,isSustainNote)
    setPropertyFromGroup('notes',id,'multSpeed',MultSpeed[noteData+1])
end
