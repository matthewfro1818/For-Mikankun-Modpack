package false_paradise;

import flixel.system.FlxAssets.FlxShader;

import flixel.addons.transition.FlxTransitionableState;
import groovin.menu.main_menu.GroovinMainMenuState;

import false_paradise.FalseParadiseMod.FalseParadiseInstance;
import false_paradise.background.CloudFlightBackground;
import false_paradise.background.FalseParadiseBackground.FalseParadiseBackgroundSprite;
import false_paradise.note_mods.NoteModArrowShape;
import false_paradise.note_mods.NoteModCounterClockwise;
import false_paradise.note_mods.NoteModDistortWiggle;
import false_paradise.note_mods.NoteModEyeShape;
import false_paradise.note_mods.NoteModReceptorScroll;
import false_paradise.note_mods.NoteModSpiral;
import false_paradise.note_mods.NoteModVibrate;
import false_paradise.note_mods.NoteModWiggle;
import false_paradise.shaders.FalseParadiseCRT;
import false_paradise.shaders.FalseParadiseGlitchy;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import groovin.shaders.GroovinShaders.SolidColorEffect;
import lime.math.Vector2;
import lime.math.Vector4;
import openfl.filters.ShaderFilter;
import schmovin.SchmovinClient;
import schmovin.SchmovinClientWithDebugger;
import schmovin.SchmovinInstance;
import schmovin.SchmovinTimeline;
import schmovin.note_mods.ISchmovinNoteMod;
import schmovin.note_mods.NoteModPerspective;
import schmovin.note_mods.NoteModRotate;
import schmovin.note_mods.NoteModTranslate;

import FreeplayState.SongMetadata;
import flixel.FlxG;
import flixel.FlxSprite;
import groovin.GroovinConstants;
import groovin.StateConstants;
import groovin.mod.Mod;
import groovin.mod.ModHooks;
import groovin.mod_options.GroovinModOptionsClasses.GroovinModOption;
import groovin.mod_options.GroovinModOptionsClasses.GroovinModOptionCheckbox;
import groovin.week.ModWeekData;
import schmovin.SchmovinInstance;

class FalseParadiseInstance
{
	public var optionDisableBGShader:Bool = false;
	public var bg:FlxSprite;
	public var stageFront:FlxSprite;
	public var stageCurtains:FlxSprite;

	private function new() {}

	public static function Create()
	{
		return new FalseParadiseInstance();
	}
}

class FalseParadiseMod extends Mod
{
	var _inst:FalseParadiseInstance;
	var optionDisableBGShader:Bool = false;

	public static function GetAssetPath(s:String)
	{
		return 'mod:mod_assets/FalseParadiseMod/weeks/${s}';
	}

	override function initialize()
	{
		hook(ModHooks.hookSetupStage);
		hook(ModHooks.hookPreCameras);
		hook(ModHooks.hookAddMissDamage);
		StateConstants.MAIN_MENU_STATE = FalseParadiseShoutoutsState;
		// StateConstants.CHARTING_STATE = FalseParadiseChartingState;
	}

	override function addMissDamage(state:PlayState, causedByLateness:Bool):Float
	{
		return 0.04;
	}

	override function preCameras(state:PlayState)
	{
		_inst = FalseParadiseInstance.Create();
		_inst.optionDisableBGShader = optionDisableBGShader;
	}

	override function shouldRun():Bool
	{
		if (Type.getClass(FlxG.state) == PlayState)
		{
			return PlayState.curMod == this && PlayState.isModdedStage;
		}
		return false;
	}

	override function registerModOptions():Array<GroovinModOption<Dynamic>>
	{
		return [
			new GroovinModOptionCheckbox(this, 'disableCloudBackground', 'Disable Cloud Background Shader', false, (v) ->
			{
				optionDisableBGShader = v;
				if (_inst != null)
					_inst.optionDisableBGShader = optionDisableBGShader;
			}, false)
		];
	}

	override function receiveCrossModCall(command:String, sender:Mod, args:Array<Dynamic>)
	{
		if (PlayState.SONG.song == 'false-paradise' && shouldRun())
		{
			switch (command)
			{
				case 'SchmovinSetClient':
					var instance:SchmovinInstance = cast args[0];
					var cli = new FalseParadiseSchmovinClient(instance, args[1], args[2], _inst);
					instance.setClient(cli);
					sendCrossModCall('SchmovinPrepareDebug', [cli]);
			}
		}
	}

	override function setupStage(state:PlayState, stageName:String)
	{
		state.defaultCamZoom = 0.9;
		_inst.bg = new FlxSprite(-600, -200).loadGraphic(Paths.image('stageback'));
		_inst.bg.antialiasing = true;
		_inst.bg.scrollFactor.set(0.9, 0.9);
		_inst.bg.active = false;
		state.add(_inst.bg);

		_inst.stageFront = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		_inst.stageFront.setGraphicSize(Std.int(_inst.stageFront.width * 1.1));
		_inst.stageFront.updateHitbox();
		_inst.stageFront.antialiasing = true;
		_inst.stageFront.scrollFactor.set(0.9, 0.9);
		_inst.stageFront.active = false;
		state.add(_inst.stageFront);

		_inst.stageCurtains = new FlxSprite(-500, -300).loadGraphic(Paths.image('stagecurtains'));
		_inst.stageCurtains.setGraphicSize(Std.int(_inst.stageCurtains.width * 0.9));
		_inst.stageCurtains.updateHitbox();
		_inst.stageCurtains.antialiasing = true;
		_inst.stageCurtains.scrollFactor.set(1.3, 1.3);
		_inst.stageCurtains.active = false;

		state.add(_inst.stageCurtains);
	}

	override function getModWeekData():Array<ModWeekData>
	{
		var menu = cast(FlxG.state, StoryMenuState);

		menu.weekData = [['Tutorial']];
		menu.weekCharacters = [['dad', 'bf', 'gf']];
		menu.weekNames = [''];
		return [
			new ModWeekData(this, 'false-paradise', ['false-paradise'], '\"something big\"', ['dad', 'bf', 'gf'],
				'mod:mod_assets/${getName()}/preload/weeks/week.png')
		];
	}

	override function addToFreeplay(addWeek:(Array<String>, String, Array<String>) -> Void, weekNum:Int)
	{
		var menu = cast(FlxG.state, FreeplayState);
		// menu.songs = [new SongMetadata('tutorial', 1, 'gf')];
		addWeek(['false-paradise'], 'false-paradise', ['dad']);
	}
}

class FalseParadiseSchmovinClient extends SchmovinClientWithDebugger
{
	var _modInstance:FalseParadiseInstance;

	override public function new(instance:SchmovinInstance, timeline:SchmovinTimeline, state:PlayState, modInstance:FalseParadiseInstance)
	{
		super(instance, timeline, state);
		_modInstance = modInstance;
	}

	function RegisterCustomMods()
	{
		addNoteMod('counterclockwise', new NoteModCounterClockwise());
		addNoteAuxMod('arrowshapeoffset');
		addNoteMod('arrowshape', new NoteModArrowShape());
		addNoteAuxMod('eyeshapeoffset');
		addNoteMod('eyeshape', new NoteModEyeShape());
		removeNoteModFromName('centerrotate');
		addNoteMod('centerrotate', new NoteModRotate('center', new Vector4(FlxG.width / 2, FlxG.height / 2)));
		addNoteAuxMod('spiraldist');
		addNoteMod('spiral', new NoteModSpiral());
		addNoteMod('wiggle', new NoteModWiggle());
		addNoteMod('vibrate', new NoteModVibrate());
		removeNoteModFromName('translation');
		addNoteMod('translation', new NoteModTranslate());
		removeNoteModFromName('perspective');
		addNoteMod('perspective', new NoteModPerspective());
		addNoteMod('receptorscroll', new NoteModReceptorScroll());
		addNoteAuxMod('distortwiggleperiod');
		addNoteAuxMod('distortwigglescratch');
		addNoteMod('distortwiggle', new NoteModDistortWiggle());
		_timeline.initializeLists();
	}

	override function initialize()
	{
		RegisterCustomMods();
		Debug();
		IntroOverlay();
		Intro();
		Section1();
		Section2();
		Breakdown();
		Section3();
		Section4();
		Section5();
		End();
		OutroOverlay();
		Glitchy();
	}

	function Debug() {}

	function IntroOverlay()
	{
		var overlayGroup = new FlxTypedGroup<FlxSprite>();
		overlayGroup.camera = _instance.camAboveGame;
		_state.add(overlayGroup);

		var dmDokuro = new FlxSprite().loadGraphic(FalseParadiseMod.GetAssetPath('overlay/dm_dokuro.png'));
		overlayGroup.add(dmDokuro);
		dmDokuro.alpha = 0;
		dmDokuro.antialiasing = true;
		dmDokuro.x = FlxG.width / 2 - dmDokuro.width / 2;
		t([3, 1], dmDokuro, 4, FlxEase.linear, {alpha: 1});

		var path = Math.random() < 0.05 ? 'overlay/flase_praadise.png' : 'overlay/false_paradise.png';
		var falseParadise = new FlxSprite().loadGraphic(FalseParadiseMod.GetAssetPath(path));
		falseParadise.alpha = 0;
		overlayGroup.add(falseParadise);
		falseParadise.antialiasing = true;
		falseParadise.x = FlxG.width / 2 - falseParadise.width / 2;
		falseParadise.y = FlxG.height / 2 - falseParadise.height / 2;
		dmDokuro.y = falseParadise.y - dmDokuro.height;

		t([3, 6], falseParadise, 4, FlxEase.linear, {alpha: 1});
		t([3, 6], falseParadise.scale, 8, FlxEase.sineInOut, {x: 1.05, y: 1.05});
		t([3, 6], dmDokuro.scale, 8, FlxEase.sineInOut, {x: 1.05, y: 1.05});

		t([8, 1], falseParadise, 8, FlxEase.sineInOut, {y: -falseParadise.height});
		t([8, 1], dmDokuro, 8, FlxEase.sineInOut, {y: -falseParadise.height});

		f([10, 1], () ->
		{
			_state.remove(overlayGroup);
		});
	}

