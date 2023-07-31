function onCreatePost()
	setProperty('gf.alpha', 0)
    setProperty('defaultCamZoom', 1.05)
    setProperty('camGame.zoom', 1.05)
    setProperty('showRating', false)
    setProperty('showComboNum', false)
    triggerEvent('Camera Follow Pos', 1900, 840)
    doTweenAlpha('bye', 'iconP2', 0, 0.4, 'circInOut')
    doTweenAlpha('not here', 'roomates', 0, 0.4, 'circInOut')

    setPropertyFromGroup('opponentStrums', 0, 'x', 120000);
    setPropertyFromGroup('opponentStrums', 1, 'x', 230000);
    setPropertyFromGroup('opponentStrums', 2, 'x', 940000);
    setPropertyFromGroup('opponentStrums', 3, 'x', 105000);

    setPropertyFromGroup('playerStrums', 0, 'x', 300);
    setPropertyFromGroup('playerStrums', 1, 'x', 500);
    setPropertyFromGroup('playerStrums', 2, 'x', 700);
    setPropertyFromGroup('playerStrums', 3, 'x', 900);
end

function onStepHit()
    if (curStep == 16) then
        doTweenAlpha ('bowchickawowwow', 'dark', 0, 1, 'linear')
    end

    if (curStep == 128) then
        doTweenZoom ('click1', 'camGame', 1.25, 0.1, 'linear')
    end

    if (curStep == 132) then
        doTweenZoom ('click2', 'camGame', 1.5, 0.1, 'linear')
    end

    if (curStep == 136) then
        doTweenZoom ('click3', 'camGame', 1.75, 0.1, 'linear')
    end

    if (curStep == 140) then
        doTweenZoom ('doo', 'camGame', 1.5, 0.1, 'linear')
    end

    if (curStep == 142) then
        doTweenZoom ('deedoo', 'camGame', 1.25, 0.1, 'linear')
    end

    if (curStep == 143) then
        doTweenZoom ('dah', 'camGame', 1.05, 0.1, 'linear')
    end

    if curStep == 397 or curStep == 1007 then
        doTweenZoom('nyoom','camGame', 0.5, 1.5, 'linear')
        doTweenAlpha('bye house', 'room', 0, 0.5, 'linear')
        doTweenAlpha('bye jiberno','boyfriend', 0, 0.5, 'linear')
        doTweenAlpha('lighting', 'gf', 1, 0.5, 'linear')
        doTweenAlpha('bye bed','bed', 0, 0.5, 'linear')
        
    end
    if (curStep == 495) then
        doTweenZoom('back to normal','camGame', 1.05, 5, 'linear')
        doTweenAlpha('hello house', 'room', 1, 5, 'linear')
        doTweenAlpha('hello kitty', 'boyfriend', 1, 5, 'linear')
        doTweenAlpha('rtx off', 'gf', 0, 5, 'linear')
        doTweenAlpha('hi bed','bed', 1, 5, 'linear')
    end
    if (curStep == 911) then
        doTweenZoom('hoo boy','camGame', 2, 10, 'linear')
    end

    if (curStep == 992) then
        doTweenZoom('dun1','camGame', 1.75, 0.1, 'linear')
    end
    if (curStep == 994) then
        doTweenZoom('dun2','camGame', 1.5, 0.1, 'linear')
    end
    if (curStep == 997) then
        doTweenZoom('dun3','camGame', 1.6, 0.1, 'linear')
    end
    if (curStep == 998) then
        doTweenZoom('dun4','camGame', 1.7, 0.1, 'linear')
    end

    if (curStep == 1000) then
        doTweenZoom('dun5','camGame', 1.8, 0.1, 'linear')
    end

    if (curStep == 1231) then
        doTweenZoom('here it comes','camGame', 0.75, 10, 'linear')
    end

    if (curStep == 1296) then
        doTweenZoom('boom','camGame', 0.25, 0.3, 'linear')
    end  

     if (curStep == 1360) then
        doTweenZoom('last zoom','camGame', 1.85, 15, 'linear')
        doTweenAlpha('last house', 'room', 1, 5, 'linear')
        doTweenAlpha('last kitty', 'boyfriend', 1, 5, 'linear')
        doTweenAlpha('bye rtx', 'gf', 0, 5, 'linear')
        doTweenAlpha('last bed','bed', 1, 5, 'linear')
     end
     if (curStep == 1416) then
        doTweenAlpha('they here', 'roomates', 1, 0.1, 'circInOut')
     end
     if (curStep == 1479) then
        triggerEvent('Camera Follow Pos')
        doTweenZoom('what','camGame', 1, 2, 'linear')  
     end

     if (curStep == 1504) then
        doTweenAlpha ('dang','dark', 1, 0.85, 'linear')
        playSound ('fuhgettaboutit', 1)

     end
end
