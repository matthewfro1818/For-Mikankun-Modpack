function onCreate()
        createstagepicture('bg1','sunset/BG1',-970,-580,0.8,0.8,0.3,0.3)
        createstagepicture('bg2','sunset/BG2',-1240,-680,0.5,0.5,0.6,0.6)
        createstagechara('mini','sunset/femboy-and-edgy-jigglypuff',817,190,0.5,0.5,0.6,0.6)
        createstagechara('mordecai','sunset/jacob',141,103,0.5,0.5,0.6,0.6)
        createstagepicture('bg3','sunset/BG3',-630,-330,0.8,0.8,1,1)
end
function onCreatePost()
        triggerEvent('Change Character',2,'gf')
        setProperty('boyfriend.alpha',0)
        setProperty('dad.alpha',0)
        setProperty('gf.alpha',0)
        doTweenAlpha('bfAlpha','boyfriend',1,1.5)
        doTweenAlpha('dadAlpha','dad',1,1.5)
        doTweenAlpha('gfAlpha','gf',1,1.5)
end

function createstagepicture(tag,image,x,y,sax,say,scx,scy)
        --sax=scale.x
        --say=scale.y
        --scx=scrollFactor.x
        --scy=scrollFactor.y
        makeLuaSprite(tag,image,x,y)
        setProperty(tag..'.scale.x',sax)
        setProperty(tag..'.scale.y',say)
        setProperty(tag..'.scrollFactor.x',scx)
        setProperty(tag..'.scrollFactor.y',scy)
        setProperty(tag..'.alpha',0)
        addLuaSprite(tag)
        doTweenAlpha(tag..'Alpha',tag,1,1.5)
end

function onSongStart()
        setProperty('cameraSpeed', 1)
end

function createstagechara(tag,image,x,y,sax,say,scx,scy)
        --sax=scale.x
        --say=scale.y
        --scx=scrollFactor.x
        --scy=scrollFactor.y
        makeAnimatedLuaSprite(tag,image,x,y)
        setProperty(tag..'.scale.x',sax)
        setProperty(tag..'.scale.y',say)
        setProperty(tag..'.scrollFactor.x',scx)
        setProperty(tag..'.scrollFactor.y',scy)
        if tag == 'mini' then
                addAnimationByPrefix(tag,'idle','femboy', 24, false)
        end
        if tag == 'mordecai' then
                addAnimationByPrefix(tag,'idle','jacob', 24, false)
                objectPlayAnimation(tag,'idle')
        end
        setProperty(tag..'.alpha',0)
        addLuaSprite(tag)
        doTweenAlpha(tag..'Alpha',tag,1,1.5)
end

local walked = false
local walkingRight = true
local stopWalkTimer = 0
function onBeatHit()
        objectPlayAnimation('mini','idle')
        objectPlayAnimation('mordecai','idle')
end

function onUpdate(elapsed)
        if mustHitSection then
                setProperty('camFollow.x',788.96)
                setProperty('camFollow.y',475.95)
        else
                if dadName == 'bosip' then
                        setProperty('camFollow.x',536.63)
                        setProperty('camFollow.y',300.94)
                end
        end
end