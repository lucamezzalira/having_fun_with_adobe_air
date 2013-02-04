package com.insideabit.hfwaa.events
{
	import flash.events.Event;
	
	public class ViewVisibilityEvent extends Event
	{
		public static const CHANGE_VISIBILITY:String = "changeVisEvt";
		
		private var _visibility:Boolean;
		
		public function ViewVisibilityEvent(type:String, _value:Boolean)
		{
			super(type, false);
			_visibility = _value;
		}
		
		
		public function get visibility():Boolean
		{
			return _visibility;
		}

	}
}