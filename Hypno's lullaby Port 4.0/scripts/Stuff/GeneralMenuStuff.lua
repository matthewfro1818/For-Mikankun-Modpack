local AlphabetTags={}
function MakeAlphabet(Tag,Text,X,Y,alignment,Scale,isMenu)
    addHaxeLibrary('Alphabet')
    runHaxeCode([[
        var NewAlphabet:Alphabet = new Alphabet(]]..X..[[, ]]..Y..[[,"]]..Text..[[",true);
        NewAlphabet.setAlignmentFromString("]]..alignment..[[");
        game.add(NewAlphabet);
        NewAlphabet.cameras=[game.camOther];
        NewAlphabet.changeY=false;
        setVar("]]..Tag..[[",NewAlphabet);
        //game.addTextToDebug("TextADDED",]]..getColorFromHex('FFFFFF')..[[);
    ]])
    setProperty(Tag..'.isMenuItem',isMenu)
    if isMenu then
    table.insert(AlphabetTags,Tag)
    end
    
end
function OpenState(State)  
    loadSong(State,0)
end
function LoadMenu()
    loadSong("hypnos-lullaby-v2-port",0)
end
function LoadWeek(Week,song)
    if checkFileExists('weeks/'..Week..'.txt') then
        local week=stringSplit(getTextFromFile('weeks/'..Week..'.txt'),',')
        if song==nil then song=1 end
        runTimer('EmergencyTimer',4,2)
        loadSong(week[song])
    else
        runHaxeCode([[
            game.addTextToDebug("Week not found",]]..getColorFromHex('FF0000')..[[);
        ]])
        runTimer('Reset',1)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='Reset' then
        restartSong()
    end
end
function onStartCountdown()
    return Function_Stop
end
function onPause()
    return Function_Stop
end
function onCreate()
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    runHaxeCode([[
        Application.current.window.title="Friday Night Funkin': Hypno's Lullaby Port";
        var Icon:Image=Image.fromFile(Paths.modFolders('images/window_icon/hypnos/icon32.png'));
        Application.current.window.setIcon(Icon);
    ]])
end
--{tag='Pause',scale=1,x=0,y=0,text='',alig='center',Letter={'numLetter','numLetter','numLetter'}}
