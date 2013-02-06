package com.insideabit.hfwaa.contexts
{
	import com.insideabit.hfwaa.controls.CameraRollCommand;
	import com.insideabit.hfwaa.controls.ChangeViewCommand;
	import com.insideabit.hfwaa.controls.StartupCommand;
	import com.insideabit.hfwaa.events.AppEvent;
	import com.insideabit.hfwaa.mediators.ChooseImageMediator;
	import com.insideabit.hfwaa.mediators.MainMediator;
	import com.insideabit.hfwaa.mediators.ManipulateImageMediator;
	import com.insideabit.hfwaa.models.MainModel;
	import com.insideabit.hfwaa.views.ChooseImageView;
	import com.insideabit.hfwaa.views.MainView;
	import com.insideabit.hfwaa.views.ManipulateImageView;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.DisplayObjectContainer;
	
	public class AppContext extends StarlingContext
	{
		public function AppContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			injector.mapSingleton(MainModel);
			
			commandMap.mapEvent(AppEvent.STARTUP, StartupCommand, AppEvent, true)
			commandMap.mapEvent(AppEvent.LAUNCH_CAMERA_ROLL, CameraRollCommand);
			commandMap.mapEvent(AppEvent.IMAGE_LOADED, ChangeViewCommand);
			commandMap.mapEvent(AppEvent.CHOOSE_IMAGE, ChangeViewCommand);
			
			mediatorMap.mapView(ChooseImageView, ChooseImageMediator);
			mediatorMap.mapView(ManipulateImageView, ManipulateImageMediator);
			mediatorMap.mapView(MainView,MainMediator);			
			
			super.startup();
			
			dispatchEvent(new AppEvent(AppEvent.STARTUP));
		}
		
	}
}