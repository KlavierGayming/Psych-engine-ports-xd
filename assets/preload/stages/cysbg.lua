function onCreate()
	-- background shit
	makeLuaSprite('CYSbg', 'CYSbg', -500, -300);
	setLuaSpriteScrollFactor('cys', 0.9, 0.9);
	
	addLuaSprite('CYSbg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
	-- Ah e, script feito por Fang
end