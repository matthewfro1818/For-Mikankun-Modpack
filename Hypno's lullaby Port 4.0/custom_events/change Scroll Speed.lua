function onEvent(eventName, value1, value2)
    if eventName=='change Scroll Speed' or eventName=='Change Scroll Speed' then
        runHaxeCode([[
        var val1:Float=]]..value1..[[;
        var val2:Float=]]..value2..[[;
        if (Math.isNaN(val1) || val1 <= 0) val1 = 1;
	    if (Math.isNaN(val2) || val2 <= 0) val2 = 0;
        var newValue:Float = PlayState.SONG.speed * val1;
        
        if(val2 <= 0)
        {
            game.songSpeed = newValue;
        }
        else
        {            
            game.songSpeedTween = FlxTween.tween(PlayState.instance, {songSpeed: newValue},val2 * (Conductor.stepCrochet / 1000), {ease: FlxEase.linear, onComplete:
                function (twn:FlxTween)
                {
                    game.songSpeedTween = null;
                }
            });
            
        }]])

        
    end
end
function onCreate()
addHaxeLibrary('Float')
addHaxeLibrary('Math')
end