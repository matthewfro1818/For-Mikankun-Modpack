function onEvent(name, value1, value2)
	if name == 'jumpscare' then
	makeAnimatedLuaSprite('jumpscare','stages/exe/jumpscare',-50,-100);
	addAnimationByPrefix('jumpscare','scare','sonicSPOOK',24,false);
	setScrollFactor('jumpscare',0,0);
	scaleObject("jumpscare",1.2,1.2)
	addLuaSprite('jumpscare',true);
	objectPlayAnimation('jumpscare','scare',false)
	
	playSound('datOneSound',2);
	playSound('jumpscare',1);
	end
end