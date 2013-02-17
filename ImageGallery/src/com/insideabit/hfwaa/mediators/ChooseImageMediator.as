package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.events.AppEvent;
	import com.insideabit.hfwaa.events.UserRequestEvent;
	import com.insideabit.hfwaa.views.ChooseImageView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	public class ChooseImageMediator extends StarlingMediator 
	{
		[Inject] public var view:ChooseImageView;
		
		public function ChooseImageMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.init();
			eventMap.mapStarlingListener(view, UserRequestEvent.OPEN_CAMERA_ROLL, openCR);
			addContextListener(AppEvent.CAMERA_ROLL_ERROR, showErrorMessage);
		}
		
		private function showErrorMessage(e:AppEvent):void
		{
			trace("show error message")
			view.showError();
		}
		
		private function openCR():void
		{
			dispatch(new AppEvent(AppEvent.LAUNCH_CAMERA_ROLL));
		}
		
		override public function onRemove():void{
			eventMap.unmapListeners();
		}
		
	}
}