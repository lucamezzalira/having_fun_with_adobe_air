package
{
	import com.hfwaa.events.AppEvent;
	import com.hfwaa.models.MainModel;
	import com.hfwaa.utils.Orientation;
	import com.hfwaa.views.Gallery;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class ResponsiveAS extends Sprite
	{
		
		private var _currentOrientation:String;
		private var _gallery:Gallery;
		
		public function ResponsiveAS()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			MainModel.instance.init();
			MainModel.instance.imgLoader.addEventListener(AppEvent.MODEL_READY, createUI, false, 0, true);
			
		}
		
		protected function createUI(event:Event):void
		{
			removeEventListener(AppEvent.MODEL_READY, createUI);
		
			if(stage.fullScreenWidth > stage.fullScreenHeight)
				_currentOrientation = Orientation.LANDSCAPE;
			else
				_currentOrientation = Orientation.PORTRAIT;
			
			stage.addEventListener(Event.RESIZE, checkStageStatus);
			
			_gallery = new Gallery();
			_gallery.setOrientation(_currentOrientation);
			addChild(_gallery);
		}
		
		protected function checkStageStatus(event:Event):void
		{
			if(stage.fullScreenWidth > stage.fullScreenHeight)
				_currentOrientation = Orientation.LANDSCAPE;
			else
				_currentOrientation = Orientation.PORTRAIT;
			
			_gallery.setOrientation(_currentOrientation);
			
		}
	}
}