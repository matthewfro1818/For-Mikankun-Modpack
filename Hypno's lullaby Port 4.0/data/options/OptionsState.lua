local OptionsStuff={
    "APPEARANCE",
    "EXTRA",
    "EXIT"
}
local OptionsMenu="Options"
local CurSelect=1
function onCreate()
    initSaveData('ImportantData')
    setDataFromSave('ImportantData','isTesting',false)
    flushSaveData('ImportantData')
    addHaxeLibrary('CheckboxThingie')
    addLuaScript('scripts/Stuff/GeneralMenuStuff')
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    initSaveData('HypnosPref')
    ExtraStuff={
        {tag="Hell mode",func=Check,desc='Makes everything more harder'},
        {tag="Pussy mode",func=Check,desc='Turn all the mechanics off also certifies you as a pussy'},
        {tag="Reset Data",func=Adver,desc='Erase all the data from this port'}
    }
    AppearanceStuff={
        {tag="Forever UI",func=Check,desc="Set forever UI"},
        {tag="Forever Jumgement",func=Check,desc='Set forever Jumgement'},
        {tag="Forever Splashes",func=Check,desc='Set forever  Splashes'}
    }
    MakeSprite('sleft','S',78, 120)
    MakeSprite('sright','S',916, 335)
    MakeSprite('uUnown','U',850, 50)
    MakeArrayOptions()
end
function MakeSprite(Tag,Letter,posX,posY)
    makeAnimatedLuaSprite(Tag,'menu/Options/'..Letter..' Unown',posX,posY)
    addAnimationByPrefix(Tag,'idle',Letter..' Unown', 24, true)
    setObjectCamera(Tag,'other')
    addLuaSprite(Tag)


end
function onUpdate(elapsed)
    if keyJustPressed('up') then
        if OptionsMenu=='Options' then
            setProperty(OptionsStuff[CurSelect]..'.alpha',0.7)
            if CurSelect==1 then
                CurSelect=#OptionsStuff
            else
                CurSelect=CurSelect-1
            end
            setProperty(OptionsStuff[CurSelect]..'.alpha',1)
        elseif OptionsMenu=='Extra' then
            setProperty(ExtraStuff[CurSelect].tag..'.alpha',0.7)
            if CurSelect==1 then
                CurSelect=#ExtraStuff
            else
                CurSelect=CurSelect-1
            end
            setProperty(ExtraStuff[CurSelect].tag..'.alpha',1)
        elseif OptionsMenu=='Appearance' then
            setProperty(AppearanceStuff[CurSelect].tag..'.alpha',0.7)
            if CurSelect==1 then
                CurSelect=#AppearanceStuff
            else
                CurSelect=CurSelect-1
            end
            setProperty(AppearanceStuff[CurSelect].tag..'.alpha',1)
        end
    end
    if keyJustPressed('down') then
        if OptionsMenu=='Options' then
            setProperty(OptionsStuff[CurSelect]..'.alpha',0.7)
            if CurSelect==#OptionsStuff then
                CurSelect=1
            else
                CurSelect=CurSelect+1
            end
            setProperty(OptionsStuff[CurSelect]..'.alpha',1)
        elseif OptionsMenu=='Extra' then
            setProperty(ExtraStuff[CurSelect].tag..'.alpha',0.7)
            if CurSelect==#ExtraStuff then
                CurSelect=1
            else
                CurSelect=CurSelect+1
            end
            setProperty(ExtraStuff[CurSelect].tag..'.alpha',1)
        elseif OptionsMenu=='Appearance' then
            setProperty(AppearanceStuff[CurSelect].tag..'.alpha',0.7)
            if CurSelect==#AppearanceStuff then
                CurSelect=1
            else
                CurSelect=CurSelect+1
            end
            setProperty(AppearanceStuff[CurSelect].tag..'.alpha',1)
        end
    end
    if keyJustPressed('accept') then
        if OptionsMenu=='Options' then
            if OptionsStuff[CurSelect]=='APPEARANCE' then
                OptionListAlpha(false)
                OptionsMenu='Appearance'
                CurSelect=1
                LoadOptions(AppearanceStuff)
            elseif OptionsStuff[CurSelect]=='EXTRA' then
                OptionListAlpha(false)
                OptionsMenu='Extra'
                CurSelect=1
                LoadOptions(ExtraStuff)
            elseif OptionsStuff[CurSelect]=='EXIT' then
                callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
            end
        elseif OptionsMenu=='Extra' then
            if ExtraStuff[CurSelect].tag~='Reset Data' then
                SetPref(ExtraStuff[CurSelect].tag,not getDataFromSave('HypnosPref',ExtraStuff[CurSelect].tag,false))
                setProperty(ExtraStuff[CurSelect].tag..'Check.daValue',getDataFromSave('HypnosPref',ExtraStuff[CurSelect].tag,false))
                if ExtraStuff[CurSelect].tag=='Pussy mode' and getDataFromSave('HypnosPref','Hell mode',false) then
                    setProperty('Hell mode'..'Check.daValue',not getDataFromSave('HypnosPref','Pussy mode',false))
                    SetPref('Hell mode',not getDataFromSave('HypnosPref','Pussy mode',false))
                elseif ExtraStuff[CurSelect].tag=='Hell mode' and getDataFromSave('HypnosPref','Pussy mode',false) then
                    setProperty('Pussy mode'..'Check.daValue',not getDataFromSave('HypnosPref','Hell mode',false))
                    SetPref('Pussy mode',not getDataFromSave('HypnosPref','Hell mode',false))
                end
            end

        elseif OptionsMenu=='Appearance' then
            SetPref(AppearanceStuff[CurSelect].tag,not getDataFromSave('HypnosPref',AppearanceStuff[CurSelect].tag,true))
            setProperty(AppearanceStuff[CurSelect].tag..'Check.daValue',getDataFromSave('HypnosPref',AppearanceStuff[CurSelect].tag,true))
        end
    end
    if keyJustPressed('back') then 
        if OptionsMenu=='Options' then
            callScript('scripts/Stuff/GeneralMenuStuff','LoadMenu')
        elseif OptionsMenu=='Extra' then
            CurSelect=2
            OptionListAlpha(true)
            ArrayAlpha(ExtraStuff,false)
            OptionsMenu='Options'
        elseif OptionsMenu=='Appearance' then
            CurSelect=1
            OptionListAlpha(true)
            ArrayAlpha(AppearanceStuff,false)
            OptionsMenu='Options'
        end
    end
