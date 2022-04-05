local upY = 50
local downY = 570
local scroll = null
local spb = 1

function onCreate()
    spb = 60/bpm;
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        scroll = false
    else
        scroll = true
    end
end

function onEvent(name, value1, value2)
	if name == 'Switch Scroll' then
        local nextPos = null
        scroll = not scroll
        if scroll then
            nextPos = upY
        else
            nextPos = downY
        end
        noteTweenY('opponentLeftNoteTween',0,nextPos,spb,'circOut')
        noteTweenY('opponentDownNoteTween',1,nextPos,spb,'circOut')
        noteTweenY('opponentUpNoteTween',2,nextPos,spb,'circOut')
        noteTweenY('opponentRightNoteTween',3,nextPos,spb,'circOut')
        noteTweenY('playerLeftNoteTween',4,nextPos,spb,'circOut')
        noteTweenY('playerDownNoteTween',5,nextPos,spb,'circOut')
        noteTweenY('playerUpNoteTween',6,nextPos,spb,'circOut')
        noteTweenY('playerRightNoteTween',7,nextPos,spb,'circOut')
    end
end

function onUpdate()
    -- i hate how i have to use (not scroll) and not (scroll)
    setPropertyFromGroup('opponentStrums',0,'downScroll',not scroll)
    setPropertyFromGroup('opponentStrums',1,'downScroll',not scroll)
    setPropertyFromGroup('opponentStrums',2,'downScroll',not scroll)
    setPropertyFromGroup('opponentStrums',3,'downScroll',not scroll)
    setPropertyFromGroup('playerStrums',0,'downScroll',not scroll)
    setPropertyFromGroup('playerStrums',1,'downScroll',not scroll)
    setPropertyFromGroup('playerStrums',2,'downScroll',not scroll)
    setPropertyFromGroup('playerStrums',3,'downScroll',not scroll)
    setProperty('botplayTxt.y',getPropertyFromGroup('playerStrums',0,'y')+40)
    healthBarShits(not scroll)
end

function healthBarShits(scrolling)
    if (not scrolling) == getPropertyFromClass('ClientPrefs', 'downScroll') then
        setProperty('healthBar.alpha',0.25*getPropertyFromClass('ClientPrefs','healthBarAlpha'))
    else
        setProperty('healthBar.alpha',getPropertyFromClass('ClientPrefs','healthBarAlpha'))
    end
    setProperty('iconP1.alpha',getProperty('healthBar.alpha'))
    setProperty('iconP2.alpha',getProperty('healthBar.alpha'))
    setProperty('scoreTxt.alpha',4*getProperty('healthBar.alpha'))
end