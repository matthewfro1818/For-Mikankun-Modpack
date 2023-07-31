--[[function onUpdate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -20);
        setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -20);
    end
    precacheImage('noteSplashes');
end
]]
function onCreate()
    setProperty('skipCountdown', true)
end