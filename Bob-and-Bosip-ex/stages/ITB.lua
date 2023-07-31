local icon = 'ash'
function onCreate()
        createstagepicture('bg17','ITB/Layer 5',-701,-300,1,1,0.3,0.3,false)
        createstagepicture('bg16','ITB/Layer 4',-701,-300,1,1,0.4,0.4,false)
        createstagepicture('bg15','ITB/Layer 3',-701,-300,1,1,0.6,0.6,false)
        createstagepicture('bg14','ITB/Layer 2',-701,-300,1,1,0.7,0.7,false)
        createstagepicture('bg1','ITB/Layer 1 (back tree)',-701,-300,1,1,0.7,0.7,false)
        createstagepicture('bg13','ITB/Layer 1 (Tree)',-701,-300,1,1,1,1,false)
        createstagepicture('bg4','ITB/Layer 1 (flower and grass)',-701,-300,1,1,1,1,false)
        createstagepicture('bg9','ITB/Layer 1 (light 1)',-701,-300,1,1,0.8,0.8,true)
        createstagepicture('bg10','ITB/Layer 1 (Light 2)',-701,-300,1,1,0.8,0.8,true)
        createstagepicture('bg5','ITB/Layer 1 (Grass 2)',-701,-300,1,1,1,1,false)

        createstagepicture('bg8','ITB/Layer 1 (Lamp)',-701,-300,1,1,1,1,false)
        createstagepicture('bg6','ITB/Layer 1 (Grass)',-701,-300,1,1,1,1,false)
        createstagepicture('bg7','ITB/Layer 1 (Ground)',-701,-300,1,1,1,1,false)
        if songName == 'Yap Squad' or songName == 'Intertwined' then
                createstagechara('mini','ITB/itb_crowd_back',-571,-68,0.55,0.55,1,1)
        end
        if songName == 'Conscience' or songName == 'Yap Squad' or songName == 'Intertwined' then
                createstagechara('mordecai','ITB/itb_crowd_middle',-1531,-230,0.6,0.6,1,1)
        end
        if songName == 'Yap Squad' then
                createstagechara('cerberus','characters/extra/Cerberus',-200, 400,1,1,1,1)
        end
        if songName == 'Intertwined' then
                createstagechara('girlfriend','characters/GF_assets',400, 150,1,1,1,1)
        end
        --createstagechara('mordecai','ITB/bluskystv',130,160,0.4,0.4,0.6,0.6)
end
function onCreatePost()
        if songName == 'Intertwined' then
                triggerEvent('Change Character',2,'cerbera')
                setProperty('gf.x', 0)
                setProperty('gf.y', 520)
        else
                triggerEvent('Change Character',2,'gf')
        end
        setProperty('boyfriend.alpha',0)
        setProperty('dad.alpha',0)
        setProperty('gf.alpha',0)
        if songName == 'Yap Squad' then
                setObjectOrder('cerberus',getObjectOrder('gfGroup')+1)
                setObjectOrder('dadGroup',getObjectOrder('gfGroup')+2)
        end
        doTweenAlpha('bfAlpha','boyfriend',1,1.5)
        doTweenAlpha('dadAlpha','dad',1,1.5)
        doTweenAlpha('gfAlpha','gf',1,1.5)
        for i = 0, getProperty('unspawnNotes.length')-1 do
                if GetUnSpawn( i, 'noteType')=='cerb' or GetUnSpawn( i, 'noteType')=='duet' then 
                        --setPropertyFromGroup('unspawnNotes', i, 'texture', '')
                        setPropertyFromGroup('unspawnNotes', i, 'gfNote',true)
                end
        end
end

function GetUnSpawn(id,var)
        return getPropertyFromGroup('unspawnNotes', id, var)
end

function createstagepicture(tag,image,x,y,sax,say,scx,scy,visib)
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
        if visib == false then
                doTweenAlpha(tag..'Alpha',tag,1,1.5)
        end
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
                addAnimationByPrefix(tag,'idle','itb_crowd_back', 24, false)
        end
        if tag == 'mordecai' then
                addAnimationByPrefix(tag,'idle','itb_crowd_middle', 24, false)
                objectPlayAnimation(tag,'idle')
        end
        if tag == 'cerberus' then
                addAnimationByPrefix(tag,'idle','Cerberus idle', 24, false)
                addAnimationByPrefix(tag,'left','Cerberus Sing Note LEFT', 24, false)
                addAnimationByPrefix(tag,'down','Cerberus Sing Note DOWN', 24, false)
                addAnimationByPrefix(tag,'up','Cerberus Sing Note UP', 24, false)
                addAnimationByPrefix(tag,'right','Cerberus Sing Note RIGHT', 24, false)
        end
        if tag == 'girlfriend' then
                addAnimationByIndices(tag,'danceLeft','GF Dancing Beat',"30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14",24)
                addAnimationByIndices(tag,'danceRight','GF Dancing Beat',"15,16,17,18,19,20,21,22,23,24,25,26,27,28,29",24)
        end
        setProperty(tag..'.alpha',0)
        addLuaSprite(tag)
        doTweenAlpha(tag..'Alpha',tag,1,1.5)
