local splitCamMode = false
function onCreate()
        createstagepicture('bg1','night/BG1',-970,-580,0.8,0.8,0.3,0.3)
        createstagepicture('bg2','night/BG2',-1240,-650,0.5,0.5,0.6,0.6)
        createstagechara('mini','night/bobsip',818,189,0.5,0.5,0.6,0.6)
        createstagepicture('bg3','night/BG3',-630,-330,0.8,0.8,1,1)
        createstagepicture('bg4','night/BG4',-1390,-740,0.6,0.6,1,1)
        createstagechara('bg5','night/pixelthing',-34,90,1.4,1.4,1,1)
        createstagechara('pc','characters/extra/pc',115,166,1,1,1,1)
        createcamHUD('are','areyouready/are')
        createcamHUD('you','areyouready/you')
        createcamHUD('ready','areyouready/ready')
end
function onCreatePost()
        triggerEvent('Change Character',2,'gf')
        setProperty('boyfriend.alpha',0)
        setProperty('dad.alpha',0)
        setProperty('gf.alpha',0)
        doTweenAlpha('bfAlpha','boyfriend',1,1.5)
        doTweenAlpha('dadAlpha','dad',1,1.5)
        doTweenAlpha('gfAlpha','gf',1,1.5)
        for i = 0, getProperty('unspawnNotes.length')-1 do
                if GetUnSpawn( i, 'noteType')=='are' or GetUnSpawn( i, 'noteType')=='you'
                or GetUnSpawn( i, 'noteType')=='ready'or GetUnSpawn( i, 'noteType')=='drop' then
                        setPropertyFromGroup('unspawnNotes', i, 'visible',false)
                        setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
        end
end

function GetUnSpawn(id,var)
        return getPropertyFromGroup('unspawnNotes', id, var)
end

function createcamHUD(tag,image)
        makeLuaSprite(tag,image,0,0)
        setObjectCamera(tag,'hud')
        setProperty(tag..'.scale.x',1)
        setProperty(tag..'.scale.y',1)
        setProperty(tag..'.scrollFactor.x',1)
        setProperty(tag..'.scrollFactor.y',1)
        setProperty(tag..'.visible',false)
        addLuaSprite(tag,true)
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
                addAnimationByPrefix(tag,'idle','bobsip', 24, false)
        end
        if tag == 'bg5' then
                addAnimationByPrefix(tag,'idle','pixelthing', 24, true)
        end
        if tag == 'pc' then
                addAnimationByPrefix(tag,'idle','PC idle', 24, true)
                addAnimationByPrefix(tag,'left','PC Note LEFT', 24, true)
                addAnimationByPrefix(tag,'down','PC Note DOWN', 24, true)
                addAnimationByPrefix(tag,'up','PC Note UP', 24, true)
                addAnimationByPrefix(tag,'right','PC Note RIGHT', 24, true)
        end
        setProperty(tag..'.alpha',0)
        addLuaSprite(tag)
        doTweenAlpha(tag..'Alpha',tag,1,1.5)
end
function onBeatHit()
        objectPlayAnimation('mini','idle')
end

function onUpdate(elapsed)
        if not splitCamMode then
                if mustHitSection then
                        setProperty('camFollow.x',790.36)
                        setProperty('camFollow.y',480.91)
                else
                        if dadName == 'amor' then
                                setProperty('camFollow.x',295.92)
                                setProperty('camFollow.y',447.52)
                        end
                end
        else
                setProperty('camFollow.x',600.92)
                setProperty('camFollow.y',447.52)
        end
        
        if(getProperty('dad.animation.curAnim.name') == 'idle') then
                objectPlayAnimation('pc','idle')
        else
                if(getProperty('dad.animation.curAnim.name') == 'singLEFT') then
                        objectPlayAnimation('pc','left')
                elseif(getProperty('dad.animation.curAnim.name') == 'singDOWN') then
                        objectPlayAnimation('pc','down')
                elseif(getProperty('dad.animation.curAnim.name') == 'singUP') then
                        objectPlayAnimation('pc','up')
                elseif(getProperty('dad.animation.curAnim.name') == 'singRIGHT') then
                        objectPlayAnimation('pc','right')
                end
        end
end

function opponentNoteHit(noteID, noteData, noteType, isSustainNote)
        if noteType == 'are' then
                setProperty('are.visible',true)
        elseif noteType == 'you' then
                setProperty('you.visible',true)
        elseif noteType == 'ready' then
                setProperty('ready.visible',true)
        elseif noteType == 'drop' then
                if dadName == 'amor' then
                        triggerEvent('Play Animation','drop','dad')
                end
                triggerEvent('Add Camera Zoom','0.030','0.04')
        else
        end
end

function onSectionHit()
        if getProperty('ready.visible') == true then
                setProperty('are.visible',false)
                setProperty('you.visible',false)
                setProperty('ready.visible',false)
        end
end