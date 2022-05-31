function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'warning_note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/warning_note');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); 
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

local shootAnims = {"shoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'warning_note' then
			playSound('shoot', 3);
				setProperty('health', 1.3);
		if getProperty('dad.curCharacter') == 'pico-christmas' then
			characterPlayAnim('boyfriend', shootAnims[direction + 1], true);
		else
			characterPlayAnim('boyfriend', 'shoot', true);
		end
		cameraShake('camGame', 0.01, 0.2);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'warning_note' then
		characterPlayAnim('boyfriend', 'singRIGHTmiss', true);
	end
end