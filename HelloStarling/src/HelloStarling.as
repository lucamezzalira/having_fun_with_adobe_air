package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", backgroundColor="#000000")]
	public class HelloStarling extends Sprite
	{
		
		private var _starling:Starling;
		
		public function HelloStarling()
		{
			super();
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_starling = new Starling(Main, stage);
			_starling.enableErrorChecking = false;
			_starling.showStats = true;
			_starling.start();
		}
	}
}