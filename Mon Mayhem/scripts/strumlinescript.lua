local strumData = {}
local fix = false;

function toBool(str)
	return str ~= nil and str:lower() == 'true';
end

function splitLuaText(s, delimiter)
	result = {};
	for token in s:gmatch("[^"..delimiter.."]+") do table.insert(result, token) end;
	return result;
end

function loadSongData()	
	local text = checkFileExists('data/'..songPath..'/strumData.txt') and getTextFromFile('data/'..songPath..'/strumData.txt') or (checkFileExists('data/strumData.txt') and getTextFromFile('data/strumData.txt'));
	if text == false then return {['enabled'] = 'false'} end;

	local splitTable = splitLuaText(text, '\n');
	local songData = {}

	for stupid, str in pairs(splitTable) do
		if stupid ~= #splitTable then str = str:sub(1, -2) end;
		str = splitLuaText(str, ':');
		songData[str[1]] = str[2];
	end

	songData['enabled'] = songData['enabled'] or 'true';

	splitTable = nil;
	return songData;
end

function generateStaticArrows()
	local alreadyVisible = strumData['alreadyVisible'] or 'true';

	addHaxeLibrary('Std');
	addLuaScript('scripts/strumlineScripts/strumlineAnims')

	fix = getProperty('strumLineNotes.length') < 1;

	runHaxeCode([[
		var version = Std.int(StringTools.replace(StringTools.replace("]]..version..[[", '.', ''), 'h', '.1'));
		game.setOnLuas('convertedVersion', version);

		if (version<45) return;

		for (i in 0...game.strumLineNotes.length)
		{
			var spr = game.strumLineNotes.members[i];
			spr.setGraphicSize(spr.width / 0.7 * 0.65);
			spr.updateHitbox();
		}

		var stupidList = ['left', 'down', 'up', 'right']; // God forgive me :(

		for (i in 0...4)
		{
			var babyArrow = new StrumNote(0, game.strumLine.y, i + 4, 0);

			if (version<45)
			{
				babyArrow.animation.addByPrefix('static', 'arrow' + stupidList[i].toUpperCase());
				babyArrow.animation.addByPrefix('pressed', stupidList[i]+' press', 24, false);
				babyArrow.animation.addByPrefix('confirm', stupidList[i]+' confirm', 24, false);
			}

			babyArrow.downScroll = ClientPrefs.downScroll;
			game.opponentStrums.add(babyArrow);
			game.strumLineNotes.insert(4+i, babyArrow);
			babyArrow.postAddedToGroup();

			babyArrow.visible = true;
			babyArrow.x -= FlxG.width;
			babyArrow.setGraphicSize(babyArrow.width / 0.7 * 0.65);
			babyArrow.alpha = 0.6;
			babyArrow.updateHitbox();
		}

		for (note in game.unspawnNotes)
		{
			note.scale.set(0.65, note.isSustainNote ? note.scale.y : 0.65);
			note.updateHitbox();

			if (note.noteType == 'Third Player Note')
			{
				note.mustPress = false;
				note.noteData += 4;
				note.noAnimation = true;

				continue;
			}

			if (StringTools.startsWith(note.noteType, "tpn-"))
			{
				StringTools.replace(note.noteType, "tpn-", "");
				note.mustPress = false;
				note.noteData += 4;
			}
		}

		game.singAnimations = ['singLEFT', 'singDOWN', 'singUP', 'singRIGHT', 'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'];
	]])

	if toBool(alreadyVisible) then
		callScript('scripts/strumlineScripts/strumlineAnims', 'returnAnim', {strumData['animationType'] or 'left', toBool(strumData['startAnimated'])});
	end

	if convertedVersion < 45 then

		local scriptSuffix='';
		if toBool(strumData['performanceMode']) then scriptSuffix = '-performance' end

		addLuaScript('scripts/strumlineScripts/compatibility'..scriptSuffix);
		
		if convertedVersion > 42 then
			if luaDebugMode then
				debugPrint('To disable this message, disable luaDebugMode, or delete code with this segment.')
				debugPrint('(you might encounter minor bugs with older versions)')
				debugPrint('as it is the definitive way of using this tool!')
				debugPrint('I would suggest you to update to version 0.6.3,')
				debugPrint('Hey! The Strumline Mod creator here.')
			end
		else
			debugPrint('DEPRECATED! Update to a Psych Engine version that implements HScript (or use a version before the rewrite).\nI would suggest using 0.6.3, but older versions such as 0.6.1 or 0.6.2 work too!')
		end
	end
end

function onCreatePost()
	luaDebugMode = true; -- Seen any issues? Report them on the Discord server! 
	strumData = loadSongData(); -- Loads song data from a text file called "strumData.txt"
	if toBool(strumData['enabled']) == false then return close(true) end; -- Ends the lua script if "enabled" property is unsatisfied
	generateStaticArrows(); -- If the property "enabled" is true, the strumline arrows get generated.
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Third Player Note' then
		callOnLuas('strumNoteHit', {id, direction, isSustainNote});
	end
end

function onCountdownTick(clock)
	if clock == 0 and fix then
		runHaxeCode([[
			for (i in 0...game.strumLineNotes.length)
			{
				var spr = game.strumLineNotes.members[i];
				spr.setGraphicSize(spr.width / 0.7 * 0.65);
				spr.updateHitbox();
			}
		]]);

		if toBool(strumData['alreadyVisible']) then callScript('scripts/strumlineScripts/strumlineAnims', 'returnAnim', {strumData['animationType'] or 'left', toBool(strumData['startAnimated'])}) end
	end
end