--Last updated 27/12/2021
--adding words
--set the math random in line 56 to the max of words you added (if there were 5 words and you added 5 then change the random to 1, 10)
--make a sprite called "w(number)" ex: w10
--make the lua sprite in the create function
--set the property visible to true for the word's sprite in the event function
--in the onUpdate function follow the format of the other words
--on the onUpdatePost follow the format and add your word's tag

--If you're curious of how everything works there's a rough explanation at the end
--there may be a better way to do this but this is the best i could do lol


function onCreate()

	makeLuaText("showInputted", ' ', 600, 320, 500)
	setTextSize("showInputted", 30)
	setTextFont("VCR.ttf")

end
end