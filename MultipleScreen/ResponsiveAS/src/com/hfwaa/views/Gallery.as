package com.hfwaa.views
{
	import com.greensock.TweenLite;
	import com.hfwaa.models.MainModel;
	import com.hfwaa.utils.Orientation;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.ImageDecodingPolicy;
	import flash.system.LoaderContext;
	
	public class Gallery extends Sprite
	{
		private const NUM_PHOTOS_PER_PAGE:int = 3;
		private const HORIZONTAL_GAP:int = 15;
		
		private var _orientation:String;
		private var _counter:int = 0;
		private var _loader:Loader;
		private var _lc:LoaderContext;
		private var _initX:Number;
		private var _posCont:Number;
		private var _deltaMove:Number;
		private var _actualpage:int = 0;
		private var _totalPages:int;
		
		public function Gallery()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_lc = new LoaderContext();
			_lc.imageDecodingPolicy = ImageDecodingPolicy.ON_DEMAND;
			
				
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadNextImage);	
			
			this.visible = false;
			
			checkImage();
			
		}
		
		private function checkImage():void{
					
			_loader.loadBytes(MainModel.instance.imgLoader.getImage(_counter), _lc);

		}
		
		private function loadNextImage(e:Event):void{
			
			var bmp:Bitmap = _loader.content as Bitmap;
			bmp.smoothing = true;
			addChild(bmp);
			
			if(_counter < MainModel.instance.imgLoader.counter){
				
				_counter++;
			
				checkImage();
		
			} else{
				
				manageUI();
				this.addEventListener(MouseEvent.MOUSE_DOWN, moveContent, false, 0, true);
				this.addEventListener(MouseEvent.MOUSE_UP, blockContent, false, 0, true);
			}
			
		}
		
		protected function blockContent(event:MouseEvent):void
		{
			this.removeEventListener(Event.ENTER_FRAME, followThumb);
			
			
			_deltaMove =_posCont-mouseX
		
			if(_deltaMove < 0){
				if(_actualpage > 0)	
					_actualpage--;
				
			} else if(_deltaMove>0){
				
				if(_actualpage < _totalPages-1)
					_actualpage++;
				
			}
			trace("_actualpage", _actualpage)
			TweenLite.to(this, .3, {x:_actualpage*stage.fullScreenWidth*-1});
		}
		
		protected function moveContent(event:MouseEvent):void
		{
			_initX = _posCont = mouseX
			this.addEventListener(Event.ENTER_FRAME, followThumb, false, 0, true);
		}
		
		protected function followThumb(event:Event):void
		{
			if(mouseX != _initX){
				this.x +=  mouseX - _initX;
				_initX = mouseX
			}
		}
		
		private function manageUI():void{

			var delta:Number;
			var tmpBmp:Bitmap;
			var i:int;
			trace("_orientation", _orientation)
			if(_orientation == Orientation.LANDSCAPE){
				
				var finalW:int = Math.round(stage.fullScreenWidth/NUM_PHOTOS_PER_PAGE);
				finalW = finalW - (HORIZONTAL_GAP*2);
				
				for(i = 0; i < this.numChildren; i++){
					
					tmpBmp = getChildAt(i) as Bitmap;
					
					tmpBmp.scaleX = tmpBmp.scaleY = 1
					
					delta = finalW/tmpBmp.width;
					if(delta <= 1)
						tmpBmp.scaleX = tmpBmp.scaleY = delta;
					
					tmpBmp.x = i * (tmpBmp.width + HORIZONTAL_GAP)
					
				}
				
			} else {
				

				for(i = 0; i < this.numChildren; i++){
					
					tmpBmp = getChildAt(i) as Bitmap;
					
					tmpBmp.scaleX = tmpBmp.scaleY = 1
					
					delta = stage.fullScreenHeight/tmpBmp.height;
					if(delta <= 1)
						tmpBmp.scaleX = tmpBmp.scaleY = delta;
					
					if(tmpBmp.width >= stage.fullScreenWidth)
						tmpBmp.x = i * stage.fullScreenWidth;
					else
						tmpBmp.x = i * stage.fullScreenWidth + ((stage.fullScreenWidth - tmpBmp.width)/2);
				}
			}
			
			this.visible = true;
			
			this.y = Math.round((stage.fullScreenHeight - this.height) / 2);
			this.x = 0;
			_actualpage = 0;
			
			_totalPages = Math.floor(this.width/stage.fullScreenWidth);
			
		}
		
		public function setOrientation(_type:String):void{
			
			_orientation = _type;
			
			if(this.numChildren > 0)
				manageUI();
		}
	}
}