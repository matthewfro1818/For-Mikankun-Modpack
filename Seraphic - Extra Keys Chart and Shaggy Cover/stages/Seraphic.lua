function onCreate()
	-- background shit
    makeLuaSprite('Seraphic', 'Seraphic', -1000,-800)
    setLuaSpriteScrollFactor('Seraphic', 0.9, 0.9)
    addLuaSprite('Seraphic')
	scaleObject('background', 0.3,0.3)
    addGlitchEffect('Seraphic') -- you know i have a own build of psych engine 
end