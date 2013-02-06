package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.events.AppEvent;
	import com.insideabit.hfwaa.views.MainView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	public class MainMediator extends StarlingMediator
	{
		[Inject] public var view:MainView;
		
		public function MainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			addContextListener(AppEvent.IMAGE_LOADED, showImage);
		}
		
		private function showImage(e:AppEvent):void
		{
			trace("changeView")
		}
		
		override public function onRemove():void{
			trace("removed view")
		}
		
	}
}