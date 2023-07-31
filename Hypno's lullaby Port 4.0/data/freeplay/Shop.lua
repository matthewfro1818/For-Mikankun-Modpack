local ItemList={
    "Pokemon Silver",
    "GameBoy Advanced SP",
    "Pokemon Red",
    "Lit Candle",
    "Mysterious Letter",
    "Broken Note",
    "Pasta Night Mushroom",
    "Trainer Bow",
    "Broken Vinyl"
}
local ItemDataList={}
local OwnedItems={}
function onCreate()
    --luaDebugMode=true
    initSaveData('ShopItems')
    initSaveData('UnlockData')
    initSaveData('ImportantData')
    precacheImage('menu/ShopFreeplay/selectionBox')
    precacheImage('menu/ShopFreeplay/ShopCursor')
    
    makeLuaSprite('ShopBox','menu/ShopFreeplay/selectionBox',647, 116)
    for i=1,#ItemList do
        local Path='menu/ShopFreeplay/ShopItems/'..i..ItemList[i]..'/'
        local ItemData=GetItemData(Path)
        makeAnimatedLuaSprite(ItemData.name,Path..'item',647, 116)
        addAnimationByPrefix(ItemData.name,'idle',ItemData.anim, 24, true)
        setProperty(ItemData.name..'.x',(682+ItemData.pos.lane*190)+ItemData.offset.x)
        setProperty(ItemData.name..'.y',(135+ItemData.pos.row*145)+ItemData.offset.y)
        scaleObject(ItemData.name,ItemData.scale,ItemData.scale,false)

        makeLuaText(ItemData.name..'Txt',''..ItemData.price,100,650, 116)
        setTextFont(ItemData.name..'Txt',"poke.ttf")
        setTextSize(ItemData.name..'Txt',32)
        setTextBorder(ItemData.name..'Txt',0,'FFFFFF')
        setTextAlignment(ItemData.name..'Txt','center')
        setProperty(ItemData.name..'Txt.x',(695+ItemData.pos.lane*182))
        setProperty(ItemData.name..'Txt.y',(238+ItemData.pos.row*140))
        if getDataFromSave('ShopItems',ItemData.name..'Owned',false) then
            setTextString(ItemData.name..'Txt','OWNED')
            setTextColor(ItemData.name..'Txt','808080')
            if #getDataFromSave('ShopItems','BoughtItems',{})<1 then
                table.insert(OwnedItems,ItemData.name)
            else
                OwnedItems=getDataFromSave('ShopItems','BoughtItems',{})
            end
        end
        table.insert(ItemDataList,ItemData)
    end
    if #getDataFromSave('ShopItems','BoughtItems',{})<1 then
        setDataFromSave('ShopItems','BoughtItems',OwnedItems)
    end
    flushSaveData('ShopItems')
    makeAnimatedLuaSprite('ShopHand','menu/ShopFreeplay/ShopCursor',647, 116)
    addAnimationByPrefix('ShopHand','idle','ShopCursor instance 1',24,true)
    scaleObject('ShopHand',0.75,0.75)
    
end
local Data={
    "Name",
    "Price",
    "AnimName",
    "DataUnlock",
    "SongDesc",
    "DataRequirements",
    "OffsetX",
    "OffsetY",
    "Lane",
    "Row",
    "Scale"
}
--[[
    name
    price
    anim
    data.unlock
    desc
    data.requi
    offset.x
    offset.y
    pos.lane
    pos.row
    scale
]]
function GetItemData(path)
    local ItemData=getTextFromFile('images/'..path..'data.txt')
    local Item={}
    for i=1,#Data do
        local Get=stringTrim(stringSplit(stringSplit(ItemData,Data[i]..':')[2],'\n')[1])     
        table.insert(Item,Get)
    end
    Item={name=Item[1],price=Item[2],anim=Item[3],data={unlock=Item[4],requi=Item[6]},desc=Item[5],offset={x=tonumber(Item[7]),y=tonumber(Item[8])},pos={lane=tonumber(Item[9]),row=tonumber(Item[10])},scale=tonumber(Item[11])}
    return Item
end
local IsOpening=false
function onCustomSubstateCreate(name)
    if name=='Shop' then
        IsOpening=true
        addLuaSpriteSubstate('ShopBox')

        for i=1,#ItemDataList do
            addLuaSpriteSubstate(ItemDataList[i].name)
            addLuaTextSubstate(ItemDataList[i].name..'Txt')
        end

        addLuaSpriteSubstate('ShopHand')
        UpdateSelection()
    end
end
local Pos={lane=0,row=0}

function onCustomSubstateUpdate(name, elapsed)
    if name=='Shop' then
        --debugPrint(Pos)
        if keyJustPressed('left') then
            Pos.lane=Pos.lane-1
            UpdateSelection()
        elseif keyJustPressed('down') then
            Pos.row=Pos.row+1
            UpdateSelection()
        elseif keyJustPressed('up') then
            Pos.row=Pos.row-1
            UpdateSelection()
        elseif keyJustPressed('right') then
            Pos.lane=Pos.lane+1
            UpdateSelection()
        elseif keyJustPressed('accept') and not IsOpening then
            BuyThing()
        elseif keyJustPressed('back') then
            removeLuaSpriteSubstate('ShopBox')
            for i=1,#ItemDataList do
                removeLuaSpriteSubstate(ItemDataList[i].name)
                removeLuaTextSubstate(ItemDataList[i].name..'Txt')
            end
            removeLuaSpriteSubstate('ShopHand')
            setTextString('currencyText',getDataFromSave('ImportantData','Money',0))
            setTextColor('currencyText','000000')
            closeCustomSubstate()
        end
        IsOpening=false
    end
