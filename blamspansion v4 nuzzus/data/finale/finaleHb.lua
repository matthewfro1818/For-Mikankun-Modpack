function onCreatePost()
	setProperty('healthBar.alpha', 0.0001); --hiding some hud stuff, healthBarBG copies healthBar's alpha so i dont need to set it
	setProperty('iconP2.alpha', 0.0001);
	
	makeLuaSprite('hbFinaleBlue', 'healthBarFinaleBlue', 0, (downscroll and -80 or 500)); --making the healthbar, which is two images that overlap each other
	setObjectCamera('hbFinaleBlue', 'hud');
	scaleObject('hbFinaleBlue', 0.7, 0.7 * (downscroll and -1 or 1)); --bascially just "if its downscroll multiply by this value else basically dont do anything"
	screenCenter('hbFinaleBlue', 'x');
	addLuaSprite('hbFinaleBlue');
	
	makeLuaSprite('hbFinaleRed', 'healthBarFinaleRed', 0, (downscroll and -80 or 500));
	setObjectCamera('hbFinaleRed', 'hud');
	scaleObject('hbFinaleRed', 0.7, 0.7 * (downscroll and -1 or 1));
	screenCenter('hbFinaleRed', 'x');
	addLuaSprite('hbFinaleRed');
	
	makeAnimatedLuaSprite('blackIcon', 'blackIcon'); --black imposter's icon
	addAnimationByPrefix('blackIcon', 'default', 'calm', 24, true);
	addAnimationByPrefix('blackIcon', 'losing', 'mad', 24, true);
	scaleObject('blackIcon', 0.95, 0.95); --scaling before offsetting to prevent weird offsetting bugs during countdown
	addOffset('blackIcon', 'default', 0, 0);
	addOffset('blackIcon', 'losing', 0, 43*0.95);
	playAnim('blackIcon', 'default', true);
	setObjectCamera('blackIcon', 'hud');
	addLuaSprite('blackIcon');
	
	setObjectOrder('iconP1', getObjectOrder('hbFinaleRed') + 1);
end

function onStepHit()
	if curStep == 1 then
	doTweenAlpha('uh', 'blackIcon', 0, 0.1, 'linear')
	doTweenAlpha('uh2', 'hbFinaleBlue', 0, 0.1, 'linear')
	doTweenAlpha('uh3', 'hbFinaleRed', 0, 0.1, 'linear')
	doTweenAlpha('u', 'iconP1', 0, 0.1, 'linear')

	elseif curStep == 272 then
		doTweenAlpha('uh4', 'blackIcon', 1, 0.1, 'linear')
		doTweenAlpha('uh5', 'hbFinaleBlue', 1, 0.1, 'linear')
		doTweenAlpha('uh6', 'hbFinaleRed', 1, 0.1, 'linear')
		doTweenAlpha('u7', 'iconP1', 1, 0.1, 'linear')
	end
end

curFrame = 0;
curHealth = 0;
iconAnim = 'default';
function onUpdatePost(e)
	if iconAnim == 'default' and getProperty('healthBar.percent') > 80 then --playing an animation based on the health
		iconAnim = 'losing';
		playAnim('blackIcon', 'losing', true);
	elseif iconAnim == 'losing' and getProperty('healthBar.percent') < 80 then
		iconAnim = 'default';
		playAnim('blackIcon', 'default', true);
	end
	
	curFrame = curFrame + e*24;
	if curFrame > 9 then
		curFrame = 0;
	end
	setProperty('blackIcon.animation.curAnim.curFrame', math.floor(curFrame)); --syncs the animation so changes from winning -> losing vise versa looks better
	
	curHealth = getProperty('health')/2;
	setProperty('hbFinaleRed._frame.frame.width', 58 + (math.lerp(1089, 0, curHealth))); --masking parts of the opponent healthbar based on some offset + health
	
	scaleObject('iconP1', 1.15, 1.15, false); --scaling and having the fourth var not update the sprites hitbox
	
	setProperty('blackIcon.x', getProperty('hbFinaleRed.x') - 155);
	setProperty('blackIcon.y', getProperty('hbFinaleRed.y') - (downscroll and 36 or 130)); --setting y based on if its downscroll or not
	
	setProperty('iconP1.x', getProperty('hbFinaleRed.x') + getProperty('hbFinaleRed.width') - 210);
	setProperty('iconP1.y', getProperty('hbFinaleRed.y') + (downscroll and 115 or 65));
end

function math.lerp(a, b, t)
	return a + t * (b - a);
end