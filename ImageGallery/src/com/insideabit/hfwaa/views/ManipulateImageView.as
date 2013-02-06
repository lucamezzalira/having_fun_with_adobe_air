package com.insideabit.hfwaa.views
{
	import com.insideabit.hfwaa.events.UserRequestEvent;
	
	import flash.display.Bitmap;
	
	import feathers.controls.Button;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	
	public class ManipulateImageView extends Sprite
	{
		
		private var _img:Image
		private var _invertFilter:Button;
		private var _bwFilter:Button;
		private var _backBtn:Button
		private var _colorFilter:ColorMatrixFilter;
		
		public function ManipulateImageView()
		{
			super();
			_colorFilter = new ColorMatrixFilter();
		}
		
		public function init(_data:Bitmap):void{
			
			_img = Image.fromBitmap(_data);
			_img.y = (stage.stageHeight - _img.height) /2;
			addChild(_img);
			
			_invertFilter = new Button();
			_invertFilter.label = "INVERT";
			_invertFilter.addEventListener(Event.TRIGGERED, addInvertFilter);
			addChild(_invertFilter);
			
			_invertFilter.width = 100;
			_invertFilter.height = 70;
			
			_invertFilter.x = 10;
			_invertFilter.y = this.stage.stageHeight - _invertFilter.height - 10;
			
			_bwFilter = new Button();
			_bwFilter.label = "B/W";
			_bwFilter.addEventListener(Event.TRIGGERED, addBWFilter);
			addChild(_bwFilter);
			
			_bwFilter.width = 100;
			_bwFilter.height = 70;
			
			_bwFilter.x = this.stage.stageWidth - _bwFilter.width - 10;
			_bwFilter.y = this.stage.stageHeight - _bwFilter.height - 10;
			
			_backBtn = new Button();
			_backBtn.label = "Back";
			_backBtn.width = 100;
			_backBtn.height = 70;
			_backBtn.x = 10;
			_backBtn.y = 10;
			addChild(_backBtn);
			_backBtn.addEventListener(Event.TRIGGERED, backToChooseImage);
			
		}
		
		private function backToChooseImage(e:Event):void
		{
			dispatchEvent(new UserRequestEvent(UserRequestEvent.BACK_CHOOSE_IMAGE));
		}
		
		private function addBWFilter(e:Event):void
		{
			_colorFilter.reset();
			_colorFilter.adjustSaturation(-1);
			
			_img.filter = _colorFilter;
		}
		
		private function addInvertFilter(e:Event):void
		{
			_colorFilter.reset();
			_colorFilter.invert();
			
			_img.filter = _colorFilter;
		}
		
		override public function dispose():void{
			
			_invertFilter.removeEventListener(Event.TRIGGERED, addInvertFilter);
			_bwFilter.removeEventListener(Event.TRIGGERED, addBWFilter);
			_backBtn.removeEventListener(Event.TRIGGERED, backToChooseImage);
			
			_img.dispose();
			
			while(this.numChildren > 0)
				removeChildAt(0);
			
			super.dispose();
			
		}
	}
}