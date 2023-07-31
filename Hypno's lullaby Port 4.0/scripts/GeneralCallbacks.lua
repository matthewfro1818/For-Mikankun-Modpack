function onCreatePost()
    luaDebugMode=true
    local isAndroid=true  --buildTarget=='android'
    addHaxeLibrary('Lua_helper','llua')
    addHaxeLibrary('FlxButton','flixel.ui')
    addHaxeLibrary('FileSystem','sys')
    addHaxeLibrary('FunkinLua')
    
    runHaxeCode([[
        var Buttons=new Array();
        for (script in game.luaArray) { 
            Lua_helper.add_callback(script.lua, "onButtonJustPress", function(buttonTag="") {
                //code
                if(getVar(buttonTag)==null || !]]..tostring(isAndroid)..[[) return false;
                var Result=getVar(buttonTag).justPressed;
                return Result;
            });
            Lua_helper.add_callback(script.lua, "onButtonPress", function(buttonTag="") {
                //code
                if(getVar(buttonTag)==null || !]]..tostring(isAndroid)..[[) return false;
                var Result=getVar(buttonTag).pressed;
                return Result;
            });
            Lua_helper.add_callback(script.lua, "onButtonRelease", function(buttonTag="") {
                //code
                if(getVar(buttonTag)==null || !]]..tostring(isAndroid)..[[) return false;
                var Result=getVar(buttonTag).justReleased;
                return Result;
            });
            Lua_helper.add_callback(script.lua, "MakeButton", function(buttonTag="",ObjectRefTag="",?Text="") {
                //code
                if (buttonTag=="" || ObjectRefTag=="" || !]]..tostring(isAndroid)..[[) return;
                FlxG.mouse.visible=true;
                var ObjectRef=game.getLuaObject(ObjectRefTag);
                if(ObjectRef==null) return;
                var Button=new FlxButton(ObjectRef.x,ObjectRef.y,Text);
                Button.loadGraphic(ObjectRef.pixels,false);
                Button.setGraphicSize(ObjectRef.width,ObjectRef.height);
                Button.updateHitbox();
                Button.alpha=0;
                game.add(Button);
                Button.cameras=ObjectRef.cameras;
                setVar(buttonTag,Button);
                Buttons.push([buttonTag,ObjectRefTag]);
                game.addTextToDebug("Amongus",]]..getColorFromHex('FFFFFF')..[[);
                return true;
            });
            Lua_helper.add_callback(script.lua, "CreatePendelum", function(start=false) {
                //code
                var cervix = "scripts/Mechanics/Pendelum.lua";
			    var doPush = false;
			    if(FileSystem.exists(Paths.modFolders(cervix)))
			    {
				    cervix = Paths.modFolders(cervix);
				    doPush = true;
			    }
			    else if(FileSystem.exists(cervix))
			    {
				    doPush = true;
			    }
			    else {
				    cervix = Paths.getPreloadPath(cervix);
				    if(FileSystem.exists(cervix)) {
					    doPush = true;
				    }
			    }
				for (luaInstance in game.luaArray)
				{
					if(luaInstance.scriptName == cervix)
					{
						return;
					}
				}
				PlayState.instance.luaArray.push(new FunkinLua(cervix));
				

                game.callOnLuas('CreatePendelum',[start]);
                return;
            });
            Lua_helper.add_callback(script.lua, "StartPendelum", function() {
                //code
                game.callOnLuas('StartPendulum',[]);
            });
            script.set("luaDebugMode",true);
        }
        setVar("ButtonList",Buttons);
        game.addTextToDebug("A",]]..getColorFromHex('FFFFFF')..[[);
    ]])
end
--CreatePendelum(start)
--StartPendelum()
function onUpdate(elapsed)
    runHaxeCode([[
        for (Button in getVar("ButtonList")) { 
            var ButtonObj=getVar(Button[0]);
            var ButtonRef=game.getLuaObject(Button[1]);
            ButtonObj.x=ButtonRef.x;
            ButtonObj.y=ButtonRef.y;
            ButtonObj.angle=ButtonRef.angle;
        }
    ]])
end
