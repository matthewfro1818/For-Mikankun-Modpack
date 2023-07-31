function strumNoteHit(id, direction, isSustainNote)
	if direction == 4 then
		playAnim("gf", "singLEFT", false, false, 0)
	end
	if direction == 5 then
		playAnim("gf", "singDOWN", false, false, 0)
	end
	if direction == 6 then
		playAnim("gf", "singUP", false, false, 0)
	end
	if direction == 7 then
		playAnim("gf", "singRIGHT", false, false, 0)
	end
end