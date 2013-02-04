package com.insideabit.hfwaa.views
{
	import feathers.controls.Button;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Console extends Sprite
	{
		public var hideViewBtn:Button;
		public var showViewBtn:Button;
		
		public function Console()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			hideViewBtn = new Button();
			hideViewBtn.label = "Hide View";
			hideViewBtn.width = 150;
		
			showViewBtn = new Button();
			showViewBtn.label = "Show View";
			showViewBtn.width = 150;
			
			addChild(hideViewBtn);
			addChild(showViewBtn);

			hideViewBtn.x = stage.stageWidth - showViewBtn.width;
			
		}
		
	}
}