	function OutroOverlay()
	{
		var overlayGroup = new FlxTypedGroup<FlxSprite>();
		overlayGroup.camera = _instance.camAboveGame;
		_state.add(overlayGroup);

		var thankYou = new FlxSprite().loadGraphic(FalseParadiseMod.GetAssetPath('overlay/thank_you.png'));
		thankYou.alpha = 0;
		overlayGroup.add(thankYou);
		thankYou.antialiasing = true;
		thankYou.x = FlxG.width / 2 - thankYou.width / 2;
		thankYou.y = -FlxG.height;

		t([116, 1], thankYou, 8, FlxEase.linear, {alpha: 1});
		t([116, 1], thankYou, 8, FlxEase.sineOut, {y: FlxG.height / 2 - thankYou.height / 2});
		t([116, 1], thankYou.scale, 16, FlxEase.sineInOut, {x: 1.1, y: 1.1});
		t([122, 1], thankYou, 8, FlxEase.linear, {alpha: 0});

		var black = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		var schmovin_logo = new FlxSprite().loadGraphic(FalseParadiseMod.GetAssetPath('overlay/vs_bob_thank_you.png'));
		black.alpha = 0;
		black.scrollFactor.set();
		schmovin_logo.alpha = 0;
		schmovin_logo.scrollFactor.set();
		schmovin_logo.screenCenter();
		f([122, 1], () ->
		{
			_instance.layerAboveGame.add(black);
			_instance.layerAboveGame.add(schmovin_logo);
		});
		f([121, 1], () ->
		{
			t([122, 1], _state.iconP1, 8, FlxEase.linear, {alpha: 0});
			t([122, 1], _state.scoreTxt, 8, FlxEase.linear, {alpha: 0});
			t([122, 1], _state.iconP2, 8, FlxEase.linear, {alpha: 0});
			t([122, 1], _state.healthBar, 8, FlxEase.linear, {alpha: 0});
			t([122, 1], _state.healthBarBG, 8, FlxEase.linear, {alpha: 0});
		});
		t([122, 1], black, 8, FlxEase.linear, {alpha: 1}, (t) ->
		{
			_instance.layerBelowGame.clear();
		});
		t([124, 1], schmovin_logo, 8, FlxEase.linear, {alpha: 0.01});
	}

