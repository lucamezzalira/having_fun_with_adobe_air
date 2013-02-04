package com.insideabit.hfwaa.mediators
{
	import com.insideabit.hfwaa.events.ViewVisibilityEvent;
	import com.insideabit.hfwaa.model.MainModel;
	import com.insideabit.hfwaa.views.FirstView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	import starling.events.Event;

	public class FirstViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:FirstView;
		
		[Inject]
		public var model:MainModel;
		
		public function FirstViewMediator()
		{
			super()
		}
		
		public function manageVisibility(evt:ViewVisibilityEvent):void{
				
			view.visible = evt.visibility;
			
		}
		
		override public function onRegister():void{
			
			addContextListener(ViewVisibilityEvent.CHANGE_VISIBILITY, manageVisibility);
			view.addEventListener(Event.ADDED_TO_STAGE, addText);
		
		}
		
		private function addText(e:Event):void
		{
			view.input.text = model.myText;
		}
		
		override public function onRemove():void{
			
			trace("mediator FirstView removed");
			
		}
	}
}