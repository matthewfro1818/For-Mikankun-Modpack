function onCreate()
        createstagepicture('bg1','day/BG1',-970,-580,0.8,0.8,0.3,0.3)
        createstagepicture('bg2','day/BG2',-1240,-650,0.6,0.6,0.6,0.6)
        createstagechara('mini','day/mini',849,189,0.4,0.4,0.6,0.6)
        createstagechara('mordecai','day/bluskystv',130,160,0.4,0.4,0.6,0.6)
        createstagepicture('bg3','day/BG3',-630,-330,0.8,0.8,1,1)
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
                addAnimationByPrefix(tag,'idle','mini', 24, false)
        end
        if tag == 'mordecai' then
                addAnimationByIndices(tag,'walk1','bluskystv', "29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13", 24)
                addAnimationByIndices(tag,'walk2','bluskystv', "14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28", 24)
                objectPlayAnimation(tag,'walk1')
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
        if (stopWalkTimer == 0) then
                if (walkingRight) then
                        setProperty('mordecai.flipX', false)
                else
                        setProperty('mordecai.flipX', true)
                end
                if (walked) then
                        objectPlayAnimation('mordecai','walk1')
                else
                        objectPlayAnimation('mordecai','walk2')
                end
                if (walkingRight) then
                        setProperty('mordecai.x', getProperty('mordecai.x')+10)
                else
                        setProperty('mordecai.x', getProperty('mordecai.x')-10)
                end
                walked = (not walked);
                if (getProperty('mordecai.x') == 480 and walkingRight) then 
                        stopWalkTimer = 10;
                        walkingRight = false;
                elseif (getProperty('mordecai.x') == -80 and not walkingRight)then 
                        stopWalkTimer = 8;
                        walkingRight = true;
                end
        else
                stopWalkTimer=stopWalkTimer-1
        end
end

function onUpdate(elapsed)
        if mustHitSection then
                setProperty('camFollow.x',788.96)
                setProperty('camFollow.y',475.95)
        else
                if dadName == 'bob' then
                        setProperty('camFollow.x',536.63)
                        setProperty('camFollow.y',449.94)
                end
        end
end