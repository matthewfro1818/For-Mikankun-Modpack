function onCreate()
	-- background shit
	makeLuaSprite('bshell/BGBG', 'bshell/BGBG', -1940, -1112);
	setLuaSpriteScrollFactor('bshell/BGBG', 0.5, 0.5);
	scaleObject('bshell/BGBG', 1, 1);
	
	makeLuaSprite('bshell/LavaLimits', 'bshell/LavaLimits', -1770, 168);
	setLuaSpriteScrollFactor('bshell/LavaLimits', 0.55, 0.55);
	scaleObject('bshell/LavaLimits', 1, 1);

	makeLuaSprite('bshell/BGSpikes', 'bshell/BGSpikes', 112, -36);
	setLuaSpriteScrollFactor('bshell/BGSpikes', 0.6, 0.6);
	scaleObject('bshell/BGSpikes', 1, 1);

	makeLuaSprite('bshell/Spikes', 'bshell/Spikes', -1186, -234);
	setLuaSpriteScrollFactor('bshell/Spikes', 0.8, 0.8);
	scaleObject('bshell/Spikes', 1, 1);

	makeLuaSprite('bshell/Ground', 'bshell/Ground', -1320, 590);
	setLuaSpriteScrollFactor('bshell/Ground', 1, 1);
	scaleObject('bshell/Ground', 1, 1);

	addLuaSprite('bshell/BGBG', false);
	addLuaSprite('bshell/LavaLimits', false);
	addLuaSprite('bshell/BGSpikes', false);
	addLuaSprite('bshell/Spikes', false);
	addLuaSprite('bshell/Ground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end