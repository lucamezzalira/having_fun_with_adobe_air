package com.insideabit.hfwaa.models
{
	import com.insideabit.hfwaa.events.AppEvent;
	import com.insideabit.hfwaa.utils.ViewList;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MediaEvent;
	import flash.geom.Matrix;
	import flash.media.CameraRoll;
	import flash.media.MediaPromise;
	import flash.system.Capabilities;
	
	import org.robotlegs.mvcs.Actor;
	
	public class CameraRollService extends Actor
	{
		
		private const SCALE_FACTOR:Number = .3;
		
		[Inject] public var model:MainModel;
		
		private var _cameraRoll:CameraRoll;
		private var _loader:Loader;
		
		public function CameraRollService()
		{
			super();
			_cameraRoll = new CameraRoll();
			_cameraRoll.addEventListener(MediaEvent.SELECT, getImage);
			_cameraRoll.addEventListener(Event.CANCEL, returnMainView);
		}
		
		public function launchCameraRoll():void{
			
			if(CameraRoll.supportsBrowseForImage){
				_cameraRoll.browseForImage();
			} else {
				dispatch(new AppEvent(AppEvent.CAMERA_ROLL_ERROR));
			}
				
		}
		
		protected function getImage(event:MediaEvent):void
		{
			var promise:MediaPromise = event.data as MediaPromise;
		
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, onError);
			_loader.loadFilePromise(promise);
		}		
		
		protected function onError(event:Event):void
		{
			trace("load image error");
		}
		
		protected function onImageLoaded(event:Event):void
		{
			
			var originalBitmapData:BitmapData = (_loader.content as Bitmap).bitmapData;
			
			var scaleFactor:Number = Capabilities.screenResolutionX / originalBitmapData.width;
			
			var scaleMatrix:Matrix = new Matrix();
			scaleMatrix.scale(scaleFactor, scaleFactor);
			
			var finalBD:BitmapData = new BitmapData(originalBitmapData.width * scaleFactor, originalBitmapData.height * scaleFactor);
			finalBD.draw(originalBitmapData, scaleMatrix);
			
			var bmp:Bitmap = new Bitmap(finalBD);
			
			model.imgLoaded = bmp;
			model.actualView = ViewList.MANIPULATE_IMG;
			dispatch(new AppEvent(AppEvent.IMAGE_LOADED));
			//trace("image ready :D")
		}
		
		protected function returnMainView(event:Event):void
		{
			trace("cancel pressed")
		}
		
	}
}