end
local IsConfirm=false
local WantBuy=''
function BuyThing()
    local Item={name='',id=0}
    for i=1,#ItemDataList do
        if ItemDataList[i].pos.lane==Pos.lane and ItemDataList[i].pos.row==Pos.row  then
            Item={name=ItemDataList[i].name,id=i}
        end
    end
    if not IsConfirm and WantBuy~=Item.name and tonumber(ItemDataList[Item.id].price)<=getDataFromSave('ImportantData','Money',0) and not getDataFromSave('ShopItems',Item.name..'Owned',false) then
        IsConfirm=true
        WantBuy=Item.name
        changeShopDialogue(ItemDataList[Item.id].desc)
        setTextString(Item.name..'Txt','CONFIRM?')
        return
    elseif IsConfirm and WantBuy==Item.name and tonumber(ItemDataList[Item.id].price)<=getDataFromSave('ImportantData','Money',0) and not getDataFromSave('ShopItems',Item.name..'Owned',false) then
        setDataFromSave('ImportantData','Money',getDataFromSave('ImportantData','Money',0)-tonumber(ItemDataList[Item.id].price))
        flushSaveData('ImportantData')
        table.insert(OwnedItems,Item.name)
        setDataFromSave('ShopItems','BoughtItems',OwnedItems)
        setDataFromSave('ShopItems',Item.name..'Owned',true)
        flushSaveData('ShopItems')
        setDataFromSave('UnlockData',ItemDataList[Item.id].data.unlock,true)
        flushSaveData('UnlockData')
        setTextString(Item.name..'Txt','OWNED')
        setTextColor(Item.name..'Txt','808080')

        IsConfirm=false
        WantBuy=''
        if stringEndsWith(ItemDataList[Item.id].data.unlock,'Unlock') then
            removeLuaSpriteSubstate('ShopBox')
            for i=1,#ItemDataList do
                removeLuaSpriteSubstate(ItemDataList[i].name)
                removeLuaTextSubstate(ItemDataList[i].name..'Txt')
            end
            removeLuaSpriteSubstate('ShopHand')
            setTextString('currencyText',getDataFromSave('ImportantData','Money',0))
            setTextColor('currencyText','000000')
            callScript('data/freeplay/Shop&Freeplay.lua','GoToSong',{stringSplit(ItemDataList[Item.id].data.unlock,'Unlock')[1]})

        end
        changeShopDialogue('What do you want?')
        return
    else
        changeShopDialogue('poorDialogue')
        cameraShake('other',0.005, 0.06)
    end
end
function onCustomSubstateDestroy(name)
    if name=='Shop' then
        IsConfirm=false
        for i=1,#ItemDataList do
            if ItemDataList[i].name==WantBuy then
                setTextString(WantBuy..'Txt',ItemDataList[i].price)
            end
        end        
        WantBuy=''
    end
end
function UpdateSelection()
    if Pos.row>2 then
        Pos.row=0
    elseif Pos.row<0 then
        Pos.row=2
    end
    if Pos.lane>2 then
        Pos.lane=0
    elseif Pos.lane<0 then
        Pos.lane=2
    end
    local Selection=Pos.lane+(Pos.row*3)
    setProperty('ShopHand.x',425 +(Selection%3)*200)
    setProperty('ShopHand.y',100 + Pos.row*128)
    local Item={name='',id=0}
    for i=1,#ItemDataList do
        if ItemDataList[i].pos.lane==Pos.lane and ItemDataList[i].pos.row==Pos.row  then
            Item={name=ItemDataList[i].name,id=i}
        end
    end
    local postPurchasePrice=getDataFromSave('ImportantData','Money',0)-tonumber(ItemDataList[Item.id].price)
    setTextString('currencyText',getDataFromSave('ImportantData','Money',0).." > "..postPurchasePrice)
    if postPurchasePrice < 0 then
        setTextColor('currencyText','FF0000')
	else
		setTextColor('currencyText','000000')
    end
end
function GetItem(data,id)
    for i=1,#ItemDataList do
        if ItemDataList[i][data]==id then
            return ItemDataList[i].name
        end
    end
end
function onUpdate(elapsed)
    if keyJustPressed('reset') then
        eraseSaveData('UnlockData')
        eraseSaveData('ShopItems')
        eraseSaveData('SongWasPlay')
        setDataFromSave('ImportantData','Money',999)
        flushSaveData('ImportantData')
    end
end
function eraseSaveData(name)
    runHaxeCode([[
        if(game.modchartSaves.exists("]]..name..[["))
		{
			game.modchartSaves.get("]]..name..[[").erase();
			return;
		}
    ]])
end
function addLuaSpriteSubstate(tag)
    runHaxeCode([[
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
   ]])
end
function removeLuaSpriteSubstate(tag)
    runHaxeCode([[
        CustomSubstate.instance.remove(game.getLuaObject("]]..tag..[["),false);
   ]])
end
function removeLuaTextSubstate(tag)
    runHaxeCode([[
        CustomSubstate.instance.remove(game.getLuaObject("]]..tag..[["),false);
   ]])
end
function addLuaTextSubstate(tag)
    runHaxeCode([[
        game.getLuaObject("]]..tag..[[",true).cameras=null;
        CustomSubstate.instance.add(game.getLuaObject("]]..tag..[[",true));
    ]])
end
function changeShopDialogue(Text)
    callScript('data/freeplay/Shop&Freeplay.lua','changeShopDialogue',{Text})
end