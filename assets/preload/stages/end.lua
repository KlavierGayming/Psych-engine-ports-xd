
function onEvent(name,value1,value2) -- value 1 and value 2 are not needed here but ig its fine to keep them
	if name == 'End Ship' then
		local scale = float(0.3,0.35)
		scaleObject('ship', scale, scale);
		setProperty('ship.y', int(-150,150)) -- 
		if bool(50) then
			setProperty('ship.x',-1000)
			setProperty('ship.flipX',false)  -- thanks shado mario
		doTweenX('endship','ship',3000,float(4,7),'linear') -- woosh
		else
				setProperty('ship.x',3000)
				setProperty('ship.flipX',true) -- thank shado mar
				doTweenX('endship','ship',-1000,float(4,7),'linear') -- woosh
		end
		-- math.random sucks penis  xdddd
		quickPrint('pain');
	end
end

function onCreate()
	quickPrint("Creating")
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
	quickPrint("end of creating");
end
function onBeatHit()
	objectPlayAnimation('core', 'bop', true)
	objectPlayAnimation('lay', 'bop', true)
	objectPlayAnimation('max', 'bop', true)
	objectPlayAnimation('kofv', 'bop', true)
	objectPlayAnimation('speakers', 'bop', true)
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




MODULUS = 0;
s=0;
-- HAHA YES, MATH BEING TOTALLY STUPID SO I HAVE TO MAKE MY OWN LUA RANDOMIZER!
function onCreate()
    s = getPropertyFromClass('FlxMath', 'MAX_VALUE_INT')
    MODULUS = s;   
end


internalSeed = 1;
MULTIPLIER = 48271.0

function generate()
    internalSeed = (internalSeed * MULTIPLIER) % MODULUS 
    return internalSeed
end



function int(Min, Max)
	quickPrint("deez nuts")
	-- Random interger function
	-- Checks if min is 0 and max is the maximum interger, if it is, then it'll return an entire random interger with no boundaries
    if Min == 0 and Max == MODULUS then
        return math.floor(generate());
    elseif Min == Max then -- If min and max are equal, it returns the minimum value
        return Min;
    else
		-- if min is higher then max, the values get swapped
        if Min > Max then
			local i = Min
            Min = Max
            Max = i
        end

        local result = 0
        -- generates a random float that gets rounded
        result = math.floor(Min + generate() / MODULUS * (Max - Min + 1))

        return result;
    end
end

function float(Min, Max)
    if Min == 0 and Max == 1 then
        return generate() / MODULUS;
    elseif Min == Max then
        return Min;
    else
        if Min > Max then
            Min = Min + Max
            Max = Min - Max
            Min = Min - Max
        end

        local result = 0
        
        result = Min + generate() / MODULUS * (Max - Min + 1)

        return result;
    end
end

function bool(chance)
    return float(0, 100) < chance;
end