end

function onBeatHit()
        if songName == 'Yap Squad' or songName == 'Intertwined' then
                objectPlayAnimation('mini','idle')
        end
        if songName == 'Conscience' or songName == 'Yap Squad' or songName == 'Intertwined' then
                objectPlayAnimation('mordecai','idle')
        end
        if songName == 'Yap Squad' then
                if curBeat % 2 == 0 then
                        objectPlayAnimation('cerberus','idle')
                end
        end
        if songName == 'Intertwined' then
                if curBeat % 2 == 0 then
                        objectPlayAnimation('girlfriend','danceRight')
                end
                if curBeat % 2 == 1 then
                        objectPlayAnimation('girlfriend','danceLeft')
                end
        end
end

function opponentNoteHit(noteID, noteData, noteType, isSustainNote)
        if noteType == 'drop' then
                if dadName == 'bluskys' then
                        triggerEvent('Play Animation','drop','dad')
                end
        end
        if noteType == 'cerb' then
                if icon == 'ash' then
                        icon = 'cerb'
                        if gfName == 'cerbera' then
                                runHaxeCode([[
                                        game.iconP2.changeIcon('cerberaandash');
                                ]])
                                if boyfriendName == 'bf' then
                                        setHealthBarColors('000000','31B0D1')--Use : http://www.cc.kyoto-su.ac.jp/~shimizu/MAKE_HTML/rgb2.html
                                end
                        end
                end
        end
        if noteType == 'duet' then
                if gfName == 'cerbera' then
                        if dadName == 'ash' then
                                if icon == 'cerb' then
                                        runHaxeCode([[
                                                game.iconP2.changeIcon('ashduetcerbera');
                                        ]])
                                end
                                if boyfriendName == 'bf' then
                                        setHealthBarColors('7D7D7D','31B0D1')--Use : http://www.cc.kyoto-su.ac.jp/~shimizu/MAKE_HTML/rgb2.html
                                end
                                icon = 'ashandcerb'
                        end
                        if difficulty <= 2 then
                                anim={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
                        end
                        triggerEvent('Play Animation',anim[noteData+1],'dad')
                end
        end
end

function onUpdate(elapsed)
        if mustHitSection then
                setProperty('camFollow.x',626.31)
                setProperty('camFollow.y',420.96)
        else
                setProperty('camFollow.x',272.43)
                setProperty('camFollow.y',420.96)
        end
end

function onUpdatePost(elapsed)
        if songName == 'Yap Squad' then
                if getProperty('cerberus.animation.curAnim.name') == 'idle' then
                        setProperty('cerberus.offset.x',0)
                        setProperty('cerberus.offset.y',0)
                elseif getProperty('cerberus.animation.curAnim.name') == 'left' then
                        setProperty('cerberus.offset.x',-81)
                        setProperty('cerberus.offset.y',9)
                elseif getProperty('cerberus.animation.curAnim.name') == 'down' then
                        setProperty('cerberus.offset.x',-36)
                        setProperty('cerberus.offset.y',9)
                elseif getProperty('cerberus.animation.curAnim.name') == 'up' then
                        setProperty('cerberus.offset.x',-86)
                        setProperty('cerberus.offset.y',27)
                elseif getProperty('cerberus.animation.curAnim.name') == 'right' then
                        setProperty('cerberus.offset.x',-90)
                        setProperty('cerberus.offset.y',10)
                end
        end
end

function onEvent(eventName, value1, value2)
        if eventName == 'wolf' then
                runTimer('endwolf',0.46)
                runHaxeCode([[
                        game.iconP2.changeIcon('cerberus');
                ]])
                local wolfanim = getRandomInt(1,mania+1)
                local bfmissanim = getRandomInt(1,mania+1)
                if mania == 3 then
                        wolf={'left', 'down', 'up', 'right'}
                        miss={'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'}
                end
                triggerEvent('Play Animation',miss[bfmissanim],'bf')
                objectPlayAnimation('cerberus',wolf[wolfanim],true)
                if boyfriendName == 'bf' then
                        setHealthBarColors('F3F1DC','31B0D1')--Use : http://www.cc.kyoto-su.ac.jp/~shimizu/MAKE_HTML/rgb2.html
                end
        end
end

function onTimerCompleted(tag, loops, loopsLeft)
        if tag == 'endwolf' then
                runHaxeCode([[
                        game.iconP2.changeIcon(game.dad.healthIcon);
                ]])
                if boyfriendName == 'bf' and dadName == 'jghost' then
                        setHealthBarColors('D24545','31B0D1')--Use : http://www.cc.kyoto-su.ac.jp/~shimizu/MAKE_HTML/rgb2.html
                end
        end
end