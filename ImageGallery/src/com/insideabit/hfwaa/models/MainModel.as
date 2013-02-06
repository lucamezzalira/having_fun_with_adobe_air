package com.insideabit.hfwaa.models
{
	import com.insideabit.hfwaa.utils.ViewList;
	
	import flash.display.Bitmap;
	
	import org.robotlegs.mvcs.Actor;
	
	public class MainModel extends Actor
	{
		private var _actualView:String = ViewList.CHOOSE_IMG;
		private var _imgLoaded:Bitmap;
		
		public function MainModel()
		{
			super();
		}
		
		
		public function get actualView():String
		{
			return _actualView;
		}

		public function set actualView(value:String):void
		{
			_actualView = value;
		}

		public function get imgLoaded():Bitmap
		{
			return _imgLoaded;
		}

		public function set imgLoaded(value:Bitmap):void
		{
			_imgLoaded = value;
			trace("image set in model")
		}


	}
}