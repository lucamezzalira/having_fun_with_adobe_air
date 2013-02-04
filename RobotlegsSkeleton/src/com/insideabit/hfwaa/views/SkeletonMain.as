package com.insideabit.hfwaa.views
{
	import com.insideabit.hfwaa.contexts.SkeletonContext;
	
	import feathers.themes.MinimalMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class SkeletonMain extends Sprite
	{
		// importante se no viene cancellato dalla whim
		private var _context:SkeletonContext;
		
		private var _theFirstView:FirstView;
		private var _console:Console;
		private var _theme:MinimalMobileTheme;
		
		public function SkeletonMain()
		{
			super();
			
			_context = new SkeletonContext(this);
			
			//this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(e:Event):void
		{
			
			_theme = new MinimalMobileTheme(stage);
			
			_theFirstView = new FirstView();
			_console = new Console();
			
			addChild(_theFirstView);
			addChild(_console);
		
			_console.y = stage.stageHeight - 50;
			
		}
		
	}
}