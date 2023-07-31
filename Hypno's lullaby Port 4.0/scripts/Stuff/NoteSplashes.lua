function onCreate()
    if getPropertyFromClass('PlayState','isPixelStage') then
        Path='UI/pixel/splash-'
        Division={width=4,height=8}
        if songPath=='brimstone' then
            Path=Path..'brimstone'
        else
            Path=Path..'pixel'
        end
    else
        Path='UI/normal/noteSplashes'
        Division={width=8,height=5}
    end
    --debugPrint(Path)
end
function MakeSplashes(noteData,suffix)
    if noteData>3 then return end
    if suffix==nil then
        suffix=''
    end
    local Tag='Splashes'..noteData..hits
    makeLuaSprite(Tag,Path..suffix,0,0)
    loadGraphic(Tag,Path..suffix,getProperty(Tag..'.width')/Division.width,getProperty(Tag..'.height')/Division.height)
    local AnimFrame={}
    local Random=getRandomInt(-1,1,'-1')
    
    if getPropertyFromClass('PlayState','isPixelStage') then
        for i=0,7 do
            table.insert(AnimFrame,noteData+i*4)
        end
        setProperty(Tag..'.antialiasing',false)
        if stringEndsWith(Path,'brimstone') then
            scaleObject(Tag,getPropertyFromClass('PlayState','daPixelZoom')*0.5,getPropertyFromClass('PlayState','daPixelZoom')*0.5)
        else
            scaleObject(Tag,getPropertyFromClass('PlayState','daPixelZoom'),getPropertyFromClass('PlayState','daPixelZoom'))
        end
        
    else
        for i=0,4 do
            table.insert(AnimFrame,noteData*2+i*8+Random)
        end
    end
    addAnimation(Tag,'Splash',AnimFrame,24,false)
    playAnim(Tag,'Splash',true)
    setObjectCamera(Tag,'hud')
    addLuaSprite(Tag,true)
    setProperty(Tag..'.x',getPropertyFromGroup('playerStrums',noteData,'x')+getPropertyFromGroup('playerStrums',noteData,'width')/2-getProperty(Tag..'.width')/2)
    setProperty(Tag..'.y',getPropertyFromGroup('playerStrums',noteData,'y')+getPropertyFromGroup('playerStrums',noteData,'height')/2-getProperty(Tag..'.height')/2)
    runHaxeCode([[
        game.getLuaObject("]]..Tag..[[").animation.finishCallback = function(name:String) 
		{
            if(name=="Splash")
            {
                game.getLuaObject("]]..Tag..[[").destroy();
			    game.modchartSprites.remove("]]..Tag..[[");
            }
		}
    ]])
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote and getPropertyFromGroup('notes',membersIndex,'rating')=='sick' then
        if songPath=='amusia' and not getDataFromSave('HypnosPref','Hell mode',false) then
            --MakeSplashes(noteData,'')
        elseif songPath~='amusia' then
            --MakeSplashes(noteData,'')
        end
        
    end
end
function onCreatePost()
    initSaveData('HypnosPref')
    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled',true)  
     end
end