end
function SetPref(Pref,var)
    setDataFromSave('HypnosPref',Pref,var)
    flushSaveData('HypnosPref')
end
function LoadOptions(array)
    for i=1,#array do
        callScript('scripts/Stuff/GeneralMenuStuff','MakeAlphabet',{array[i].tag,array[i].tag,screenWidth/8+i*40,80+100*i,'letf',1,true})
        if i~=1 then setProperty(array[i].tag..'.alpha',0.7) end
        array[i].func(array[i].tag)
    end
end
function ArrayAlpha(Array,alpha)
    for i=1,#Array do
        setProperty(Array[i].tag..'.visible',alpha)
        local isCheck=runHaxeCode([[ if(getVar("]]..Array[i].tag..[[Check") != null) return true; else return false; ]])
        debugPrint(isCheck)
        if isCheck then setProperty(Array[i].tag..'Check.visible',alpha) end
    end
end
function OptionListAlpha(alpha)
    for i=1,#OptionsStuff do
        setProperty(OptionsStuff[i]..'.visible',alpha)
    end
end
function MakeArrayOptions()
    for i=1,#OptionsStuff do
            callScript('scripts/Stuff/GeneralMenuStuff','MakeAlphabet',{OptionsStuff[i],OptionsStuff[i],screenWidth/2,80+100*i,'center',1,true})
        if i==CurSelect then else setProperty(OptionsStuff[i]..'.alpha',0.7) end
    end
end
function Check(Alphabet)
    runHaxeCode([[
        if(getVar("]]..Alphabet..[[Check") == null){
        var NewCheckBox:CheckboxThingie= new CheckboxThingie(0,0);
        game.add(NewCheckBox);
        NewCheckBox.cameras=[game.camOther];
        NewCheckBox.sprTracker = getVar("]]..Alphabet..[[").letters[0];
        NewCheckBox.offsetY=-40;
        NewCheckBox.offsetX=0;
        setVar("]]..Alphabet..[[Check",NewCheckBox);}
        else{
            getVar("]]..Alphabet..[[Check").visible =true;
            getVar("]]..Alphabet..[[Check").sprTracker = getVar("]]..Alphabet..[[").letters[0];
        }
    ]])
    setProperty(Alphabet..'Check.daValue',getDataFromSave('HypnosPref',Alphabet,false))
end
function Adver(Alphabet)

end
function onStartCountdown()
    return Function_Stop
end
function onPause()
    return Function_Stop
end