	function Intro()
	{
		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		func(4, () ->
		{
			var clouds = new CloudFlightBackground(!this._modInstance.optionDisableBGShader);
			clouds.scrollFactor.set();
			clouds.alpha = 0;
			_state.remove(_modInstance.bg);
			_state.remove(_modInstance.stageCurtains);
			_state.remove(_modInstance.stageFront);
			_instance.layerBelowGame.add(clouds);
			_instance.layerAboveHUD.add(white);
			_tween.tween(white, {alpha: 0}, 2);

			clouds.alpha = 1;
		});
		s([2, 1], 1, 'camgameoverride', 0);
		s([2, 1], -800, 'camgameoverridey', 0);
		s([2, 1], -1, 'reverse');

		e([9, 1], 4, FlxEase.sineOut, 0, 'camgameoverridey', 0);
		e([9, 1], 4, FlxEase.sineOut, 0, 'reverse');

		e([10, 1], 2, FlxEase.sineInOut, 0, 'camgameoverride', 0);

		var kickpattern = [1, 5, 9, 12, 15];
		var kickpattern2 = [1, 5, 9, 15];

		var alt = 0;
		for (bar in 10...13)
		{
			for (step in kickpattern)
			{
				s([bar, step], this.alt(alt), 'tipsy');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'tipsy');
				s([bar, step], this.alt(alt) * 30, 'x');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'x');
				alt++;
			}
		}
		for (step in kickpattern2)
		{
			s([13, step], this.alt(alt), 'tipsy');
			e([13, step], 1, FlxEase.cubeOut, 0, 'tipsy');
			s([13, step], this.alt(alt) * 30, 'x');
			e([13, step], 1, FlxEase.cubeOut, 0, 'x');
			alt++;
		}
		for (bar in 14...17)
		{
			for (step in kickpattern)
			{
				s([bar, step], this.alt(alt), 'tipsy');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'tipsy');
				s([bar, step], this.alt(alt) * 30, 'x');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'x');
				alt++;
			}
		}

		var gfPath = 'mod:mod_assets/FalseParadiseMod/weeks/gf/GF_sign_language';
		var gfASL = new FlxSprite();
		gfASL.frames = FlxAtlasFrames.fromSparrow('${gfPath}.png', '${gfPath}.xml');
		gfASL.animation.addByPrefix('asl', 'GF ASL', 24, false);
		gfASL.offset.set(-392, -139);
		gfASL.antialiasing = true;
		gfASL.visible = true;
		f([1, 1], () ->
		{
			gfASL.visible = false;
		});
		// This'll be behind the stage but since there's no background in the camGameCopy it'll still be visible lol
		_state.add(gfASL);
		f([17, 9], () ->
		{
			gfASL.visible = true;
			gfASL.animation.play('asl');
			_state.gf.visible = false;
		});
		f([18, 1], () ->
		{
			gfASL.visible = false;
			_state.gf.visible = true;
		});

		var black = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		black.scrollFactor.set();

		s([17, 1], 100, 'camgameoverridex');
		e([17, 1], 4, FlxEase.circInOut, 1, 'camgameoverride');
		e([17, 1], 4, FlxEase.circInOut, 1, 'camgamezoom');

		e([17, 1], 1, FlxEase.cubeOut, 1, 'tipsy');
		e([17, 1], 1, FlxEase.cubeOut, 1, 'drunk');

		s([18, 1], 0, 'camgamezoom');
		s([18, 1], 0, 'camgameoverride');

		var fillPattern = [3, 4, 6, 7, 9, 10, 12, 14, 15, 16];

		var shaderOn = false;
		for (step in fillPattern)
		{
			shaderOn = !shaderOn;
			if (shaderOn)
			{
				f([17, step], () ->
				{
					_instance.layerAboveGame.add(black);
				});
			}
			else
			{
				f([17, step], () ->
				{
					_instance.layerAboveGame.remove(black);
				});
			}
		}

		f([18, 1], () ->
		{
			_instance.layerAboveGame.remove(black);
			_instance.layerBelowGame.add(black);
		});

		f([18, 1], () ->
		{
			_instance.layerBelowGame.clear();
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});
	}

	function Section1()
	{
		f([18, 1], () ->
		{
			var noise = new FalseParadiseBackgroundSprite(true);
			noise.scrollFactor.set();
			_instance.layerBelowGame.add(noise);
		});

		s([18, 1], 0.2, 'tipsy');
		s([18, 1], 0.2, 'drunk');

		var p0Center = FlxG.width / 2 - 50 - Note.swagWidth * 2;
		var p1Center = -50 - Note.swagWidth * 2;
		s([18, 1], p0Center, 'x', 0);
		s([18, 1], p1Center + FlxG.width * 2, 'x', 1);

		var kickpattern4 = [[1, 3], [4, 3], [7, 3], [10, 2], [12, 1], [13, 2], [15, 2]];
		var kickpattern5 = [[1, 3], [4, 2], [6, 3], [9, 3], [12, 2], [14, 3]];
		var kickpattern6 = [[1, 3], [4, 3], [7, 3], [10, 2], [12, 2], [14, 3]];
		var kickpattern5bars = [21, 29];
		var kickpattern6bars = [25, 33];

		e([25, 9], 1, FlxEase.circInOut, p0Center - FlxG.width * 2, 'x', 0);
		e([25, 9], 1, FlxEase.circInOut, p1Center, 'x', 1);

		var alt = 0;
		for (bar in 18...34)
		{
			var player = bar >= 26 ? 1 : 0;
			e([bar, 1], 1, FlxEase.sineInOut, 0, 'drunk', player);
			e([bar, 1], 0.25, FlxEase.sineInOut, 0, 'confusionzoffset');
			if (kickpattern5bars.contains(bar))
			{
				for (entry in kickpattern5)
				{
					var step = entry[0];
					var length = entry[1] / 4.0;
					e([bar, step], 0.25, FlxEase.sineInOut, this.alt(alt) * 0.2, 'confusionzoffset', player);
					e([bar, step], length, FlxEase.circOut, this.alt(alt) * 40, 'xoffset', player);
					s([bar, step], 0.5, 'tinyy', player);
					s([bar, step], -0.5, 'tinyx', player);
					e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyy', player);
					e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyx', player);
					alt++;
				}
				continue;
			}
			else if (kickpattern6bars.contains(bar))
			{
				for (entry in kickpattern6)
				{
					var step = entry[0];
					var length = entry[1] / 4.0;
					e([bar, step], 0.25, FlxEase.sineInOut, this.alt(alt), 'confusionzoffset', player);
					e([bar, step], 0.25, FlxEase.sineInOut, this.alt(alt), 'drunk', player);
					e([bar, step], length, FlxEase.elasticOut, this.alt(alt) * 90, 'xoffset', player);
					s([bar, step], 0.5, 'tinyy', player);
					s([bar, step], -0.5, 'tinyx', player);
					e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyy', player);
					e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyx', player);
					alt++;
				}
				continue;
			}
			for (entry in kickpattern4)
			{
				var step = entry[0];
				var length = entry[1] / 4.0;
				e([bar, step], length, FlxEase.sineInOut, this.alt(alt) * 0.5, 'drunk', player);
				e([bar, step], length, FlxEase.circOut, this.alt(alt) * 40, 'xoffset', player);
				s([bar, step], 0.5, 'tinyy', player);
				s([bar, step], -0.5, 'tinyx', player);
				e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyy', player);
				e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyx', player);
				alt++;
			}
		}
		f([34, 1], () ->
		{
			_instance.layerBelowGame.clear();
		});
	}

	function Section2()
	{
		if (IsEasyModo())
		{
			s([34, 1], 0, 'drunk');
			s([34, 1], 0, 'tipsy');
			s([34, 1], 0, 'wiggle');
		}

		s([33, 13], 100, 'camgameoverridex');
		e([33, 13], 1, FlxEase.sineInOut, 1, 'camgameoverride');

		var gfSign = new FlxSprite();
		if (IsEasyModo())
		{
			var gfPath = 'mod:mod_assets/FalseParadiseMod/weeks/gf/GF_assets_easy_modo';
			gfSign.frames = FlxAtlasFrames.fromSparrow('${gfPath}.png', '${gfPath}.xml');
			gfSign.animation.addByPrefix('sign', 'GF sign easy modo instance 1', 24, false);
		}
		else
		{
			var gfPath = 'mod:mod_assets/FalseParadiseMod/weeks/gf/GF_assets_sign_ilvg';
			gfSign.frames = FlxAtlasFrames.fromSparrow('${gfPath}.png', '${gfPath}.xml');
			gfSign.animation.addByPrefix('sign', 'GF sign ILVG instance 1', 24, false);
		}
		gfSign.offset.set(-392, -139);
		gfSign.antialiasing = true;
		gfSign.visible = true;
		f([1, 1], () ->
		{
			gfSign.visible = false;
		});
		// This'll be behind the stage but since there's no background in the camGameCopy it'll still be visible lol
		_state.add(gfSign);
		f([33, 15], () ->
		{
			gfSign.visible = true;
			gfSign.animation.play('sign');
			_state.gf.visible = false;
		});
		f([34, 9], () ->
		{
			gfSign.visible = false;
			_state.gf.visible = true;
		});

		e([34, 1], 0.5, FlxEase.sineInOut, 0, 'xoffset');
		e([34, 1], 0.5, FlxEase.sineInOut, 0, 'x');
		e([34, 1], 0.5, FlxEase.sineInOut, 0, 'confusionzoffset');
		e([34, 3], 1, FlxEase.sineInOut, -0.5, 'reverse');

		s([34, 9], 0, 'reverse');

		var leftRightPatterns = [[9, 1], [10, -1], [12, 1], [13, -1], [15, 1], [17, 0]];
		for (bar in [34, 36, 38, 40])
		{
			for (pattern in leftRightPatterns)
			{
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 50 * pattern[1], 'x', 0);
				s([bar, pattern[0]], -1, 'tinyx', 0);
				s([bar, pattern[0]], 1, 'tinyy', 0);
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 0, 'tinyx', 0);
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 0, 'tinyy', 0);
			}
		}
		for (bar in [42, 44, 46, 48])
		{
			for (pattern in leftRightPatterns)
			{
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 50 * pattern[1], 'x', 1);
				s([bar, pattern[0]], -1, 'tinyx', 1);
				s([bar, pattern[0]], 1, 'tinyy', 1);
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 0, 'tinyx', 1);
				e([bar, pattern[0]], 0.5, FlxEase.circOut, 0, 'tinyy', 1);
			}
		}

		e([33, 13], 1, FlxEase.sineIn, 0.3, 'camgamezoom');
		e([34, 1], 1.5, FlxEase.sineOut, 1, 'camgamezoom');
		e([34, 7], 1.5, FlxEase.sineInOut, 0, 'camgamezoom');

		e([34, 7], 1.5, FlxEase.sineInOut, 0, 'camgameoverride');

		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);

		f([34, 9], () ->
		{
			var clouds = new CloudFlightBackground(!this._modInstance.optionDisableBGShader);
			_instance.layerBelowGame.clear();
			_instance.layerBelowGame.add(clouds);

			_instance.layerAboveHUD.add(white);
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});

		var alt = 0;
		e([33, 9], 4, FlxEase.quartInOut, 1, 'wiggle');
		for (bar in 33...42)
		{
			e([bar, 9], 4, FlxEase.quartInOut, alt * Math.PI, 'rotatex', 0);
			alt++;
		}
		alt = 0;
		for (bar in 41...48)
		{
			alt++;
			e([bar, 9], 4, FlxEase.quartInOut, (alt - 1) * Math.PI, 'rotatex', 1);
		}
		e([48, 9], 2, FlxEase.quartIn, alt * Math.PI - Math.PI / 2, 'rotatex', 1);
		alt++;
		e([49, 1], 4, FlxEase.linear, alt * Math.PI + Math.PI, 'rotatex', 1);
	}

	function IsEasyModo()
	{
		return PlayState.storyDifficulty == 0;
	}

	function Breakdown()
	{
		if (!IsEasyModo())
		{
			var falseParadiseCRT = new FalseParadiseCRT();
			f([50, 1], () ->
			{
				_instance.camGameCopy.setFilters([new ShaderFilter(falseParadiseCRT.shader)]);
				_instance.camNotes.setFilters([new ShaderFilter(falseParadiseCRT.shader)]);
			});
			t([50, 1], falseParadiseCRT, 32, FlxEase.linear, {time: 20}, null, (t) ->
			{
				falseParadiseCRT.update();
			});
			t([57, 1], falseParadiseCRT, 4, FlxEase.circIn, {resolutionX: FlxG.width, resolutionY: FlxG.height}, null);
			f([58, 1], () ->
			{
				_instance.camGameCopy.setFilters(null);
				_instance.camNotes.setFilters(null);
			});
		}

		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);

		f([58, 1], () ->
		{
			_instance.layerAboveHUD.add(white);
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});

		f([50, 1], () ->
		{
			_instance.layerBelowGame.clear();
			_instance.layerAboveHUD.add(white);
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});

		s([50, 1], 0, 'wiggle');
		s([50, 1], 0, 'drunk');
		s([50, 1], 0, 'tipsy');
		s([50, 1], 0, 'rotatez');
		s([50, 1], 0, 'rotatex');

		s([50, 1], 1, 'receptorscroll');

		e([57, 1], 4, FlxEase.cubeInOut, 0, 'receptorscroll');

		// Vibrato

		s([50, 9], 0, 'distortwigglescratch', 0);
		e([50, 9], 4, FlxEase.sineIn, 15, 'distortwigglescratch', 0);
		e([50, 9], 2, FlxEase.sineInOut, 1, 'distortwiggle', 0);
		e([51, 9], 0.5, FlxEase.sineInOut, 0.2, 'distortwiggle', 0);
		e([51, 9], 1, FlxEase.sineIn, 0, 'distortwigglescratch', 0);

		e([52, 13], 3, FlxEase.sineIn, 15, 'distortwigglescratch', 0);
		e([52, 13], 2, FlxEase.sineInOut, 2, 'distortwiggle', 0);
		e([53, 9], 0.5, FlxEase.sineInOut, 0.2, 'distortwiggle', 0);
		e([53, 9], 1, FlxEase.sineIn, 0, 'distortwigglescratch', 0);

		s([54, 1], 0, 'distortwigglescratch', 1);
		e([54, 1], 2, FlxEase.sineIn, 5, 'distortwigglescratch', 1);
		e([54, 1], 0.5, FlxEase.sineInOut, 2, 'distortwiggle', 1);
		e([54, 9], 0.5, FlxEase.sineInOut, 0.2, 'distortwiggle', 1);
		e([54, 9], 1, FlxEase.sineIn, 0, 'distortwigglescratch', 1);

		e([54, 13], 3, FlxEase.sineIn, 5, 'distortwigglescratch', 1);
		e([54, 13], 1, FlxEase.sineInOut, 1, 'distortwiggle', 1);
		e([55, 9], 2, FlxEase.sineInOut, 0.2, 'distortwiggle', 1);
		e([55, 9], 2, FlxEase.sineIn, 0, 'distortwigglescratch', 1);

		e([56, 1], 0.25, FlxEase.sineInOut, 3, 'distortwiggle', 1);
		e([56, 1], 3, FlxEase.quadOut, 5, 'distortwigglescratch', 1);
		e([56, 2], 4, FlxEase.sineIn, 0.2, 'distortwiggle', 1);
		e([56, 12], 1, FlxEase.sineIn, 0, 'distortwigglescratch', 1);

		e([57, 1], 2, FlxEase.sineIn, 5, 'distortwigglescratch', 1);
		e([57, 1], 1, FlxEase.sineInOut, 3, 'distortwiggle', 1);
		e([57, 9], 2, FlxEase.sineInOut, 0.2, 'distortwiggle', 1);
		e([57, 1], 2, FlxEase.sineIn, 0, 'distortwigglescratch', 1);

		e([62, 1], 2, FlxEase.sineInOut, 3, 'distortwiggle');
		e([62, 13], 1, FlxEase.sineInOut, 1, 'distortwiggle');
		e([63, 1], 0.5, FlxEase.sineInOut, 0.2, 'distortwiggle');
		e([63, 1], 1, FlxEase.sineIn, 0, 'distortwigglescratch');

		// End vibrato

		var kickPattern = [
			1, 7, 13, 3 + 16, 5 + 16, 11 + 16, 15 + 16, 1 + 32, 7 + 32, 13 + 32, 3 + 48, 5 + 48, 11 + 48, 13 + 48, 1 + 64, 7 + 64, 13 + 64, 3 + 80, 7 + 80,
			11 + 80, 13 + 80, 1 + 96, 7 + 96, 13 + 96
		];

		var altKick = 0;
		for (step in kickPattern)
		{
			e([58, step], 1, FlxEase.circOut, alt(altKick + 1) * 0.5, 'rotatey');

			s([58, step], -1, 'tinyx');
			s([58, step], 1, 'tinyy');
			e([58, step], 0.75, FlxEase.sineOut, 0, 'tinyx');
			e([58, step], 0.75, FlxEase.sineOut, 0, 'tinyy');

			s([58, step], 3, 'wiggle');
			e([58, step], 0.75, FlxEase.sineOut, 1, 'wiggle');

			s([58, step], alt(altKick) * 50, 'x');
			e([58, step], 0.75, FlxEase.sineOut, 0, 'x');

			s([58, step], 1, 'drunk');
			e([58, step], 0.75, FlxEase.backInOut, 0, 'drunk');
			altKick++;
		}

		for (bar in [59, 61])
		{
			for (i in 0...4)
			{
				e([bar, 1 + 4 * (i - 1)], 1, FlxEase.elasticOut, Math.PI * 2 / 4 * (i + 1), 'confusionzoffset');
			}
		}

		e([64, 12], 1, FlxEase.sineInOut, 0, 'wiggle');
		e([64, 12], 1, FlxEase.sineInOut, 0, 'tipsy');
		e([65, 1], 0.25, FlxEase.sineInOut, 0, 'rotatey');

		e([64, 13], 0.5, FlxEase.sineOut, -0.5 * FlxG.height, 'z');
		e([64, 15], 0.5, FlxEase.sineIn, 0, 'z');
		e([65, 1], 0.1, FlxEase.sineInOut, 0.1 * FlxG.height, 'z');
		e([65, 2], 0.25, FlxEase.sineOut, 0, 'z');

		var fillPattern = [3, 4, 6, 7, 9, 10, 12, 14, 15, 16];

		var shaderOn = false;
		var black = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		for (step in fillPattern)
		{
			shaderOn = !shaderOn;
			e([65, step], 0.25, FlxEase.sineOut, shaderOn ? 1 : 0, 'invert');
			if (shaderOn)
			{
				f([65, step], () ->
				{
					_instance.layerAboveGame.add(black);
				});
			}
			else
			{
				f([65, step], () ->
				{
					_instance.layerAboveGame.remove(black);
				});
			}
		}
	}

	function Section3()
	{
		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);

		f([66, 1], () ->
		{
			_instance.layerBelowGame.clear();
			_instance.layerAboveHUD.add(white);
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});

		f([66, 1], () ->
		{
			var noise = new FalseParadiseBackgroundSprite(true);
			noise.scrollFactor.set();
			_instance.layerBelowGame.add(noise);
		});

		var kickpattern = [1, 5, 9, 12, 15];
		var kickpattern2 = [1, 5, 9, 15];

		var alt = 0;
		for (bar in 66...69)
		{
			for (step in kickpattern)
			{
				s([bar, step], this.alt(alt), 'tipsy');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'tipsy');
				s([bar, step], this.alt(alt) * 30, 'x');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'x');
				alt++;
			}
		}
		for (step in kickpattern2)
		{
			s([69, step], this.alt(alt), 'tipsy');
			e([69, step], 1, FlxEase.cubeOut, 0, 'tipsy');
			s([69, step], this.alt(alt) * 30, 'x');
			e([69, step], 1, FlxEase.cubeOut, 0, 'x');
			alt++;
		}
		for (bar in 70...78)
		{
			for (step in kickpattern)
			{
				s([bar, step], this.alt(alt), 'tipsy');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'tipsy');
				s([bar, step], this.alt(alt) * 30, 'x');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'x');
				alt++;
			}
		}
		for (bar in 78...81)
		{
			for (step in [1, 5, 9, 13])
			{
				s([bar, step], this.alt(alt), 'tipsy');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'tipsy');
				s([bar, step], this.alt(alt) * 30, 'x');
				e([bar, step], 1, FlxEase.cubeOut, 0, 'x');
				alt++;
			}
		}

		// "Inspired" by UKSRT9 Stage 4a (https://www.youtube.com/watch?v=F69zEKYVLHE&t=42s)
		var solidWhite = new SolidColorEffect(FlxColor.WHITE);
		var solidWhiteShaderFilter = new ShaderFilter(solidWhite.shader);

		s([66, 1], 1, 'beat');

		var columnSwapPattern = [9, 12, 15, 17];

		function AddToggleInvert(alt:Int, barstep:Array<Float>, player:Int)
		{
			if (!IsEasyModo())
			{
				f(barstep, () ->
				{
					if ((alt + 1) % 2 == 1)
						_instance.camNotes.setFilters([solidWhiteShaderFilter]);
					else
						_instance.camNotes.setFilters(null);
				});
				e(barstep, 0.25, FlxEase.sineOut, (alt + 1) % 2, 'invert', player);
			}
			e(barstep, 0.25, FlxEase.sineOut, (alt + 1) % 2 * Math.PI / 2, 'confusionzoffset', player);
		}

		for (bar in [66, 67, 68, 70, 71, 72])
		{
			var alt = 0;
			for (step in columnSwapPattern)
			{
				AddToggleInvert(alt, [bar, step], 0);
				alt++;
			}
		}
		for (bar in [69])
		{
			var alt = 0;
			for (step in [1, 7, 15, 17])
			{
				AddToggleInvert(alt, [bar, step], 0);
				alt++;
			}
		}

		if (!IsEasyModo())
		{
			e([69, 1], 1.5, FlxEase.circOut, Math.PI, 'rotatey', 0);
			e([69, 7], 2, FlxEase.circOut, 0, 'rotatey', 0);
		}

		for (bar in [73])
		{
			var alt = 0;
			for (step in [1, 5, 7, 11, 14, 17])
			{
				AddToggleInvert(alt, [bar, step], 0);
				alt++;
			}
		}
		for (bar in [74, 75, 76])
		{
			var alt = 0;
			for (step in columnSwapPattern)
			{
				AddToggleInvert(alt, [bar, step], -1);
				alt++;
			}
		}
		for (bar in [77])
		{
			var alt = 0;
			for (step in [1, 7, 15, 17])
			{
				AddToggleInvert(alt, [bar, step], -1);
				alt++;
			}
		}

		if (!IsEasyModo())
		{
			e([77, 1], 1.5, FlxEase.circOut, Math.PI, 'rotatey');
			e([77, 7], 2, FlxEase.circOut, 0, 'rotatey');
		}

		for (bar in [78, 79, 80])
		{
			var alt = 0;
			for (step in [5, 9, 12, 16])
			{
				AddToggleInvert(alt, [bar, step], -1);
				alt++;
			}
		}
		var p1Center = -50 - Note.swagWidth * 2;

		e([81, 1], 4, FlxEase.sineIn, -FlxG.width * 2, 'x', 0);
		for (bar in [81])
		{
			var alt = 0;
			for (step in [1, 4, 7, 10])
			{
				e([bar, step], 0.25, FlxEase.backOut, p1Center * alt * 0.25, 'x', 1);
				e([bar, step], 0.25, FlxEase.backOut, 0.2 * this.alt(alt), 'rotatez', 1);
				s([bar, step], 0.5, 'tinyy', 1);
				s([bar, step], -0.5, 'tinyx', 1);
				e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyy', 1);
				e([bar, step + 1], 0.25, FlxEase.sineOut, 0, 'tinyx', 1);
				alt++;
			}
		}
		f([81, 1], () ->
		{
			_instance.layerBelowGame.clear();
		});

		s([81, 1], 0, 'beat');

		e([81, 1], 0.5, FlxEase.circOut, 0.5, 'camgamezoom');
		e([81, 4], 0.5, FlxEase.circOut, 1, 'camgamezoom');
		e([81, 7], 0.5, FlxEase.circOut, 1.5, 'camgamezoom');
		e([81, 10], 0.5, FlxEase.circOut, 2, 'camgamezoom');
		e([81, 13], 0.5, FlxEase.circOut, 2.5, 'camgamezoom');
		e([81, 13], 0.5, FlxEase.circInOut, 0, 'camgamezoom');

		e([81, 9], 2, FlxEase.circIn, Math.PI * 4, 'rotatey');

		e([81, 9], 2, FlxEase.circIn, Math.PI * 4, 'rotatey');
		s([82, 4], 0, 'rotatey');

		e([81, 13], 0.25, FlxEase.backOut, p1Center, 'x', 1);
		e([81, 13], 0.25, FlxEase.backOut, 0, 'rotatez', 1);
		s([81, 13], 0.5, 'tinyy', 1);
		s([81, 13], -0.5, 'tinyx', 1);
		e([81, 14], 0.25, FlxEase.sineOut, 0, 'tinyy', 1);
		e([81, 14], 0.25, FlxEase.sineOut, 0, 'tinyx', 1);
	}

	function Glitchy()
	{
		var falseParadiseGlitchy = new FalseParadiseGlitchy();

		f([82, 1], () ->
		{
			_instance.camGameCopy.setFilters([_instance.planeRaymarcherFilter, new ShaderFilter(falseParadiseGlitchy.shader)]);
			_instance.camNotes.setFilters([new ShaderFilter(falseParadiseGlitchy.shader)]);
		});
		t([82, 1], falseParadiseGlitchy, 128, FlxEase.linear, {time: 20}, null, (t) ->
		{
			falseParadiseGlitchy.update();
		});
		t([110, 1], falseParadiseGlitchy, 16, FlxEase.linear, {chromaticAberration: 0.03}, null);
	}

	function Section4()
	{
		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		f([82, 1], () ->
		{
			_instance.layerBelowGame.clear();
			white.alpha = 1;
			_tween.tween(white, {alpha: 0}, 2);
		});

		e([81, 15], 1, FlxEase.circInOut, 0, 'x', 1);

		e([81, 15], 1, FlxEase.circInOut, 1, 'camgameoverride');
		e([81, 15], 1, FlxEase.circInOut, 70, 'camgameoverridex');
		e([81, 15], 1, FlxEase.circInOut, 140, 'camgameoverridey');

		e([81, 13], 1, FlxEase.circInOut, 1, 'wiggle', -1);
		e([81, 15], 1, FlxEase.circInOut, -Math.PI / 2, 'centerrotatez', -1);
		e([81, 15], 1, FlxEase.backInOut, 1, 'arrowshape', 1);

		e([81, 15], 1, FlxEase.circInOut, 1, 'camgamerm');
		e([81, 15], 1, FlxEase.circInOut, 1, 'camgamermx');
		e([81, 15], 1, FlxEase.circInOut, 0, 'camgamermy');

		e([84, 1], 1, FlxEase.circInOut, 0, 'camgamermx');
		e([84, 1], 1, FlxEase.circInOut, 1, 'camgamermy');
		e([84, 1], 1, FlxEase.circInOut, 0, 'centerrotatez', -1);

		e([85, 1], 1, FlxEase.circInOut, 0, 'camgamermx');
		e([85, 1], 1, FlxEase.circInOut, -1, 'camgamermy');
		e([85, 1], 1, FlxEase.circInOut, Math.PI, 'centerrotatex', -1);

		e([86, 1], 1, FlxEase.circInOut, -1, 'camgamermx');
		e([86, 1], 1, FlxEase.circInOut, 0, 'camgamermy');
		e([86, 1], 1, FlxEase.circInOut, 0, 'centerrotatex', -1);
		e([86, 1], 1, FlxEase.circInOut, Math.PI / 2, 'centerrotatez', -1);

		e([88, 1], 1, FlxEase.circInOut, 0, 'camgamermx');
		e([88, 1], 1, FlxEase.circInOut, 1, 'camgamermy');
		e([88, 1], 1, FlxEase.circInOut, 0, 'centerrotatez', -1);

		e([89, 1], 1, FlxEase.circInOut, -1, 'camgamermy');
		e([89, 1], 1, FlxEase.circInOut, Math.PI, 'centerrotatez', -1);

		var gfPath = 'mod:mod_assets/FalseParadiseMod/weeks/gf/GF_assets_sign_fnfsrt';

		var gfSign = new FlxSprite();
		gfSign.frames = FlxAtlasFrames.fromSparrow('${gfPath}.png', '${gfPath}.xml');
		gfSign.animation.addByPrefix('sign', 'GF sign', 24, false);
		gfSign.offset.set(-392, -139);
		gfSign.antialiasing = true;
		gfSign.visible = true;
		f([1, 1], () ->
		{
			gfSign.visible = false;
		});
		_state.add(gfSign);
		f([89, 15], () ->
		{
			gfSign.visible = true;
			gfSign.animation.play('sign');
			_state.gf.visible = false;
		});
		f([90, 9], () ->
		{
			gfSign.visible = false;
			_state.gf.visible = true;
		});

		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		f([90, 9], () ->
		{
			_instance.layerAboveHUD.add(white);
			_tween.tween(white, {alpha: 0}, 2);
		});

		var camGameRmSpiralTime = {
			time: 0.0,
			amp: 0.8,
		};
		t([90, 9], camGameRmSpiralTime, 28, FlxEase.linear, {time: 28.0}, null, (t) ->
		{
			_timeline.getNoteMod('camgamermx').setLegacyPercent(Math.sin(camGameRmSpiralTime.time) * camGameRmSpiralTime.amp, 0);
			_timeline.getNoteMod('camgamermy').setLegacyPercent(Math.cos(camGameRmSpiralTime.time) * camGameRmSpiralTime.amp, 0);
		});
		t([97, 9], camGameRmSpiralTime, 2, FlxEase.sineOut, {time: 30.0, amp: 0.0}, null, (t) ->
		{
			_timeline.getNoteMod('camgamermx').setLegacyPercent(Math.sin(camGameRmSpiralTime.time) * camGameRmSpiralTime.amp, 0);
			_timeline.getNoteMod('camgamermy').setLegacyPercent(Math.cos(camGameRmSpiralTime.time) * camGameRmSpiralTime.amp, 0);
		});

		e([89, 13], 2, FlxEase.sineInOut, 100, 'camgameoverridex');
		e([89, 13], 2, FlxEase.sineInOut, 0, 'camgameoverridey');

		e([89, 13], 1, FlxEase.sineIn, 0.3, 'camgamezoom');
		e([89, 9], 2, FlxEase.circInOut, 0, 'camgamermx');
		e([89, 9], 2, FlxEase.circInOut, 0, 'camgamermy');

		e([90, 1], 1.5, FlxEase.sineOut, 1, 'camgamezoom');
		e([90, 7], 1.5, FlxEase.sineInOut, 0, 'camgamezoom');

		e([90, 7], 1, FlxEase.sineInOut, 70, 'camgameoverridex');
		e([90, 7], 1, FlxEase.sineInOut, 140, 'camgameoverridey');

		e([89, 12], 2, FlxEase.circIn, 1 * FlxG.height, 'z', 1);
		e([90, 1], 1, FlxEase.circInOut, 0, 'arrowshape', -1);
		e([90, 9], 1, FlxEase.circInOut, 0, 'z', 1);
		e([90, 9], 1, FlxEase.sineOut, 1, 'spiral', 1);

		e([94, 1], 4, FlxEase.circInOut, 160 * 0.7 * 0.3, 'spiraldist');

		e([96, 1], 4, FlxEase.circInOut, 0, 'spiraldist');

		e([97, 9], 2, FlxEase.elasticOut, 0, 'spiral');
		e([97, 9], 4, FlxEase.elasticOut, 0, 'x');
		e([97, 13], 2, FlxEase.elasticOut, 0, 'centerrotatez');
	}

	function Section5()
	{
		e([98, 1], 4, FlxEase.sineInOut, 0, 'camgameoverride');

		e([98, 1], 4, FlxEase.elasticOut, 0.25, 'counterclockwise', 1);
		e([101, 1], 4, FlxEase.elasticOut, 0, 'counterclockwise');
		e([102, 1], 4, FlxEase.elasticOut, 0.25, 'counterclockwise', 0);

		e([102, 1], 4, FlxEase.elasticOut, 0.75, 'flip', 0);
		e([102, 1], 4, FlxEase.elasticOut, 0.75, 'invert', 0);
		e([102, 1], 4, FlxEase.elasticOut, 1, 'invert', 1);

		e([104, 1], 4, FlxEase.elasticOut, 0, 'flip', 0);
		e([104, 1], 4, FlxEase.elasticOut, 0, 'invert');
		e([104, 1], 4, FlxEase.elasticOut, 0, 'counterclockwise');

		var swapPattern = [1, 4, 7, 10, 12, 15];
		for (step in swapPattern)
		{
			s([105, step], -1, 'tinyx');
			s([105, step], 1, 'tinyy');
			e([105, step], 0.75, FlxEase.sineOut, 0, 'tinyx');
			e([105, step], 0.75, FlxEase.sineOut, 0, 'tinyy');
		}

		e([105, 1], 0.75, FlxEase.circOut, 0, 'wiggle');
		e([105, 1], 0.75, FlxEase.circOut, 1, 'invert');
		e([105, 4], 0.75, FlxEase.circOut, 0.75, 'flip');
		e([105, 4], 0.75, FlxEase.circOut, 0.75, 'invert');
		e([105, 7], 0.75, FlxEase.circOut, -1, 'invert');
		e([105, 7], 0.75, FlxEase.circOut, 1, 'flip');
		e([105, 10], 0.5, FlxEase.circOut, -0.75, 'invert');
		e([105, 10], 0.5, FlxEase.circOut, 0.25, 'flip');
		e([105, 12], 0.75, FlxEase.circOut, 0, 'invert');
		e([105, 12], 0.75, FlxEase.circOut, 0.5, 'flip');
		e([105, 15], 0.5, FlxEase.circOut, 0.0, 'flip');
		e([105, 15], 0.75, FlxEase.circOut, 0.2, 'wiggle');

		s([106, 1], 1, 'arrowpath');
		e([106, 1], 4, FlxEase.elasticOut, -FlxG.width, 'x', 0);

		if (PlayState.storyDifficulty == 2)
			e([106, 1], 4, FlxEase.elasticOut, 1, 'counterclockwise');
		else
		{
			e([106, 1], 4, FlxEase.elasticOut, 0.5, 'counterclockwise');
			e([106, 1], 4, FlxEase.elasticOut, -200, 'x', 1);
		}

		e([110, 1], 4, FlxEase.elasticOut, 0, 'counterclockwise');
		e([110, 1], 4, FlxEase.elasticOut, 0, 'x');
		s([110, 1], 0, 'arrowpath');
		e([109, 9], 4, FlxEase.circInOut, 0, 'eyeshape', 1);

		e([113, 8], 8, FlxEase.sineIn, 1, 'camgameoverride');
		e([113, 8], 8, FlxEase.sineIn, -FlxG.height, 'camgameoverridey');
		e([110, 1], 16, FlxEase.circIn, 10, 'vibrate');
	}

	function End()
	{
		var white = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		f([114, 1], () ->
		{
			var clouds = new CloudFlightBackground(!this._modInstance.optionDisableBGShader);
			clouds.scrollFactor.set();
			clouds.alpha = 0;
			_instance.camGameCopy.setFilters(null);
			_instance.camNotes.setFilters(null);
			_instance.layerBelowGame.add(clouds);
			_instance.layerAboveHUD.add(white);
			_tween.tween(white, {alpha: 0}, 2);

			clouds.alpha = 1;
		});
		s([114, 1], -FlxG.height, 'y', 0);
		e([114, 1], 1, FlxEase.circOut, 0, 'vibrate');
		e([114, 1], 15, FlxEase.circIn, FlxG.height * 2, 'y', 1);
		e([114, 1], 48, FlxEase.sineInOut, -9, 'centerrotatex', 1);
		e([114, 1], 48, FlxEase.sineInOut, 9, 'centerrotatey', 1);
		s([114, 1], 1, 'arrowpath0', 1);
		e([114, 1], 4, FlxEase.elasticOut, 1, 'eyeshape', 1);
	}
}
class FalseParadiseShoutoutsState extends FlxTransitionableState
{
	override function create()
	{
		var credits = new FlxSprite().loadGraphic('mod:mod_assets/FalseParadiseMod/preload/weeks/credits.png');
		credits.antialiasing = true;
		add(credits);
		StateConstants.MAIN_MENU_STATE = GroovinMainMenuState;
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (PlayerSettings.player1.controls.ACCEPT)
			FlxG.switchState(MainMenuState.Create());
	}
}

