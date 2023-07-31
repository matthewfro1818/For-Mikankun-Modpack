function onCreate()
    precacheImage('menu/selector')
    precacheImage('menu/Pause/9slicetextbox')
    precacheImage('menu/Pause/9slicetextbox-gold')
    precacheImage('menu/Pause/9slicetextbox-shinto')
    precacheSound('LullabyPause')
    menuItems = {'RESUME','RESTART','EXIT','EXIT MOD'}
    BoxPause={}
    scaleBox={x=1,y=1}
    ScaleInBlocks={}
    Characters={}
    portraitDistance=1000
    lerpVal=16
    ogLerpVal = 12.8
    grpText={}
    Suffix={left='',right=''}
    CanPause=true

end
function ChangeSuffix(Portrair,NewSuffix)
    Suffix[Portrair]=NewSuffix
end
local isDead=false
function onGameOver()
    isDead=true
end
function onPause()
    if CanPause and not isDead then
    openCustomSubstate('CustomPause',true)
    
    end
    return Function_Stop
end
function addLuaSpriteSubstate(tag)
    runHaxeCode([[
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
   ]])
end
function onCustomSubstateCreate(name)
    if name=='CustomPause' then
        CurSelecter=1
        opening=true
        closing=false
        local SongPath=string.gsub(string.lower(getPropertyFromClass('PlayState','SONG.song'))," ", "-")
        --debugPrint('pause/'..SongPath..'/left'..Suffix['left'])
        Characters['left']='pause/'..SongPath..'/left'..Suffix['left']
        Characters['right']='pause/'..SongPath..'/right'..Suffix['right']
        makeLuaSprite('OverlayPause',nil,0,0)
        makeGraphic('OverlayPause',screenWidth,screenHeight,'000000')
        setProperty('OverlayPause.alpha',0)
        addLuaSpriteSubstate('OverlayPause')
        makeLuaSprite('portairtLeft',Characters['left'],-portraitDistance,0)
        addLuaSpriteSubstate('portairtLeft')
        makeLuaSprite('portairtRight',Characters['right'],screenWidth+portraitDistance,0)
        addLuaSpriteSubstate('portairtRight')
        MakePauseBox(8,5)
        UpdateScaleBox(1,1)
        makeLuaSprite('Selector','menu/selector',0,0)
        scaleObject('Selector',4,4)
        setProperty('Selector.antialiasing',false)
        addLuaSpriteSubstate('Selector')
        if not checkFileExists('images/'..Characters['left']..'.png') then
            setProperty('portairtLeft.visible',false)
        end
        if not checkFileExists('images/'..Characters['right']..'.png') then
            setProperty('portairtRight.visible',false)
        end
        for i=1, #menuItems do

            grpText[i]=menuItems[i]
            makeLuaText(menuItems[i],menuItems[i],16 * 8,0,0)
            setTextFont(menuItems[i],'poketext.ttf')
            setTextBorder(menuItems[i],-0.1,'000000')
            setTextSize(menuItems[i],8)
            setTextColor(menuItems[i],'000000')
            screenCenter(menuItems[i],'xy')
            setTextAlignment(menuItems[i],'left')
			addLuaTextSubstate(menuItems[i])
		end
        playSound('LullabyPause',0.5,'PauseMusic')
    else
        CanPause=false
    end
