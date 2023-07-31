function onCreate()
    HypnoScale=1
    makeAnimatedLuaSprite('HypnoArms','characters/Hypno/PASTA_HYPNO')
    addAnimationByPrefix('HypnoArms','idle','Hypno Idle Front',24,false)
    addAnimationByPrefix('HypnoArms','singLEFT','Hypno Left Front',24,false)
    addAnimationByPrefix('HypnoArms','singDOWN','Hypno Down Front',24,false)
    addAnimationByPrefix('HypnoArms','singUP','Hypno Up Front',24,false)
    addAnimationByPrefix('HypnoArms','singRIGHT','Hypno Right Front',24,false)
    playAnim('HypnoArms','idle',true)
    scaleObject('HypnoArms',1.5,1.5)
    addLuaSprite('HypnoArms',true)
    setProperty('HypnoArms.x',getProperty('boyfriend.x')+40)
    setProperty('HypnoArms.y',getProperty('boyfriend.y')+135)

end
local Offsets={
    idle={-64, -172},
    singLEFT={34, 73},
    singDOWN={-134, -155},
    singUP={82, 309},
    singRIGHT={-101, -104},
}

function onUpdate(elapsed)
    local charAnim=getProperty('boyfriend.animation.curAnim.name')
    playAnim('HypnoArms',charAnim,true,false,getProperty('boyfriend.animation.curAnim.curFrame'))
    
    setProperty('HypnoArms.offset.x',Offsets[charAnim][1])
    setProperty('HypnoArms.offset.y',Offsets[charAnim][2])
end