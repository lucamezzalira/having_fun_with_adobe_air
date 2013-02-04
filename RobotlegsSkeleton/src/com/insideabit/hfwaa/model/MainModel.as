package com.insideabit.hfwaa.model
{
	import org.robotlegs.mvcs.Actor;
	
	public class MainModel extends Actor
	{
		private var _myText:String;
		
		public function MainModel()
		{
			super();
			_myText = "HAVING FUN WITH ADOBE AIR!";
		}
		
		
		public function get myText():String
		{
			return _myText;
		}

		public function set myText(value:String):void
		{
			_myText = value;
		}

	}
}