end
function onCustomSubstateUpdate(name, elapsed)
    local portraitLerp=12
    local resize=6
    if name=='CustomPause' then
        local fakeElapsed = Clamp(elapsed, 0, 1)
		if fakeElapsed > 0 then
			if not closing then
                setProperty('OverlayPause.alpha',Lerp(getProperty('OverlayPause.alpha'), 0.6, fakeElapsed * ogLerpVal))
                setProperty('portairtLeft.x',Lerp(getProperty('portairtLeft.x'), 0, fakeElapsed * portraitLerp))
                setProperty('portairtLeft.alpha',Lerp(getProperty('portairtLeft.alpha'), 1, fakeElapsed * portraitLerp))
                setProperty('portairtRight.x',Lerp(getProperty('portairtRight.x'), 560, fakeElapsed * portraitLerp))
                setProperty('portairtRight.alpha',Lerp(getProperty('portairtRight.alpha'), 1, fakeElapsed * portraitLerp))
			else 
                setProperty('OverlayPause.alpha',Lerp(getProperty('OverlayPause.alpha'),0, fakeElapsed * ogLerpVal))
                setProperty('portairtLeft.x',Lerp(getProperty('portairtLeft.x'), -portraitDistance, fakeElapsed * portraitLerp/2))
                setProperty('portairtLeft.alpha',Lerp(getProperty('portairtLeft.alpha'), 0, fakeElapsed * portraitLerp))
                setProperty('portairtRight.x',Lerp(getProperty('portairtRight.x'), portraitDistance, fakeElapsed * portraitLerp/2))
                setProperty('portairtRight.alpha',Lerp(getProperty('portairtRight.alpha'), 0, fakeElapsed * portraitLerp))
            end

			if opening then
			
				lerpVal=lerpVal*1.05
				if scaleBox['x']>= 5 then
				
					lerpVal = ogLerpVal / 1.5;
					resize = 4;
					opening = false;
                end
                UpdateScaleBox(Lerp(scaleBox['x'], resize, fakeElapsed * lerpVal),Lerp(scaleBox['y'], resize, fakeElapsed * lerpVal * 2))
            else
                if closing then
                    lerpVal=lerpVal* 1.05;
                    resize = 0
                    if scaleBox['x']<= 0.5 then
                        closing=false
                        closeCustomSubstate()
                    end
                end
                if closing then
                    UpdateScaleBox(Lerp(scaleBox['x'], resize, fakeElapsed * lerpVal* 2),Lerp(scaleBox['y'], resize, fakeElapsed * lerpVal))
                else
                    UpdateScaleBox(Lerp(scaleBox['x'], resize, fakeElapsed * lerpVal),Lerp(scaleBox['y'], resize, fakeElapsed * lerpVal * 2))
                end
			end


        end
        
    end
end
function onCustomSubstateUpdatePost(name, elapsed)
    if name=='CustomPause' then
        for i=1, #grpText do
			local text = grpText[i]
            scaleObject(text,scaleBox['x']-1.25,scaleBox['y']/1.25)
            screenCenter(text,'xy')
            setProperty(text..'.x',getProperty(text..'.x')+(ScaleInBlocks['x']*ScaleInterval*scaleBox['x'])/4+(ScaleInterval*scaleBox['x']))
            setProperty(text..'.y',getProperty(text..'.y')-(ScaleInBlocks['y']*ScaleInterval*scaleBox['y'])/4+(getProperty('Selector.scale.y')*ScaleInterval*(i-1)))
		end
        scaleObject('Selector',scaleBox['x']-1.25,scaleBox['y']/1.25)
        if keyJustPressed('accept') then
            if menuItems[CurSelecter]=='RESUME' then
                lerpVal = ogLerpVal
                closing=true
            elseif menuItems[CurSelecter]=='RESTART' then
                restartSong()
            elseif menuItems[CurSelecter]=='OPTIONS' then
                debugPrint('Yep, that do nothing')
            elseif menuItems[CurSelecter]=='EXIT' then
                callScript('scripts/Stuff/PlayStuff.lua','toMenu')
            elseif menuItems[CurSelecter]=='EXIT MOD' then
                addHaxeLibrary('Application', 'lime.app')
                addHaxeLibrary('Image','lime.graphics')
                runHaxeCode([[
                    Application.current.window.title="Friday Night Funkin': Psych Engine";
                    var Icon:Image=Image.fromFile(Paths.modFolders('images/window_icon/default/iconOG.png'));
                    Application.current.window.setIcon(Icon);
                ]])
                exitSong()
            end
        end
        if keyJustPressed('up') then
            CurSelecter=CurSelecter-1
            
        end
        if keyJustPressed('down') then
            CurSelecter=CurSelecter+1
            
        end
        if CurSelecter<1 then
            CurSelecter=#grpText
        elseif CurSelecter>#grpText then
            CurSelecter=1
        end
        setProperty('Selector.y',getProperty(grpText[CurSelecter]..'.y')+(getProperty('Selector.height')/2)-scaleBox['y'])
        setProperty('Selector.x',getProperty(grpText[CurSelecter]..'.x')-getProperty('Selector.width'))

    end
end
function onSoundFinished(tag)
    if tag=='PauseMusic' then
        playSound('LullabyPause',0.5,'PauseMusic')
    end
end
function onCustomSubstateDestroy(name)
    if name=='CustomPause' then
        UpdateScaleBox(1,1)
        stopSound('PauseMusic')
    else
        CanPause=true
    end
