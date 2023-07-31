function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('notexture');
	precacheSound('Dodged');
end

function onEvent(name, value1, value2)
    if name == "leafeonEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('notexture', 'notexture', 400, 200);
    luaSpriteAddAnimationByPrefix('notexture', 'notexture', 'notexture', 25, true);
	luaSpritePlayAnimation('notexture', 'notexture');
	setObjectCamera('notexture', 'other');
	scaleLuaSprite('notexture', 0.50, 0.50); 
    addLuaSprite('notexture', true); 
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   playSound('Dodged', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('notexture');
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   
   end
end