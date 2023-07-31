function onCreatePost()

	initLuaShader("scroll")
 
  setSpriteShader('fgPlatform',"scroll")
 end
 
 function onUpdate()
  setShaderFloat("fgPlatform", "iTime", os.clock())
 end