class CloudFlight
{
	public var time(get, set):Float;

	function get_time():Float
	{
		return shader.iTime.value[0];
	}

	function set_time(value:Float):Float
	{
		shader.iTime.value = [value];
		return value;
	}

	public var shader(default, null):CloudFlightShader = new CloudFlightShader();

	public function update(elapsed:Float)
	{
		time += elapsed;
	}

	public function new(sprite:FlxSprite):Void
	{
		shader.iResolution.value = [sprite.width, sprite.height];
		shader.iTime.value = [0];
	}
}

class CloudFlightShader extends FlxShader
{
	@:glFragmentSource("
    
    uniform vec2 iResolution;
    uniform float iTime;
    #pragma header
    /*

        Cloud Flight
        ------------

        Yet another cloud shader. :) However, just to be a little different, this particular one
        takes the camera through the clouds - as opposed to over or under. The scene is supposed 
        to look a little artificial or cartoony, so I wouldn't take it too seriously. :)

        There are plenty of realistic cloud shaders on Shadertoy, so I thought I'd do a stylized
        version. Plus, I had to cheap out on everything, so realism wasn't exactly an option. :)
        The colors and contrast have deliberately been exaggerated to give it more of a surreal 
        feel. The ramped up contrast also serves to allow the viewer to more easily discern the 
        individual cloud shapes. 

        In case anyone was wondering, the cloud shapes were emphasized by assigning a much higher 
        weighting to the larger low frequency base layers. Giving the clouds a denser look was a 
        style choice, but it's possible to make them fluffier and more traditional looking with 
        a few tweaks here and there.

        One of the things you figure out pretty quickly when doing this kind of thing is that when 
        you don't have enough iterations to work with, fake physics tend to work better than real
        physics. For real shadows, you need to traverse toward the light several times. In this 
        example, you're doing so just once, which is bordering on pathetic. :) Therefore, it's 
        necessary to darken the one-tap shadow value to give the impression that more shadowing 
        is happening. However, you'll never produce a real shadow cast, no matter how hard you try.

        It'd be nice to put up an example with volumetric shadowing, etc, but I don't think the
        average GPU is quite fast enough yet. Having said that, I might see what I can come up
        with.
        
        Based on:
        
        Cloudy Spikeball - Duke
        https://www.shadertoy.com/view/MljXDw
        // Port from a demo by Las - Worth watching.
        // http://www.pouet.net/topic.php?which=7920&page=29&x=14&y=9

        // One of my favorite volumetric examples. This one has shadowing. So nice. Fast, all
        // things considered, but still requires a fast machine to run it properly.
        Volumetric Stanford Bunny - SebH
        https://www.shadertoy.com/view/MdlyDs

    */

    #define FAR 60.


    // A between cloud layers look, between the individual clouds, a more conventional fluffy cloud look,
    // or right through them. I prefer the latter arrangement, but it doesn't give a clear enough view.
    #define ARRANGEMENT 0 // 0, 1, 2 or 3: Layered, path (tunnel in disguise), fluffy layered, just cloud.

    // Standard 2D rotation formula - See Nimitz's comment.
    mat2 r2(in float a){ float c = cos(a), s = sin(a); return mat2(c, s, -s, c); }

    // Smooth maximum, based on IQ's smooth minimum.
    float smax(float a, float b, float s){
        
        float h = clamp(.5 + .5*(a - b)/s, 0., 1.);
        return mix(b, a, h) + h*(1. - h)*s;
    }

    // Hash function. This particular one probably doesn't disperse things quite 
    // as nicely as some of the others around, but it's compact, and seems to work.
    //
    vec3 hash33(vec3 p){ 
        float n = sin(dot(p, vec3(7, 157, 113)));    
        return fract(vec3(2097152, 262144, 32768)*n); 
    }

    // Textureless 3D Value Noise:
    //
    // This is a rewrite of IQ's original. It's self contained, which makes it much
    // easier to copy and paste. I've also tried my best to minimize the amount of 
    // operations to lessen the work the GPU has to do, but I think there's room for
    // improvement. I have no idea whether it's faster or not. It could be slower,
    // for all I know, but it doesn't really matter, because in its current state, 
    // it's still no match for IQ's texture-based, smooth 3D value noise.
    //
    // By the way, a few people have managed to reduce the original down to this state, 
    // but I haven't come across any who have taken it further. If you know of any, I'd
    // love to hear about it.
    //
    // I've tried to come up with some clever way to improve the randomization line
    // (h = mix(fract...), but so far, nothing's come to mind.
    float n3D(vec3 p){
        
        // Just some random figures, analogous to stride. You can change this, if you want.
        const vec3 s = vec3(7, 157, 113);
        
        vec3 ip = floor(p); // Unique unit cell ID.
        
        // Setting up the stride vector for randomization and interpolation, kind of. 
        // All kinds of shortcuts are taken here. Refer to IQ's original formula.
        vec4 h = vec4(0., s.yz, s.y + s.z) + dot(ip, s);
        
        p -= ip; // Cell's fractional component.
        
        // A bit of cubic smoothing, to give the noise that rounded look.
        p = p*p*(3. - 2.*p);
        
        // Smoother version of the above. Weirdly, the extra calculations can sometimes
        // create a surface that's easier to hone in on, and can actually speed things up.
        // Having said that, I'm sticking with the simpler version above.
        //p = p*p*p*(p*(p * 6. - 15.) + 10.);
        
        // Even smoother, but this would have to be slower, surely?
        //vec3 p3 = p*p*p; p = ( 7. + ( p3 - 7. ) * p ) * p3;	
        
        // Cosinusoidal smoothing. OK, but I prefer other methods.
        //p = .5 - .5*cos(p*3.14159);
        
        // Standard 3D noise stuff. Retrieving 8 random scalar values for each cube corner,
        // then interpolating along X. There are countless ways to randomize, but this is
        // the way most are familar with: fract(sin(x)*largeNumber).
        h = mix(fract(sin(h)*43758.5453), fract(sin(h + s.x)*43758.5453), p.x);
        
        // Interpolating along Y.
        h.xy = mix(h.xz, h.yw, p.y);
        
        // Interpolating along Z, and returning the 3D noise value.
        return mix(h.x, h.y, p.z); // Range: [0, 1].
        
    }

    // The path is a 2D sinusoid that varies over time, depending upon the frequencies, and amplitudes.
    vec2 path(in float z){ 

        //return vec2(0); // Straight path.
        return vec2(sin(z*.075)*8., cos(z*.1)*.75*2.); // Windy path.
        
    }

    // Distance function. Just some layered noise, and depending on the arrangement, some shapes
    // smoothy carved out.
    float map(vec3 p) {
        
        // Time factor.
        vec3 t = vec3(1, .5, .25)*iTime;

        
        // Two base layers of low fregency noise to shape the clouds. It's been contracted in the Y
        // direction, since a lot clouds seem to look that way.
        float mainLayer = n3D(p*vec3(.4, 1, .4))*.66 + n3D(p*vec3(.4, 1, .4)*2.*.8)*.34 - .0;    
        
        // Three layers of higher frequency noise to add detail.
        float detailLayer = n3D(p*3. + t)*.57 +  n3D(p*6.015 + t*2.)*.28 +  n3D(p*12.01 + t*4.)*.15 - .0;
        // Two layers, if you're computer can't handle three.
        //float detailLayer = n3D(p*3. + t)*.8 +  n3D(p*12. + t*4.)*.2;

        // Higher weighting is given to the base layers than the detailed ones.
        float clouds = mainLayer*.84 + detailLayer*.16;
        
        
        #if (ARRANGEMENT != 3)
        // Mapping the hole or plane around the path.
        p.xy -= path(p.z);
        #endif
        
        
        // Between cloud layers.
        #if (ARRANGEMENT == 0) // Layered.
        //return smax(tn, -abs(p.y) + 1.1 + (clouds - .5), .5) + (clouds - .5);
        return smax(clouds, -length(p.xy*vec2(1./32., 1.)) + 1.1 + (clouds - .5), .5) + (clouds - .5);
        #elif (ARRANGEMENT == 1) // Path - Tunnel in disguise.
        // Mapping the hole around the path.
        return smax((clouds - .25)*2., -smax(abs(p.x) - .5, abs(p.y) - .5, 1.), 2.);
        #elif (ARRANGEMENT == 2) // Path - Tunnel in disguise.
        // Between layers, but with fluffier clouds.
        return smax(clouds - .075, -length(p.xy*vec2(1./32., 1.)) + 1.1 + (clouds - .5), .5) + (clouds - .5)*.35;
        #else // The clouds only.
        return (clouds - .25)*2.; 
        //return tn; // Fluffier, but blurrier.
        #endif
    
    


    }


    // Less accurate 4 tap (3 extra taps, in this case) normal calculation. Good enough for this example.
    vec3 fNorm(in vec3 p, float d){
        
        // Note the large sampling distance.
        vec2 e = vec2(.075, 0); 

        // Return the normal.
        return normalize(vec3(d - map(p - e.xyy), d - map(p - e.yxy), d - map(p - e.yyx)));
    }

    void main(){
        vec2 fragCoord = openfl_TextureCoordv * iResolution;
        
        // Screen coordinates.
        vec2 uv = (fragCoord - iResolution.xy*.5)/iResolution.y;
        
        // Subtle pixel blur.
        //vec2 hv = mod(fragCoord, 2.);
        //uv += (1. - step(hv, vec2(1))*2.)*1./iResolution.y;


        // Ray origin. Moving along the Z-axis.
        vec3 ro = vec3(0, 0, iTime*4.);
        vec3 lk = ro + vec3(0, 0, .25);  // Look At position.
        
        // Using the Z-value to perturb the XY-plane.
        // Sending the camera, look at, and light vector down the path. The path function is 
        // synchronized with the distance function.
        ro.xy += path(ro.z);
        lk.xy += path(lk.z);

        
        // Using the above to produce the unit ray-direction vector.
        float FOV = 3.14159/2.75; // FOV - Field of view.
        vec3 forward = normalize(lk-ro);
        vec3 right = normalize(vec3(forward.z, 0., -forward.x )); 
        vec3 up = cross(forward, right);

        // rd - Ray direction.
        vec3 rd = normalize(forward + FOV*uv.x*right + FOV*uv.y*up);
        //rd = normalize(vec3(rd.xy, rd.z - length(rd.xy)*.15));
        
        // Camera swivel - based on path position.
        vec2 sw = path(lk.z);
        rd.xy *= r2(-sw.x/24.);
        rd.yz *= r2(-sw.y/16.);
        

        // The ray is effectively marching through discontinuous slices of noise, so at certain
        // angles, you can see the separation. A bit of randomization can mask that, to a degree.
        // At the end of the day, it's not a perfect process. Anyway, the hash below is used to
        // at jitter to the jump off point (ray origin).
        //    
        // It's also used for some color based jittering inside the loop.
        vec3 rnd = hash33(rd.yzx + fract(iTime));

        // Local density, total density, and weighting factor.
        float lDen = 0., td = 0., w = 0.;

        // Closest surface distance, a second sample distance variable, and total ray distance 
        // travelled. Note the comparitively large jitter offset. Unfortunately, due to cost 
        // cutting (64 largish steps, it was  necessary to get rid of banding.
        float d = 1., d2 = 0., t = dot(rnd, vec3(.333));

        // Distance threshold. Higher numbers give thicker clouds, but fill up the screen too much.    
        const float h = .5;


        // Initializing the scene color to black, and declaring the surface position vector.
        vec3 col = vec3(0), sp;
        
        // Directional light. Don't quote me on it, but I think directional derivative lighting
        // only works with unidirectional light... Thankfully, the light source is the cun which 
        // tends to be unidirectional anyway.
        vec3 ld = normalize(vec3(-.2, .3, .8));
        
        
        // Using the light position to produce a blueish sky and sun. Pretty standard.
        vec3 sky = mix(vec3(1, 1, .9), vec3(.19, .35, .56), rd.y*0.5 + 0.5);
        //sky = mix(sky, mix(vec3(1, .8, .7), vec3(.31, .52, .73), rd.y*0.5 + 0.5), .5);
        
        
        // Sun position in the sky - Note that the sun has been cheated down a little lower for 
        // aesthetic purposes. All this is fake anyway.
        vec3 fakeLd = normalize(vec3(-.2, .3, .8*1.5));
        float sun = clamp(dot(fakeLd, rd), 0.0, 1.0);
        
        
        
        // Combining the clouds, sky and sun to produce the final color.
        sky += vec3(1, .3, .05)*pow(sun, 5.)*.25; 
        sky += vec3(1, .4, .05)*pow(sun, 8.)*.35; 
        sky += vec3(1, .9, .7)*pow(sun, 128.)*.5; 

        // Ramping up the sky contrast a bit.
        sky *= sqrt(sky); 
        
        // I thought I'd mix in a tiny bit of sky color with the clouds here... It seemed like a
        // good idea at the time. :)
        vec3 cloudCol = mix(sky, vec3(1, .9, .8), .66);
        


        // Raymarching loop.
        for (int i=0; i<64; i++) {


            sp = ro + rd*t; // Current ray position.
            d = map(sp); // Closest distance to the surface... particle.
            
            // Loop break conditions - If the ray hits the surface, the accumulated density maxes out,
            // or if the total ray distance goes beyong the maximum, break.
            if(d<.001*(1. + t*.125) || td>1. || t>FAR) break;


            // If we get within a certain distance, h, of the surface, accumulate some surface values.
            //
            // Values further away have less influence on the total. When you accumulate layers, you'll
            // usually need some kind of weighting algorithm based on some identifying factor - in this
            // case, it's distance. This is one of many ways to do it. In fact, you'll see variations on 
            // the following lines all over the place.
            //
            // On a side note, you could wrap the next few lines in an if statement to save a
            // few extra map calls, etc. However, some cards hate branching, nesting, etc, so it
            // could be a case of diminishing returns... Not sure what the right call is, so I'll 
            // leave it to the experts. :)
            w = d<h? (1. - td)*(h - d) : 0.;   

            // Use the weighting factor to accumulate density. How you do this is up to you. 
            //td += w*w*8. + 1./64.; // More transparent looking... kind of.
            td += w + 1./64.; // Looks cleaner, but a little washed out.

            
        
            // Lighting calculations.
            // Standard diffuse calculation, using a more expensive four tap tetrahedral normal.
            // However, this will work with point light and enables are normal-based lighting.
            //float diff = max(dot(ld, fNorm(sp, d)), 0.)*2.;
            
            // Directional derivative-based diffuse calculation. Uses only two function taps,
            // but only works with unidirectional light.
            d2 = map(sp + ld*.1);
            // Possibly quicker than the line above, but I feel it overcomplicates things... Maybe. 
            //d2 = d<h? map(sp + ld*.1) : d;
            float diff = max(d2 - d, 0.)*20.; 
            //float diff = max(d2*d2 - d*d, 0.)*20.; // Slightly softer diffuse effect.
            


            // Accumulating the color. You can do this any way you like.
            //
            // Note that 1. - d2 is a very lame one-tap shadow value - Basically, you're traversing
            // toward the light once. It's artificially darkened more by multiplying by d, etc, which
            // was made up on the spot. It's not very accurate, but it's better than no shadowing at all.
            // Also note, that diffuse light gives a shadowy feel, but is not shadowing.
            col += w*max(d*d*(1. - d2)*3. - .05, 0.)*(diff*cloudCol*2. + vec3(.95, 1, 1.05))*2.5; // Darker, brooding.
            // Other variations - Tweak them to suit your needs.
            //col += w*d*(sqrt(diff)*vec3(1, .85, .7)*2. + 2.); // Whiter, softer, fluffier.
            //col += w*d*((1. - exp(-diff*8.)*1.25)*vec3(1, .85, .7)*2. + 2.);
            
        
            // Optional extra: Color-based jittering. Roughens up the clouds that hit the camera lens.
            col *= .98 + fract(rnd*289. + t*41.13)*.04;

            // Enforce minimum stepsize. This is probably the most important part of the procedure.
            // It reminds me a little of of the soft shadows routine.
            t += max(d*.5, .05); //
            //t += 0.25; // t += d*.5;// These also work - It depends what you're trying to achieve.

        }
        
        // Clamp above zero... It might not need it, but just in case.
        col = max(col, 0.);
        
        
        // Postprocessing the cloud color just to more evenly match the background. Made up.
        col *= mix(vec3(1), sky, .25);

        
        // Fogging out the volumetric substance. The fog blend is heavier than usual. It was a style
        // choice - Not sure if was the right one though. :)
        col = mix(col, sky, smoothstep(0., .85, t/FAR));
        col = mix(col, sky*sky*2., 1. - 1./(1.+ t*t*.001));//
        //col += vec3(1, .4, .2)*pow(sun, 16.)*.25; 	
        
        // More postprocessing. Adding some very subtle fake warm highlights.
        vec3 fCol = mix(pow(vec3(1.3, 1, 1)*col, vec3(1, 2, 10)), sky, .5);
        col = mix(fCol, col, dot(cos(rd*6. +sin(rd.yzx*6.)), vec3(.333))*.1 + .9);
        
        
        // If it were up to me, I'd be ramping up the contrast, but I figured it might be a little to
        // broody for some. :)
        //col *= sqrt(col)*1.5;
    
        
        // Subtle vignette.
        uv = fragCoord/iResolution.xy;
        //col *= pow(16.*uv.x*uv.y*(1. - uv.x)*(1. - uv.y) , .25)*.35 + .65;
        // Colored variation.
        col = mix(pow(min(vec3(1.5, 1, 1).zyx*col, 1.), vec3(1, 3, 16)), col, 
                pow(16.*uv.x*uv.y*(1. - uv.x)*(1. - uv.y) , .125)*.5 + .5);
    
        // Done.
        gl_FragColor = vec4(sqrt(min(col, 1.)), 1.0) * vec4(69., 153., 165., 255.) / 255.;
        
    }")
	public function new()
	{
		super();
	}
}

class FalseParadiseCRT
{
	public var shader(default, null):FalseParadiseCRTShader = new FalseParadiseCRTShader();

