package com.insideabit.hfwaa.views
{
	import com.insideabit.hfwaa.events.UserRequestEvent;
	
	import flash.utils.setTimeout;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ChooseImageView extends Sprite
	{
		
		private var _txt:Label;
		
		public var btn:Button;
		
		public function ChooseImageView()
		{
			super();
			
		}
		
		public function init():void{
			
			btn = new Button();
			btn.addEventListener(Event.TRIGGERED, openCameraRoll);
			addChild(btn);
			btn.label = "Choose a photo";
			
			btn.width = 200;
			btn.height = 70;
			btn.x = (stage.stageWidth - btn.width)/2;
			btn.y = (stage.stageHeight - btn.height)/2;
			
		}
		
		public function showError():void{
			
			_txt = new Label();
			_txt.text = "This device doesn't support Camera Roll";
			addChild(_txt);
			
			setTimeout(removeLbl, 2500);
		}
		
		private function removeLbl():void
		{
			removeChild(_txt);
		}
		
		private function openCameraRoll():void
		{
			dispatchEvent(new UserRequestEvent(UserRequestEvent.OPEN_CAMERA_ROLL));
		}
		
		override public function dispose():void{
			
			removeChild(btn);
			btn.removeEventListener(Event.TRIGGERED, openCameraRoll);
			super.dispose();
			
		}
	}
}