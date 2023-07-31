function onCreatePost()

	initLuaShader("scroll")
 
  setSpriteShader('speedlines',"scroll")
 end
 
 function onUpdate()
  setShaderFloat("speedlines", "iTime", os.clock())
 end