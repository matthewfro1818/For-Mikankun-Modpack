
function onEvent(name)
	
	if name == 'InsomniaFunniAcchell' then

		function onRecalculateRating()
			if rating <= 0.99 then
				triggerEvent('Camera Follow Pos', '-210', '330')
			triggerEvent('Set Cam Zoom', '1.5', '')
			  runTimer('death', 2.5, 0)
			end
			if rating >= 0.99 then
			  cancelTimer('death')
			triggerEvent('Camera Follow Pos', '', '')
			triggerEvent('Set Cam Zoom', '0.8', '')
			end
		  end
		end
		  
		  function onTimerCompleted(tag)
			if tag == 'death' then
			  setProperty('health', -500)
			end
		  end
		end