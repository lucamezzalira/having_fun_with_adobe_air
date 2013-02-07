package
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(frameRate="30",backgroundColor="#000000")]
	public class SFactionscript extends Sprite
	{
		private var _ryu:Ryu;
		private var _ball:Ball;
		
		public function SFactionscript()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var bg:Background = new Background();
			addChild(bg);
			
			bg.y = stage.fullScreenHeight-bg.height;
			
			_ryu = new Ryu();
			addChild(_ryu);
			
			_ryu.y = stage.fullScreenHeight - _ryu.height - 20;
			_ryu.x = 30;
			_ryu.addEventListener(MouseEvent.MOUSE_DOWN, hoduken);
			_ryu.addEventListener(MouseEvent.MOUSE_UP, stopRyu);
			
			stage.addChild(new movieMonitor());
			
		}
		
		protected function stopRyu(event:MouseEvent):void
		{
			_ryu.gotoAndPlay(1)
			
			this.removeEventListener(Event.ENTER_FRAME, launchBall);
		}
		
		protected function hoduken(event:MouseEvent):void
		{
			
			_ryu.gotoAndStop("hoduken");
			
			this.addEventListener(Event.ENTER_FRAME, launchBall, false, 0, true);
		}
		
		protected function launchBall(event:Event):void
		{
			
			_ball = new Ball();
			_ball.x = _ryu.x + _ryu.width;
			_ball.y = _ryu.y;
			addChild(_ball);
			
			TweenLite.to(_ball, 1, {x: stage.fullScreenWidth + _ball.width, onComplete:dispose, onCompleteParams:[_ball]});
			
		}
		
		protected function dispose(_item:Ball):void{
			
			removeChild(_item);
			
		}
	}
}