	public var time = 0.0;
	public var resolutionX:Float = 200;
	public var resolutionY:Float = 90;

	public function update()
	{
		shader.resolution.value = [resolutionX, resolutionY];
		shader.iTime.value = [time];
		time += FlxG.elapsed;
	}

	public function new():Void
	{
		update();
	}
}

class FalseParadiseCRTShader extends FlxShader
{
	@:glFragmentSource("
    #pragma header
    // \"CRT\" Shader by 4mbr0s3 2

    uniform vec2 resolution;
    uniform float iTime;
    vec4 crt(sampler2D s, vec2 uv, vec2 res) 
    {
        vec2 outUV = uv;
        outUV *= res;
        outUV = floor(outUV);
        outUV.x += tan(uv.y * 4. + iTime);
        outUV /= res;
        vec2 line = mix(fract(uv * res), vec2(1.), 0.8);
        vec4 outCol = texture2D(s, outUV);
        return vec4(outCol.rgb * line.y, outCol.a);
    }

    float scanLines(vec2 uv) {
        return sin(uv.y * 10. + iTime * 5.) * 0.2 + 0.3;
    }

    void main()
    {
        vec2 uv = openfl_TextureCoordv;

        vec4 col = crt(bitmap, uv, resolution) + vec4(scanLines(uv));

        gl_FragColor = col;
    }
    ")
	public function new()
	{
		super();
	}
}

class FalseParadiseGlitchy
{
	public var shader(default, null):FalseParadiseGlitchyShader = new FalseParadiseGlitchyShader();

