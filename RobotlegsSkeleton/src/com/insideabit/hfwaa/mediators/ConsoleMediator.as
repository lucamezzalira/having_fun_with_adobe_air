package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.events.ViewVisibilityEvent;
	import com.insideabit.hfwaa.views.Console;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	import starling.events.Event;
	
	public class ConsoleMediator extends StarlingMediator
	{
		[Inject]
		public var view:Console;
		
		public function ConsoleMediator()
		{
			super();
		}
		
		private function addListeners(e:Event):void
		{
	
			view.hideViewBtn.addEventListener(Event.TRIGGERED, hideView);
			view.showViewBtn.addEventListener(Event.TRIGGERED, showView);
			
		}
		
		override public function onRegister():void{
			
			view.addEventListener(Event.ADDED_TO_STAGE, addListeners);
	
		}
		
		private function showView(e:Event):void
		{

			dispatch(new ViewVisibilityEvent(ViewVisibilityEvent.CHANGE_VISIBILITY, true));
		}
		
		private function hideView(e:Event):void
		{
			dispatch(new ViewVisibilityEvent(ViewVisibilityEvent.CHANGE_VISIBILITY, false));
		}
	}
}