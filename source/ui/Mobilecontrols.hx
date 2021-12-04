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

	public function new(block:Bool) 
	{
		super();
		
		config = new Config();

		// load control mode num from Config.hx
		mode = getModeFromNumber(config.getcontrolmode());
		trace(config.getcontrolmode());

		switch (mode)
		{
			case VIRTUALPAD_RIGHT:
				initVirtualPad(0, block);
			case VIRTUALPAD_LEFT:
				initVirtualPad(1, block);
			case VIRTUALPAD_CUSTOM:
				initVirtualPad(2, block);
			case HITBOX:
				_hitbox = new Hitbox(block);
				add(_hitbox);
			case KEYBOARD:
		}
	}

	function initVirtualPad(vpadMode:Int, block:Bool) 
	{
		switch (vpadMode)
		{
			case 1:
				if (!block)
					_virtualPad = new FlxVirtualPad(FULL, NONE);
				else
					_virtualPad = new FlxVirtualPad(LEFT_FULL_BLOCK, NONE);
			case 2:
				if (!block)
					_virtualPad = new FlxVirtualPad(FULL, NONE);
				else
					_virtualPad = new FlxVirtualPad(LEFT_FULL_BLOCK, NONE);
				_virtualPad = config.loadcustom(_virtualPad, false);
			default: // 0
				if (!block) 
					_virtualPad = new FlxVirtualPad(RIGHT_FULL, NONE);
				else
					_virtualPad = new FlxVirtualPad(RIGHT_FULL_BLOCK, NONE);
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

			default: VIRTUALPAD_RIGHT;

		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	KEYBOARD;
	VIRTUALPAD_CUSTOM;
	HITBOX;
}