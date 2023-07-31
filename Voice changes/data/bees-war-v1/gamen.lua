
local ScreamX = 100 ;
local ScreamY = 100 ;

function onUpdate()

        setPropertyFromClass('openfl.Lib','application.window.x', math.floor(math.random(getPropertyFromClass('openfl.Lib', 'application.window.x')+ScreamX, getPropertyFromClass('openfl.Lib', 'application.window.ScreamX')-8)))
        setPropertyFromClass('openfl.Lib','application.window.y', math.floor(math.random(getPropertyFromClass('openfl.Lib', 'application.window.y')+ScreamY, getPropertyFromClass('openfl.Lib', 'application.window.y')-ScreamY)))

end