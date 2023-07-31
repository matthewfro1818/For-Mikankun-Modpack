function onCreate()

	makeLuaSprite('console', 'impostor/center console', 1450, 1750);
	makeLuaSprite('bg', 'impostor/reactor background', -600, -300);
	makeLuaSprite('cranes', 'impostor/upper cranes', 900, -300);
	makeLuaSprite('energyball', 'impostor/ball of big ol energy', 1200, 200);
	makeLuaSprite('bp', 'impostor/back pillars', -500, -300);
	makeLuaSprite('mp', 'impostor/middle pillars', -500, -300);
	makeLuaSprite('fp', 'impostor/front pillars', -500, -300);
	
	addLuaSprite('bg', false);
	addLuaSprite('energyball', false);
	addLuaSprite('console', false);
	addLuaSprite('cranes', false);
	addLuaSprite('bp', false);
	addLuaSprite('mp', false);
	addLuaSprite('fp', false);
end

function onCreatePost()
	setObjectOrder('boyfriendGroup', 15)
	setObjectOrder('dadGroup', 16)
end

--Blackout mechanic