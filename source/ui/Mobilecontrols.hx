package ui;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;

import ui.FlxVirtualPad;
import ui.Hitbox;

import Config;

class Mobilecontrols extends FlxSpriteGroup
{
	public var mode:ControlsGroup = HITBOX;

	public var _hitbox:Hitbox;
	public var _virtualPad:FlxVirtualPad;

	var config:Config;

	public function new() 
	{
		super();
		
		config = new Config();

		// load control mode num from Config.hx
		mode = getModeFromNumber(config.getcontrolmode());
		trace(config.getcontrolmode());

		switch (mode)
		{
			case VIRTUALPAD_RIGHT:
				initVirtualPad(0);
			case VIRTUALPAD_LEFT:
				initVirtualPad(1);
			case VIRTUALPAD_CUSTOM:
				initVirtualPad(2);
			case VIRTUALPAD_LEFT_BLOCK:
				initVirtualPad(3);
			case VIRTUALPAD_CUSTOM_BLOCK:
				initVirtualPad(4);
			case VIRTUALPAD_RIGHT_BLOCK:
				initVirtualPad(5);
			case HITBOX:
				_hitbox = new Hitbox();
				add(_hitbox);
			case HITBOX_BLOCK:
				_hitbox = new Hitbox(true);
				add(_hitbox);
			case KEYBOARD:
		}
	}

	function initVirtualPad(vpadMode:Int) 
	{
		switch (vpadMode)
		{
			case 1:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
			case 2:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
				_virtualPad = config.loadcustom(_virtualPad, false);
			case 3:
				_virtualPad = new FlxVirtualPad(LEFT_FULL_BLOCK, NONE);
			case 4:
				_virtualPad = new FlxVirtualPad(LEFT_FULL_BLOCK, NONE);
				_virtualPad = config.loadcustom(_virtualPad, true);
			case 5:
				_virtualPad = new FlxVirtualPad(RIGHT_FULL_BLOCK, NONE);
			default: // 0
				_virtualPad = new FlxVirtualPad(RIGHT_FULL, NONE);
		}
		
		_virtualPad.alpha = 0.75;
		add(_virtualPad);	
	}


	public static function getModeFromNumber(modeNum:Int):ControlsGroup {
		return switch (modeNum)
		{
			case 0: VIRTUALPAD_RIGHT;
			case 1: VIRTUALPAD_LEFT;
			case 2: KEYBOARD;
			case 3: VIRTUALPAD_CUSTOM;
			case 4:	HITBOX;
			case 5: VIRTUALPAD_RIGHT_BLOCK;
			case 6: VIRTUALPAD_LEFT_BLOCK;

			default: VIRTUALPAD_RIGHT;

		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	KEYBOARD;
	VIRTUALPAD_CUSTOM;
	VIRTUALPAD_RIGHT_BLOCK;
	VIRTUALPAD_LEFT_BLOCK;
	VIRTUALPAD_CUSTOM_BLOCK;

	HITBOX;
}