function onCreate()
	math.randomseed(os.clock() * 1000);
	makeLuaSprite('bg', 'background/endbg', -600, -350);
	setScrollFactor('bg', 0, 0);
	scaleObject('bg', 3, 3);

	makeLuaSprite('ship', 'background/endship', -700, 0);
	setScrollFactor('ship', 0, 0);
	scaleObject('ship', 0.5, 0.5);

	makeLuaSprite('stageback', 'background/endislands', -800, -300);
	setScrollFactor('stageback', 0.8, 0.8);
	scaleObject('stageback', 1, 1);
	
	makeLuaSprite('stagefront', 'background/endfore', -900, 700);
	setScrollFactor('stagefront', 1, 1);
	scaleObject('stagefront', 3, 3);
	
	-- Cameos!
	makeAnimatedLuaSprite('core', 'background/Core', -300, 450)
	addAnimationByPrefix('core', 'bop', 'Core',24,false)
	scaleObject('core', 1.6, 1.6);

	makeAnimatedLuaSprite('lay', 'background/Lay', 1000, 450)
	addAnimationByPrefix('lay', 'bop', 'Lay',24,false)
	scaleObject('lay', 1.4, 1.4);
	makeAnimatedLuaSprite('kade', 'background/KadeDev', 10, 230)
	addAnimationByPrefix('kade', 'bop', 'Kade',24,false)
	scaleObject('kade', 1.5, 1.5);

	makeAnimatedLuaSprite('max','background/mackie', 600,300)
	addAnimationByPrefix('max','bop','MaxBoppinFinished',24,false)
	scaleObject('max', 1.1, 1.1);

	makeAnimatedLuaSprite('kofv','background/CofvBoppin', -525,800)
	addAnimationByPrefix('kofv','bop','CofvBop',24,false)
	scaleObject('kofv', 1.6, 1.6);

	
	addLuaSprite('bg', false);
	addLuaSprite('ship', false);
	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('core', false);
	addLuaSprite('lay', false);
	addLuaSprite('max',false)
	addLuaSprite('kofv',false)
	
end
function onBeatHit()
	objectPlayAnimation('core', 'bop', true)
	objectPlayAnimation('lay', 'bop', true)
	objectPlayAnimation('max', 'bop', true)
	objectPlayAnimation('kofv', 'bop', true)
	objectPlayAnimation('speakers', 'bop', true)
end
function onEvent(name,value1,value2) -- value 1 and value 2 are not needed here but ig its fine to keep them
	if name == 'End Ship' then
		local scale = math.random(0.3,0.35)
		scaleObject('ship', scale, scale);
		setProperty('ship.y',math.random(-150,150)) -- 
		if math.random(0,1) == 1 then
			setProperty('ship.x',-1000)
			setProperty('ship.flipX',false)  -- thanks shado mario
		doTweenX('endship','ship',3000,math.random(4,7),'linear') -- woosh
		else
				setProperty('ship.x',3000)
				setProperty('ship.flipX',true) -- thank shado mar
				doTweenX('endship','ship',-1000,math.random(4,7),'linear') -- woosh
		end
		
		
	end
end

function onUpdate()
	if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.6)
        else
            setProperty('defaultCamZoom',0.7)
        end
   
    end
end