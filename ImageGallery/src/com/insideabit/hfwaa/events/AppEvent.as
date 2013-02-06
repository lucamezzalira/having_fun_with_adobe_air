package com.insideabit.hfwaa.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const STARTUP:String = "startupEvt";
		public static const LAUNCH_CAMERA_ROLL:String = "launchCameraRollEvt";
		public static const CAMERA_ROLL_ERROR:String = "errorOnLaunchCameraRollEvt";
		public static const IMAGE_LOADED:String = "imageLoadedFromCameraRollEvt";
		public static const CHOOSE_IMAGE:String = "chooseImageViewEvt";
		
		private var _content:*;
		
		public function AppEvent(type:String, _data:* = null)
		{
			super(type);
			_content = _data;
		}

		public function get content():*
		{
			return _content;
		}

	}
}