package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60",backgroundColor="#000000")]
	public class SFStarling extends Sprite
	{
		private var _starling:Starling;
		
		public function SFStarling()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_starling = new Starling(StreetFighter, stage);
			_starling.enableErrorChecking = false;
			_starling.antiAliasing = 1;
			_starling.start();
			
			_starling.showStatsAt("left", "top");
			
			stage.addEventListener(Event.RESIZE, stage_resizeHandler, false, int.MAX_VALUE, true);
			stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
			
		}
		
		private function stage_resizeHandler(event:Event):void
		{
			_starling.stage.stageWidth = this.stage.stageWidth;
			_starling.stage.stageHeight = this.stage.stageHeight;
			
			const viewPort:Rectangle = this._starling.viewPort;
			viewPort.width = this.stage.stageWidth;
			viewPort.height = this.stage.stageHeight;
			try
			{
				this._starling.viewPort = viewPort;
			}
			catch(error:Error) {}
		}
		
		private function stage_deactivateHandler(event:Event):void
		{
			_starling.stop();
			stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}
		
		private function stage_activateHandler(event:Event):void
		{
			this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			this._starling.start();
		}
		
	}
}
import flash.events.Event;

