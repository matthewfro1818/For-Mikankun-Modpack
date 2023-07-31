function onEvent(name)
    if name == 'unforce windowed' then
     setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
  end
end