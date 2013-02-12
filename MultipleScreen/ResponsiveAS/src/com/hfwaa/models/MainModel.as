package com.hfwaa.models
{
	public class MainModel
	{
		private const PHOTOS:Array = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg"];
		
		private static var _instance:MainModel;
		private var _imgLoader:ImageLoader;
		
		public function MainModel()
		{
		}
		
		public static function get instance():MainModel{
			
			if(!_instance)
				_instance = new MainModel();
			
			return _instance;
			
		}
		
		public function init():void{
			
			_imgLoader = new ImageLoader(PHOTOS);
			
		}

		public function get imgLoader():ImageLoader
		{
			return _imgLoader;
		}

		public function set imgLoader(value:ImageLoader):void
		{
			_imgLoader = value;
		}

	}
}