	public var time = 0.0;
	public var chromaticAberration = 0.01;

	public function update()
	{
		shader.iTime.value = [time];
		shader.chromaticAberration.value = [chromaticAberration];

		time += FlxG.elapsed;
	}

	public function new():Void
	{
		update();
	}
}

class FalseParadiseGlitchyShader extends FlxShader
{
	@:glFragmentSource("
    #pragma header
    uniform float chromaticAberration;
    uniform float iTime;

    float rand(vec2 n) { 
        return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
    }

    float noise(vec2 p){
        vec2 ip = floor(p);
        vec2 u = fract(p);
        u = u*u*(3.0-2.0*u);
        
        float res = mix(
            mix(rand(ip),rand(ip+vec2(1.0,0.0)),u.x),
            mix(rand(ip+vec2(0.0,1.0)),rand(ip+vec2(1.0,1.0)),u.x),u.y);
        return res*res;
    }

    void main()
    {
        vec2 uv = openfl_TextureCoordv;

        float time = iTime * 20.;
        float noise = noise(vec2(time) + uv * 5.) * chromaticAberration * 100.;
        vec2 rDir = vec2(chromaticAberration * noise, 0);
        vec2 gDir = vec2(-chromaticAberration * noise, 0);
        vec2 bDir = vec2(0, chromaticAberration * noise);
        float colR = texture2D(bitmap, uv + rDir).r;
        float colG = texture2D(bitmap, uv + gDir).g;
        float colB = texture2D(bitmap, uv + bDir).b;
        float colA = texture2D(bitmap, uv + rDir).a;

        gl_FragColor = vec4(colR, colG, colB, colA);
    }
    ")
	public function new()
	{
		super();
	}
}

class FalseParadiseBackground
{
	public var time(get, set):Float;

