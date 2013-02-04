package com.insideabit.hfwaa.views
{
	import feathers.controls.TextInput;
	import feathers.controls.ToggleSwitch;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class FirstView extends Sprite
	{
		private var _enabledSwitch:ToggleSwitch;
		public var input:TextInput;
		
		public function FirstView()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_enabledSwitch = new ToggleSwitch();
			_enabledSwitch.isSelected = false;
			_enabledSwitch.addEventListener(Event.CHANGE, manageInput);
			
			input = new TextInput();
			input.y = 40;
			input.width = stage.stageWidth;
			input.isEnabled = _enabledSwitch.isSelected;
			
			addChild(_enabledSwitch);
			addChild(input);
		}
		
		private function manageInput(e:Event):void
		{
			input.isEnabled = _enabledSwitch.isSelected;
		}
	}
}