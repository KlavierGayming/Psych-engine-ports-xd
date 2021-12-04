local MainY = 0
local offset = 0
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 420;
local xx2 = 732.9;
local yy2 = 450;
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
function onCreate()
	-- background shit
	local MainY = defaultOpponentStrumY0
	--debugPrint(defaultPlayerStrumY1)
	makeLuaSprite('space', 'space', -800, -100);
	setScrollFactor('space', 0.05, 0.2);
	scaleObject('space', 3, 3);

	makeLuaSprite('stageback', 'villagebgburning', -940, -500);
	setScrollFactor('stageback', 0.8, 0.8);
	scaleObject('stageback', 1, 1);
	
	makeLuaSprite('stagefront', 'fore', -1300,-450);
	setScrollFactor('stagefront', 1, 1);
	scaleObject('stagefront', 2, 2);
	    makeAnimatedLuaSprite('speakers', 'Speakers', 200, 435)
    addAnimationByPrefix('speakers', 'bop', 'boombox', 24, false)
	makeAnimatedLuaSprite('loaf', 'gatito', -210, 680)
    addAnimationByPrefix('loaf', 'bop', 'CATO', 24, false)

	-- sprites that only load if Low Quality is turned off
	
addLuaSprite('space', false);
	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	 addLuaSprite('speakers', false);
	 	 addLuaSprite('loaf', true);
	--addLuaSprite('stagelight_left', false);
	--addLuaSprite('stagelight_right', false);
	--addLuaSprite('stagecurtains', false);
	
	--close(true); --nah we need this script running
end
function onBeatHit()
	if curBeat == 176 then
		setProperty('defaultCamZoom',1)
	end
	if curBeat == 180 then
	doTweenY("themotherfucking",'space',4000, 600,"linear")
	doTweenY("themotherfucking2",'stageback',1000,5,'quintOut')
		characterPlayAnim('boyfriend', 'shit', true)
        setProperty('boyfriend.specialAnim', true);
		 setProperty('defaultCamZoom',0.5)
	 	 doTweenZoom('WHEEE','camGame',0.5,1.5,'quintInOut')
	end
objectPlayAnimation('loaf', 'bop', true)
		objectPlayAnimation('speakers', 'bop', true)
	if curBeat >= 180 and curBeat < 480 then
		  cameraShake('camGame',0.02,1.2)
        cameraShake('camHUD',0.001,1.2)
	end
	if curBeat == 480 then 

			 setProperty('defaultCamZoom',0.7)
	 	 doTweenZoom('WHEEE','camGame',0.7,1.5,'quintInOut')
	end
	if curBeat == 512 then
		doTweenAlpha('ohno','camHUD',0,1.5,'quintInOut')
			 setProperty('defaultCamZoom',0.6)
	 	 doTweenZoom('WHEEE','camGame',0.6,1.5,'quintInOut')
	end
	if curBeat == 523 then
		doTweenAlpha('woooom','camGame',0,3,'linear')
	end


end

function onUpdate(elapsed)
	local animName = getProperty('dad.animation.curAnim.name')
	if keyPressed('block') then
		if  getProperty('boyfriend.animation.curAnim.name') == 'shieldHit' or getProperty('boyfriend.animation.curAnim.name') == 'shieldMissDown' or getProperty('boyfriend.animation.curAnim.name') == 'shieldMissLeft'or getProperty('boyfriend.animation.curAnim.name') == 'shieldMissRight'or getProperty('boyfriend.animation.curAnim.name') == 'shieldMissUp' or getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss'or getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss'or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss'   then
			--debugPrint("FUCK")
		else
	--debugPrint("yea")
		--	debugPrint(getProperty('dad.animation.curAnim.name'))

			characterPlayAnim('boyfriend','shieldUp',false)
	
		setProperty('boyfriend.specialAnim', true);
		
		end
	
	else

		--debugPrint("no")
	end
	
	end
	function noteMiss(id, direction, type, isSus)
		if keyPressed('block') then
			setProperty('blocked',true)
			if direction == 0 then
					characterPlayAnim('boyfriend','shieldMissLeft',true)
			end
				if direction == 1 then
					characterPlayAnim('boyfriend','shieldMissUp',true)
			end
			if direction == 2 then
					characterPlayAnim('boyfriend','shieldMissDown',true)
			end
				if direction == 3 then
					characterPlayAnim('boyfriend','shieldMissRight',true)
			end
			
			
			
				setProperty('boyfriend.specialAnim', true);
		end
		
	end