	function get_time():Float
	{
		return shader.iTime.value[0];
	}

	function set_time(value:Float):Float
	{
		shader.iTime.value = [value];
		return value;
	}

	public var shader(default, null):FalseParadiseBackgroundShader = new FalseParadiseBackgroundShader();

	public function update(elapsed:Float)
	{
		time += elapsed;
	}

	public function new(sprite:FlxSprite):Void
	{
		shader.iResolution.value = [sprite.width, sprite.height];
		shader.iTime.value = [0];
	}
}

class FalseParadiseBackgroundShader extends FlxShader
{
	@:glFragmentSource("
    #pragma header
// https://www.shadertoy.com/view/fsdGz4
// false paradise background for Schmovin' Mod Test by 4mbr0s3 2
// I couldn't find the exact shader in ZGameEditor so I thought it'd be fun to recreate it from scratch 
// Having After Effects experience really helps with this kind of shader lol

// Fractal Brownian Motion code ripped off this page in the Book of Shaders: 
// https://thebookofshaders.com/13/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

// Start ripped code

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 iResolution;
uniform float iTime;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

// Based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise (in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

#define OCTAVES 3
float fbm (in vec2 st) {
    // Initial values
    float value = 0.0;
    float amplitude = .5;
    float frequency = 0.;
    //
    // Loop of octaves
    for (int i = 0; i < OCTAVES; i++) {
        value += amplitude * noise(st + iTime);
        st *= 2.;
        amplitude *= .5;
    }
    return value;
}

// End ripped code

float topologicalLines(vec2 uv) {
    float noise = fbm(uv);
    float ampMap = (sin(noise * 60. + iTime) + 1.) / 2.;
    return ampMap;
}
float circLines(vec2 uv) {
    vec2 diff = uv - vec2(0.5, 0.5) * iResolution.xy / iResolution.y * 5.;
    float dist = sqrt(dot(diff, diff)) * (5. + sin(iTime));
    return (sin(dist - iTime * 5.) + 1.) / 2.;
}

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv;

    float lines = topologicalLines(uv * iResolution.xy / iResolution.y * 5.);
    float lines2 = circLines(uv * iResolution.xy / iResolution.y * 5.);

    vec4 bgComposite = vec4(69., 153., 165., 255.) / 255.;
    vec4 linesComposite = vec4(234., 223., 172., 255.) / 255.;
    
    vec4 final = mix(mix(linesComposite, bgComposite, lines), bgComposite, lines2);
    // Output to screen
    gl_FragColor = vec4(final);
}")
	public function new()
	{
		super();
	}
}
