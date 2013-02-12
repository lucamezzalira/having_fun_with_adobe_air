package com.hfwaa.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const MODEL_READY:String = "modelReadyEvt";
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			
			return new AppEvent(type, bubbles, cancelable);
			
		}
	}
}