package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup.FlxTypedGroup;

class CharSelectState extends MusicBeatState{
    var charsArray:Array<String> = ['BOYFRIEND', 'BF-CAR', 'BF-NEO'];
    var leBG:FlxSprite;
    var bf:FlxSprite;
    var bfcar:FlxSprite;
    var selectedText:FlxText;
    var charSelect:FlxSprite;
    public static var curSelected:Int = 0;
    override function create(){
        FlxG.sound.playMusic(Paths.music('tea-time'));
        leBG = new FlxSprite().loadGraphic(Paths.image('menuBG'));
        leBG.color = FlxColor.BLUE;
        leBG.screenCenter();
        add(leBG);
        bf = new FlxSprite(450, 300).loadGraphic(Paths.image('characters/BOYFRIEND'));
        bf.frames = Paths.getSparrowAtlas('characters/BOYFRIEND');
        bf.animation.addByPrefix('idle', 'BF idle dance', 24, true);
        bf.animation.addByPrefix('hey', 'BF HEY!!', 24, true);
        bf.animation.play('idle');
        add(bf);
        bfcar = new FlxSprite(450, 300).loadGraphic(Paths.image('characters/bfCar'));
        bfcar.frames = Paths.getSparrowAtlas('characters/bfCar');
        bfcar.animation.addByPrefix('idle', 'BF idle dance', 24, true);
        bfcar.animation.addByPrefix('hey', 'BF HEY!!', 24, true);
        bfcar.animation.addByPrefix('singUP', 'BF NOTE UP', 24, true);
        bfcar.animation.play('idle');
        add(bfcar);   
        bfneo = new FlxSprite(450, 300).loadGraphic(Paths.image('characters/bfNeo'));
        bfneo.frames = Paths.getSparrowAtlas('characters/bfNeo');
        bfneo.animation.addByPrefix('idle', 'BF idle dance', 24, true);
        bfneo.animation.addByPrefix('hey', 'BF HEY!!', 24, true);
        bfneo.animation.play('idle');
        add(bfneo);
		selectedText = new FlxText(0, 10, charsArray[0], 24);
		selectedText.alpha = 0.5;
		selectedText.x = (FlxG.width) - (selectedText.width) - 25;
        add(selectedText);
        charSelect = new Alphabet(0, 50, "Select Your Character", true, false);
        charSelect.offset.x -= 150;
        add(charSelect);
        changeSelection();
        super.create();
    }

    function changeSelection(change:Int = 0){
        curSelected += change;

        if (curSelected < 0)
			curSelected = charsArray.length - 1;
		if (curSelected >= charsArray.length)
			curSelected = 0;

        selectedText.text = charsArray[curSelected];

        switch(curSelected){
        case 0:
        bf.visible = true;
        bfcar.visible = false;
        bfneo.visible = false;
        FlxTween.color(leBG, 2, leBG.color, FlxColor.BLUE, {onComplete:function(twn:FlxTween){
        FlxTween.cancelTweensOf(leBG);
        }});
        case 1:
        bf.visible = false;
        bfcar.visible = true;
        bfneo.visible = false
        FlxTween.color(leBG, 2, leBG.color, FlxColor.RED, {onComplete:function(twn:FlxTween){
        FlxTween.cancelTweensOf(leBG);
        }});
        case 2:
        bf.visible = false;
        bfcar.visible = false;
        bfneo.visible = true
        FlxTween.color(leBG, 3, leBG.color, FlxColor.GREEN, {onComplete:function(twn:FlxTween){
        FlxTween.cancelTweensOf(leBG);
        }});
        }
    }

    override function update(elapsed:Float){
        if (controls.UI_LEFT_P){
        changeSelection(-1);
        FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (controls.UI_RIGHT_P){
        changeSelection(1);
        FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (controls.ACCEPT){
        FlxG.sound.play(Paths.sound('confirmMenu'));
        switch(curSelected){
        case 2:
        FlxFlicker.flicker(bfneo, 1.5, 0.15, false);
        bfneo.animation.play('singUP');
        case 1:
        FlxFlicker.flicker(bfcar, 1.5, 0.15, false);
        bfcar.animation.play('singUP');
        case 0:
        FlxFlicker.flicker(bf, 1.5, 0.15, false);
        bf.animation.play('hey');
        }
        new FlxTimer().start(1.5, function(tmr:FlxTimer)
            {
        MusicBeatState.switchState(new PlayState());
            });
        }
        if (controls.BACK){
        FlxG.sound.play(Paths.sound('cancelMenu'));
        MusicBeatState.switchState(new FreeplayState());
        }
        super.update(elapsed);
    }
}
