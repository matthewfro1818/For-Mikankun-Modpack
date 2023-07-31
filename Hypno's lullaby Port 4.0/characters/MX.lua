local Offsets={
    idle={60, 5},
    singLEFT={64, 16},
    singDOWN={451, -124},
    singUP={-10, -120},
    singRIGHT={64, -122},
    Hit1={111,-2},
    Hit2={144,-110}
}
function onCreate()
    local ScaleMX=0.9
    makeAnimatedLuaSprite('MXArms','characters/MX&LordX/mxfront',0,0)
    addAnimationByPrefix('MXArms','idle','IdleFront',16,false)
    addAnimationByPrefix('MXArms','singLEFT','LeftFront',24,false)
    addAnimationByPrefix('MXArms','singDOWN','DownFront',24,false)
    addAnimationByPrefix('MXArms','singUP','UpFront',24,false)
    addAnimationByPrefix('MXArms','singRIGHT','RightFront',24,false)
    addAnimationByPrefix('MXArms','Hit1','Hit1Front',24,false)
    addAnimationByPrefix('MXArms','Hit2','Hit2Front',24,false)
    scaleObject('MXArms',ScaleMX,ScaleMX)

    Offsets.idle={60*ScaleMX, 5*ScaleMX}
    Offsets.singLEFT={460*ScaleMX, -128*ScaleMX}
    Offsets.singDOWN={56*ScaleMX, -124*ScaleMX}
    Offsets.singUP={50*ScaleMX, 0*ScaleMX}
    Offsets.singRIGHT={0*ScaleMX, -122*ScaleMX}
    Offsets.Hit1={111*ScaleMX, -2*ScaleMX}
    Offsets.Hit2={144*ScaleMX, -110*ScaleMX}
    
    playAnim('MXArms','idle',true)
    
    makeAnimatedLuaSprite('POW','stage/Bar/mxblock',0,0)
    addAnimationByPrefix('POW','bop','blockIdle',24,false)

    MXOffsetY=-50
    MXOffsetX=-72
    
    setProperty('MXArms.x',getProperty('dad.x')+MXOffsetX)
    setProperty('MXArms.y',getProperty('dad.y')+MXOffsetY)
    addLuaSprite('MXArms',true)

    setProperty('POW.x',getProperty('MXArms.x')-MXOffsetX-195)
    setProperty('POW.y',getProperty('MXArms.y')-MXOffsetY+460)
    addLuaSprite('POW',true)
    
end

function onUpdate(elapsed)
    local charAnim=getProperty('dad.animation.curAnim.name')
    playAnim('MXArms',charAnim,true,false,getProperty('dad.animation.curAnim.curFrame'))
    setProperty('MXArms.offset.x',Offsets[charAnim][1])
    setProperty('MXArms.offset.y',Offsets[charAnim][2])
end