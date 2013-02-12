package com.hfwaa.models
{
	import com.hfwaa.events.AppEvent;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	
	public class ImageLoader extends URLStream
	{
		private var _baData:Vector.<ByteArray>;
		private var _images:Array;
		private var _counter:int;
		
		public function ImageLoader(_arr:Array)
		{
			super();
			_images = _arr;
			_baData = new Vector.<ByteArray>();
			this.addEventListener(Event.COMPLETE, checkNextImage);
			
			loadImage();
		}
		
		private function loadImage():void
		{
			this.load(new URLRequest(_images[_counter]));
		}		
		
		protected function checkNextImage(event:Event):void
		{
			var ba:ByteArray = new ByteArray();
			this.readBytes(ba, 0, this.bytesAvailable);
			_baData.push(ba);
	
			if(_images.length-1 > _counter){
				_counter++;
				loadImage();
			} else {
				
				dispatchEvent(new AppEvent(AppEvent.MODEL_READY, true, true));
				
			}
				
		}
		
		public function getImage(_id:int):ByteArray{
			
			return _baData[_id];
		}

		public function get counter():int
		{
			return _counter;
		}

	}
}