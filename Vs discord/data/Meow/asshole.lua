function onUpdatePost(elapsed)   
    if curStep == 438 or curStep == 1077 then
        setProperty('boyfriend.stunned',true)
    end
    if curStep == 447 or curStep == 1080 then
        setProperty('boyfriend.stunned',false)
    end
end