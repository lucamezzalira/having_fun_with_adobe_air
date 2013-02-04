package com.insideabit.hfwaa.contexts
{
	import com.insideabit.hfwaa.mediators.ConsoleMediator;
	import com.insideabit.hfwaa.mediators.FirstViewMediator;
	import com.insideabit.hfwaa.mediators.SkeletonMainMediator;
	import com.insideabit.hfwaa.model.MainModel;
	import com.insideabit.hfwaa.views.Console;
	import com.insideabit.hfwaa.views.FirstView;
	import com.insideabit.hfwaa.views.SkeletonMain;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.DisplayObjectContainer;
	
	public class SkeletonContext extends StarlingContext
	{
		public function SkeletonContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{

			injector.mapSingleton(MainModel);
			
			mediatorMap.mapView(FirstView, FirstViewMediator);
			mediatorMap.mapView(Console, ConsoleMediator);
			
			mediatorMap.mapView(SkeletonMain, SkeletonMainMediator);
			super.startup();
			
		}
		
	}
}