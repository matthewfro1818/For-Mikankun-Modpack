function onCreate()
	--[[
    Code made by Drawoon_
    ]]
    initSaveData('HypnosPref')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'gega' then
            if getDataFromSave('HypnosPref','Hell mode',false) then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'gega')
                setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0')
                setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0')
                setPropertyFromGroup('unspawnNotes', i, 'antialiasing',false)
                setPropertyFromGroup('unspawnNotes', i, 'ratingDisabled',true)
    
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote',true)
            else
                removeFromGroup('unspawnNotes',i)
            end
		end
	end
end
local gengarNoteInvis=0
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType=='gega' then
        gengarNoteInvis=gengarNoteInvis + 0.70
        if flashingLights then cameraFlash('other','0x528E16FF',0.5) end
        playSound('GengarNoteSFX',1)
        if gengarNoteInvis > 0.70 then gengarNoteInvis = 0.70 end
    end
end
function onUpdate(elapsed)
    for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'mustPress') then
            setPropertyFromGroup('notes', i, 'multAlpha',1-gengarNoteInvis)
        end
    end
    if gengarNoteInvis > 0.0001 then
        gengarNoteInvis=gengarNoteInvis-0.00020 * ((elapsed) * 120)
    end
end