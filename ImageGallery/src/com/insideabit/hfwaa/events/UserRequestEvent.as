package com.insideabit.hfwaa.events
{
	import starling.events.Event;
	
	public class UserRequestEvent extends Event
	{
		public static const OPEN_CAMERA_ROLL:String = "openCameraRollEvt";
		public static const BACK_CHOOSE_IMAGE:String = "backChooseImgEvt";
		
		public function UserRequestEvent(type:String)
		{
			super(type);
		}
		
	}
}