end
function MakePauseBox(WidthInBlock,HeightInBlock)
    local Image='9slicetextbox'
    ScaleInterval=9
    if string.lower(songName)=='monochrome' or string.lower(songName)=='frostbite' or string.lower(songName)=='insomnia' then
        Image='9slicetextbox-gold'
        ScaleInterval=10
    end
    
    for i=0,8 do
        makeLuaSprite('BoxPause'..i,nil,0,0)
        
        loadGraphic('BoxPause'..i,'menu/Pause/'..Image,ScaleInterval,ScaleInterval)
        setGraphicSize('BoxPause'..i,ScaleInterval*scaleBox['x'],ScaleInterval*scaleBox['y'])
        addAnimation('BoxPause'..i,'idle',{i},0,true)
        setProperty('BoxPause'..i..'.antialiasing',false)
        addLuaSpriteSubstate('BoxPause'..i)
        if i==1 or i==7 then
            setGraphicSize('BoxPause'..i,(WidthInBlock-2)*ScaleInterval*scaleBox['x'],ScaleInterval*scaleBox['y'])
        elseif i==3 or i==5 then
            setGraphicSize('BoxPause'..i,ScaleInterval*scaleBox['x'],(HeightInBlock-2)*ScaleInterval*scaleBox['y'])
        elseif i==4 then
            setGraphicSize('BoxPause'..i,(WidthInBlock-2)*ScaleInterval*scaleBox['x'],(HeightInBlock-2)*ScaleInterval*scaleBox['y'])
        end
        BoxPause[i+1]='BoxPause'..i
    end 
    local Width=WidthInBlock*ScaleInterval*scaleBox['x']
    local Height=HeightInBlock*ScaleInterval*scaleBox['y']
    for i=1,#BoxPause do
        setProperty(BoxPause[i]..'.x',screenWidth/2-Width/2)
        setProperty(BoxPause[i]..'.y',screenHeight/2-Height/2)
        if i~=1 and i~=4 and i~=7 then
            setProperty(BoxPause[i]..'.x',getProperty(BoxPause[i-1]..'.x')+getProperty(BoxPause[i-1]..'.width'))
        end
        if i~=1 and i~=2 and i~=3 then
            setProperty(BoxPause[i]..'.y',getProperty(BoxPause[i-3]..'.y')+getProperty(BoxPause[i-3]..'.height'))
        end
    end
    ScaleInBlocks={x=WidthInBlock,y=HeightInBlock}
end
function UpdateScaleBox(NewScaleX,NewScaleY)
    for i=0,8 do
        setGraphicSize('BoxPause'..i,ScaleInterval*NewScaleX,ScaleInterval*NewScaleY)
    if i==1 or i==7 then
        setGraphicSize('BoxPause'..i,(ScaleInBlocks['x']-2)*ScaleInterval*NewScaleX,ScaleInterval*NewScaleY)
    elseif i==3 or i==5 then
        setGraphicSize('BoxPause'..i,ScaleInterval*NewScaleX,(ScaleInBlocks['y']-2)*ScaleInterval*NewScaleY)
    elseif i==4 then
        setGraphicSize('BoxPause'..i,(ScaleInBlocks['x']-2)*ScaleInterval*NewScaleX,(ScaleInBlocks['y']-2)*ScaleInterval*NewScaleY)
    end
    end
    local Width=ScaleInBlocks['x']*ScaleInterval*NewScaleX
    local Height=ScaleInBlocks['y']*ScaleInterval*NewScaleY
    for i=1,#BoxPause do
        setProperty(BoxPause[i]..'.x',screenWidth/2-Width/2)
        setProperty(BoxPause[i]..'.y',screenHeight/2-Height/2)
        if i~=1 and i~=4 and i~=7 then
            setProperty(BoxPause[i]..'.x',getProperty(BoxPause[i-1]..'.x')+getProperty(BoxPause[i-1]..'.width'))
        end
        if i~=1 and i~=2 and i~=3 then
            setProperty(BoxPause[i]..'.y',getProperty(BoxPause[i-3]..'.y')+getProperty(BoxPause[i-3]..'.height'))
        end
    end
    scaleBox={x=NewScaleX,y=NewScaleY}

end
function addLuaTextSubstate(tag)
    runHaxeCode([[
        game.getLuaObject("]]..tag..[[",true).cameras=null;
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[[",true));
    ]])
end
function Clamp(value, min, max)
	return math.max(min, math.min(max, value))
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
 end