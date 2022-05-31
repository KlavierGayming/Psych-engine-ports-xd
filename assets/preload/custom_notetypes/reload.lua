function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'reload' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/reload');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); 
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'reload' then
			playSound('reload', 3);
		characterPlayAnim('boyfriend', 'reload', true);
		setProperty('boyfriend.specialAnim', true);
	end
end