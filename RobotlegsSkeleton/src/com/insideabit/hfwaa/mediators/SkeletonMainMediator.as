package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.views.SkeletonMain;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	public class SkeletonMainMediator extends StarlingMediator
	{
		[Inject]
		public var view:SkeletonMain;
		
		public function SkeletonMainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
			view.init(null)
			trace("Skeleton Mediator registered")
		}
		
		override public function onRemove():void{
			
			trace("mediator SkeletonMain removed");
			
		}
	}
}