

function onEvent(name, value1, value2)
	if name == 'Chroma Video' then

	initLuaShader("chromakey")	
	makeLuaSprite('videoSprite','',0,0)
	setObjectCamera('videoSprite', 'other');
	addLuaSprite('videoSprite')
	runTimer('wait', value2);






addHaxeLibrary('MP4Handler','vlc')
addHaxeLibrary('Event','openfl.events')
--add needed haxe libraries for video and openfl events

--run the main haxe code
runHaxeCode([[

	var value1 = "]] .. value1 .. [[";

	var filepath = Paths.video(value1);
	//get the video path
	
	var video = new MP4Handler();
	//create the video object

	video.playVideo(filepath);
	//play the video file

	video.visible = false;
	//make the video object overlay invisible

	setVar('video',video);
	//set global variable

	FlxG.stage.removeEventListener('enterFrame', video.update); 
	//removes the native update event the video has (disables skipping pressing enter)
]])


end
end





function onTimerCompleted(tag, loops, loopsleft)
if tag == 'wait' then
	doTweenAlpha('byebye', 'videoSprite', 0, 0.01, 'linear');
end
end

function onTweenCompleted(tag)
if tag == 'byebye' then
	removeLuaSprite('videoSprite', false);
end
end

function onUpdatePost()
	setSpriteShader("videoSprite", "chromakey")



--run the main haxe code
runHaxeCode([[
	var video = getVar('video');
	//get video object variable

	game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
	//set video sprite's graphic as the video's bitmap data

	video.volume = FlxG.sound.volume + 0.4;
	//set video volume as the game's volume (plus 0.4 idk psych has that for some reason)
	
	if(game.paused)video.pause();
	//pause video if the game is paused

]])

end


function onResume()

--run the main haxe code
runHaxeCode([[
	var video = getVar('video');
	//get video object variable

	video.resume();
	//resume video when game is resumed
]])

end