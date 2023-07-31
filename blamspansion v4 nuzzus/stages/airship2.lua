function onCreate()                       
    makeLuaSprite('fgPlatform', 'danger/fgPlatform', -750, 400);
	setScrollFactor('fgPlatform', 1, 1);
    scaleObject('fgPlatform', 1, 1);	
    
        makeLuaSprite('scvavd', 'danger/scvavd', -850, -280);
	setScrollFactor('scvavd', 1, 1);
    scaleObject('scvavd', 2, 2);	
    
         makeLuaSprite('back', 'back', -850, -1380);
	setScrollFactor('back', 1, 1);
    scaleObject('back', 2, 2);	
     
     makeLuaSprite('speedlines', 'danger/speedlines', -1050, -880);
	setScrollFactor('speedlines', 1, 1);
    scaleObject('speedlines', 1, 1);	

    doTweenAlpha('woah2', 'speedlines', 0.3, 0.5, 'linear')
 
      makeLuaSprite('sky', 'danger/sky', -850, -2530);
	setScrollFactor('sky', 1, 1);
    scaleObject('sky', 2, 2);	
 
    makeLuaSprite('frontClouds', 'danger/frontClouds', -850, 180);
	setScrollFactor('frontClouds', 1, 1);
    scaleObject('frontClouds', 1, 1);
    
       makeLuaSprite('frontClouds2', 'danger/frontClouds2', 7150, 180);
	setScrollFactor('frontClouds2', 1, 1);
    scaleObject('frontClouds2', 1, 1);
    
       makeLuaSprite('frontClouds3', 'danger/frontClouds', 15150, 180);
	setScrollFactor('frontClouds3', 1, 1);
    scaleObject('frontClouds3', 1, 1);
    
          makeLuaSprite('frontClouds4', 'danger/frontClouds', 23150, 180);
	setScrollFactor('frontClouds4', 1, 1);
    scaleObject('frontClouds4', 1, 1);
    
    makeLuaSprite('frontClouds5', 'danger/frontClouds', 31150, 180);
	setScrollFactor('frontClouds5', 1, 1);
    scaleObject('frontClouds5', 1, 1);
    
        makeLuaSprite('frontClouds6', 'danger/frontClouds', 39150, 180);
	setScrollFactor('frontClouds6', 1, 1);
    scaleObject('frontClouds6', 1, 1);
    
        makeLuaSprite('frontClouds7', 'danger/frontClouds', 47150, 180);
	setScrollFactor('frontClouds7', 1, 1);
    scaleObject('frontClouds7', 1, 1);
    
         makeLuaSprite('frontClouds8', 'danger/frontClouds', 55150, 180);
	setScrollFactor('frontClouds8', 1, 1);
    scaleObject('frontClouds8', 1, 1);
    
       makeLuaSprite('farthestClouds', 'danger/farthestClouds', -1350, -530);
	setScrollFactor('farthestClouds', 0.2, 0.2);
    scaleObject('farthestClouds', 1, 1);	
           makeLuaSprite('backClouds', 'danger/backClouds', -1000, -500);
	setScrollFactor('backClouds', 0.4, 0.4);
    scaleObject('backClouds', 3, 2.5);	
    
               makeLuaSprite('airship', 'danger/airship', 1300, -1100);
	setScrollFactor('airship', 0.5, 0.5);
    scaleObject('airship', 1, 1);	
    	
    	             makeLuaSprite('bigCloud', 'danger/bigCloud', 4000, -1100);
	setScrollFactor('bigCloud', 1, 1);
    scaleObject('bigCloud', 1, 1);	
    
    makeLuaSprite('bigCloud2', 'danger/bigCloud', 4000, -1100);
	setScrollFactor('bigCloud2', 1, 1);
    scaleObject('bigCloud2', 1, 1);	
    	makeAnimatedLuaSprite('airshipFan', 'danger/airshipFan', 2200, 0);
	addAnimationByPrefix('airshipFan', '', '', 24, true);
	 scaleObject('airshipFan', 0.95, 0.95);
	setScrollFactor('airshipFan', 0.5, 0.5);
   	makeAnimatedLuaSprite('blacklegs', 'characters/blacklegs', 185, 330);
	addAnimationByPrefix('blacklegs', '', '', 24, true);
	 scaleObject('blacklegs', 1.3, 1.3);
	setScrollFactor('blacklegs', 1, 1);

	makeAnimatedLuaSprite('bf_legs', 'characters/bf_legs', 1655, 440);
	addAnimationByPrefix('bf_legs', '', '', 24, true);
	 scaleObject('bf_legs', 1, 1);
	setScrollFactor('bf_legs', 1, 1);
	
	setScrollFactor('dadGroup', 1, 1);
	setScrollFactor('boyfriendGroup', 1, 1);
	setScrollFactor('gfGroup', 1, 1);

    addLuaSprite('farthestClouds', false)
    addLuaSprite('backClouds', false) 
    addLuaSprite('dadGroup', false)
    addLuaSprite('boyfriendGroup', true)
   addLuaSprite('fgPlatform', false)
   addLuaSprite('back', false)
   addLuaSprite('scvavd', false)
   addLuaSprite('sky', false)
   addLuaSprite('airship', false)
   addLuaSprite('speedlines', false)
   addLuaSprite('bigCloud', false)
   addLuaSprite('bigCloud2', false)
   addLuaSprite('frontClouds', false)
   addLuaSprite('frontClouds2', false)
   addLuaSprite('frontClouds3', false)
   addLuaSprite('frontClouds4', false)
   addLuaSprite('frontClouds5', false)
   addLuaSprite('blacklegs', true)
   addLuaSprite('bf_legs', true)
   addLuaSprite('airshipFan', true)
   
   setObjectOrder('sky', 0);
   setObjectOrder('farthestClouds', 1);
   setObjectOrder('backClouds', 2);
   setObjectOrder('airship', 3);
   setObjectOrder('airshipFan', 4);
   setObjectOrder('bigCloud', 5);
   setObjectOrder('bigCloud', 6);
   setObjectOrder('frontClouds', 7);
   setObjectOrder('frontClouds2', 8);
   setObjectOrder('frontClouds3', 9);
   setObjectOrder('frontClouds4', 10);
   setObjectOrder('frontClouds5', 11);
   setObjectOrder('frontClouds6', 12);
   setObjectOrder('frontClouds7', 13);
   setObjectOrder('frontClouds8', 14);
   setObjectOrder('fgPlatform', 15);
   setObjectOrder('back', 16);   
   setObjectOrder('scvavd', 17); 
   setObjectOrder('blacklegs', 18);
   setObjectOrder('gfGroup', 19);
   setObjectOrder('dadGroup', 20);
   setObjectOrder('bf_legs', 21);
   setObjectOrder('boyfriendGroup', 22);
   setObjectOrder('speedlines', 22);
   
   setProperty('scvavd.alpha', 0)
   setProperty('back.alpha', 0)
   setProperty('speedlines.alpha', 0.5)
    end
