function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'villagebg', -940, -500);
	setScrollFactor('stageback', 0.8, 0.8);
	scaleObject('stageback', 1, 1);
	
	makeLuaSprite('stagefront', 'fore', 350,355);
	setScrollFactor('stagefront', 1, 1);
	scaleObject('stagefront', 2, 2);
			    makeAnimatedLuaSprite('loaf', 'sleepy_gatito', -230, 750)
    addAnimationByPrefix('loaf', 'bop', 'Sleeping', 24, false)

	-- sprites that only load if Low Quality is turned off
	

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('speakers', false);
	--addLuaSprite('stagelight_left', false);
	--addLuaSprite('stagelight_right', false);
	--addLuaSprite('stagecurtains', false);
	
--	close(false); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()

		objectPlayAnimation('speakers', 'bop', true)	
		objectPlayAnimation('loaf', 'bop', true)	
		
end