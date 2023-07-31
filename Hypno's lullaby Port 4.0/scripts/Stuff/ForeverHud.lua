local Size=18
function onCreate()
    IsBuried=songName=='Brimstone'
    if IsBuried then
        Size=24
    end
    initSaveData('HypnosPref')
    
    
    if IsBuried then 
        makeLuaText('Version','Psych Engine v'..version,0,0,screenHeight-30)
        setTextFont('Version','poke.ttf') 
        setTextBorder('Version',1,'000000')
    else
        makeLuaText('Version','Psych Engine v'..version,0,0,5)
    end
    setTextSize('Version',Size)
    setObjectCamera('Version','hud')
    setProperty('Version.x',screenWidth-getProperty('Version.width')-5)
    addLuaText('Version')
    local Difficulty=difficultyName
    if getDataFromSave('HypnosPref','Pussy mode',false) then
        Difficulty='Pussy'
    elseif getDataFromSave('HypnosPref','Hell mode',false) then
        Difficulty='Hell'
    end
    if IsBuried then
        makeLuaText('Songname','- '..songName..' '..Difficulty..' -',0,0,screenHeight-30)
        setTextFont('Songname','poke.ttf')
        setTextBorder('Songname',1,'000000')
    else 
        makeLuaText('Songname','- '..songName..' ['..Difficulty..'] -',0,0,(screenHeight / 24) - 24)
        
    end

    setTextSize('Songname',24)
    screenCenter('Songname','x')
    
    setObjectCamera('Songname','hud')
    addLuaText('Songname')
    if downscroll or IsBuried then
        setProperty('Songname.y',screenHeight- 30)
    end
    
end
local scoreRating = { 
    {Rank="S+",Accur=100}, 
    {Rank="S",Accur= 95}, 
    {Rank="A",Accur= 90}, 
    {Rank="b",Accur= 85}, 
    {Rank="c",Accur= 80}, 
    {Rank="d",Accur= 75}, 
    {Rank="e",Accur= 70}, 
    {Rank="f",Accur= 65}
}
function onCreatePost()
    Divider=' • '
    if IsBuried then
        Divider=' - '
        
    end
    makeLuaText('Score','Score: '..score,0,getProperty('scoreTxt.x'),getProperty('scoreTxt.y'))
    setTextSize('Score',Size)
    setTextBorder('Score',1.5,'000000')
    setObjectCamera('Score','hud')
    addLuaText('Score')
    makeLuaText('Accuary',Divider..'Accuracy: '..ToPercent(rating*100,2)..'%'..Divider,0,getProperty('Score.x')+getProperty('Score.width'),getProperty('scoreTxt.y'))
    setTextSize('Accuary',Size)
    setTextBorder('Accuary',1.5,'000000')
    setObjectCamera('Accuary','hud')
    addLuaText('Accuary')
    makeLuaText('MissRank','Combo Breaks: '..misses..Divider..'Rank: '..GetRank(),0,getProperty('Accuary.x')+getProperty('Accuary.width'),getProperty('scoreTxt.y'))
    setTextSize('MissRank',Size)
    setTextBorder('MissRank',1.5,'000000')
    setObjectCamera('MissRank','hud')
    addLuaText('MissRank')
    if IsBuried then
        setTextFont('Score','poke.ttf')
        setTextFont('Accuary','poke.ttf')
        setTextFont('MissRank','poke.ttf')
    end

    local TotalWidth=0
    local ScoreTexts={'Score','Accuary','MissRank'}
    for i=1,#ScoreTexts do
        TotalWidth=TotalWidth+getProperty(ScoreTexts[i]..'.width')
    end
    for i=1,#ScoreTexts do
        setProperty(ScoreTexts[i]..'.x',(screenWidth/2)-(TotalWidth/2))
        if i>1 then
            setProperty(ScoreTexts[i]..'.x',getProperty(ScoreTexts[i-1]..'.x')+getProperty(ScoreTexts[i-1]..'.width'))
        end
    end
    if botPlay then
        local More=0
        if downscroll then
            More=screenHeight-200
        end
        setProperty('botplayTxt.y',75+More)
    end
end
function GetRank()
    local Rank='f'
    for i=1,#scoreRating do
        if scoreRating[i].Accur<=ToPercent(rating*100,2) then
            Rank=scoreRating[i].Rank
            break
        end
    end
    return string.upper(Rank)
end
function onUpdateScore(miss)
    if luaTextExists('Score') then
        setTextString('Score','Score: '..score)
        if IsBuried then
            setTextString('Accuary',Divider..'Accuracy: '..ToPercent(rating*100,2)..'% '..ratingFC..Divider)
            if ratingFC=='' then
                setTextString('Accuary',Divider..'Accuracy: '..ToPercent(rating*100,2)..'%'..Divider)
            end
        else
            setTextString('Accuary',Divider..'Accuracy: '..ToPercent(rating*100,2)..'% ['..ratingFC..']'..Divider)
            if ratingFC=='' then
                setTextString('Accuary',Divider..'Accuracy: '..ToPercent(rating*100,2)..'%'..Divider)
            end
        end
        
        
        local Rank=GetRank()
        setTextString('MissRank','Combo Breaks: '..misses..Divider..'Rank: '..Rank)
        local TotalWidth=0
        local ScoreTexts={'Score','Accuary','MissRank'}
        for i=1,#ScoreTexts do
            TotalWidth=TotalWidth+getProperty(ScoreTexts[i]..'.width')
        end
        for i=1,#ScoreTexts do
            setProperty(ScoreTexts[i]..'.x',(screenWidth/2)-(TotalWidth/2))
            setProperty(ScoreTexts[i]..'.y',getProperty('scoreTxt.y'))
            if i>1 then
                setProperty(ScoreTexts[i]..'.x',getProperty(ScoreTexts[i-1]..'.x')+getProperty(ScoreTexts[i-1]..'.width'))
            end
        end
    end

end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    onUpdateScore(false)
end
function ToPercent(value, decimals)
    if decimals < 1 then
		return math.floor(value)
    end
    
	local tempMult = 1* 10 *decimals

	local newValue = math.floor(value * tempMult)
	return newValue / tempMult
end
function onUpdate(elapsed)

    setProperty('timeBar.alpha',0)
    setProperty('timeTxt.visible',false)
    setProperty('scoreTxt.visible',false)
    local Difficulty=difficultyName
    if getDataFromSave('HypnosPref','Pussy mode',false) then
        Difficulty='Pussy'
    elseif getDataFromSave('HypnosPref','Hell mode',false) then
        Difficulty='Hell'
    end
    if IsBuried then
        setTextString('Songname','- '..getProperty('songName')..' '..Difficulty..' -')
    else
        setTextString('Songname','- '..getProperty('songName')..' ['..Difficulty..'] -')
    end
end