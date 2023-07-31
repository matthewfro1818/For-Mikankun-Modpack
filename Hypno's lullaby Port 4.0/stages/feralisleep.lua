local Path='stage/Feralisleep/'
local startingPosition={}
local insomniaFog={}
function onCreate()
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	addLuaScript('scripts/Mechanics/InsomniaRating.lua')
	
	consistentPosition={-1000, -350}
	
	fogCount = 6
	makeLuaSprite('back',Path..'Lost_silver_back', consistentPosition[1], consistentPosition[2]);
	setScrollFactor('back', 1.1, 0.9)
	addLuaSprite('back', false);

	makeLuaSprite('lake',Path..'Lost_silver_lake', consistentPosition[1],consistentPosition[2] + 1306 * (3 / 4))
	setScrollFactor('lake', 1, 0.9)
	addLuaSprite('lake', false);
	
	for i=0 ,fogCount do 
		makeLuaSprite('fog'..i,Path..'Lost_silver_fog',consistentPosition[1],consistentPosition[2] + 960 * (3 / 4))
		setScrollFactor('fog'..i, 0.95, 0.9)
		if i < (fogCount / 2) - 1 then
			setProperty('fog'..i..'.flipX',true)
		end
		addLuaSprite('fog'..i, false);
		table.insert(startingPosition,{x=getProperty('fog'..i..'.x'),y=getProperty('fog'..i..'.y')})
		table.insert(insomniaFog,'fog'..i)
	end

	makeLuaSprite('ground',Path..'Lost_silver_ground', consistentPosition[1],consistentPosition[2] + 1360 * (3 / 4))
	setScrollFactor('ground', 0.9, 0.9);
	addLuaSprite('ground', false);

	makeLuaSprite('tree',Path..'Lost_silver_tree', consistentPosition[1],consistentPosition[2]);
	setScrollFactor('tree', 0.9, 0.9);
	addLuaSprite('tree', false);

	makeLuaSprite('Black', nil, consistentPosition[1],0);
	makeGraphic('Black',screenWidth*2,screenHeight*2,'000000')
	setScrollFactor('Black', 0.9, 0.9);
	setProperty('Black.alpha',0)
	addLuaSprite('Black', false);
	
	

end
function onCreatePost()
	callScript('scripts/Stuff/CameraMove','fpSong')
end
function onUpdate(elapsed)
	for i=0, #insomniaFog do
		-- formula port from the original mod
		local speedDivider= 128
		local swirlSize = 32
		local formulaX = math.cos((180 / math.pi) * ((getSongPosition() - (getSongPosition() * i)) / 1000) / speedDivider) * swirlSize;
		local formulaY = math.sin((180 / math.pi) * ((getSongPosition() - (getSongPosition() * i)) / 1000) / speedDivider) * swirlSize;
        if luaSpriteExists(insomniaFog[i+1]) then
			setProperty(insomniaFog[i+1]..'.x',startingPosition[i+1].x+ formulaX)
			setProperty(insomniaFog[i+1]..'.y',startingPosition[i+1].y+ formulaY)
		end

		speedDivider= 128
		swirlSize = 2
		formulaX= math.cos((180 / math.pi) * ((getSongPosition() - (getSongPosition() * i)) / 1000) / speedDivider)
		formulaY= math.sin((180 / math.pi) * ((getSongPosition()- (getSongPosition() * i)) / 1000) / speedDivider)
		if luaSpriteExists(insomniaFog[i+1]) then
		    setProperty(insomniaFog[i+1]..'.alpha',formulaX / swirlSize)
		end
		if i < (fogCount / 2) - 1 then
			setProperty(insomniaFog[i+1]..'.alpha',1- formulaX / swirlSize)
		end
    end
end