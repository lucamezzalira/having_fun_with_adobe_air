package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.events.AppEvent;
	import com.insideabit.hfwaa.events.UserRequestEvent;
	import com.insideabit.hfwaa.models.MainModel;
	import com.insideabit.hfwaa.utils.ViewList;
	import com.insideabit.hfwaa.views.ManipulateImageView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	public class ManipulateImageMediator extends StarlingMediator
	{
		[Inject] public var model:MainModel;
		[Inject] public var view:ManipulateImageView;
		
		public function ManipulateImageMediator()
		{
			super();
		}
		
		override public function onRegister():void{
		
			eventMap.mapStarlingListener(view, UserRequestEvent.BACK_CHOOSE_IMAGE, backHome);
			view.init(model.imgLoaded);
		}
		
		private function backHome():void
		{
			model.actualView = ViewList.CHOOSE_IMG;
			dispatch(new AppEvent(AppEvent.CHOOSE_IMAGE));
		}
		
		override public function onRemove():void{
			
			eventMap.unmapListeners();
			view.dispose();
			
		}
	}
}