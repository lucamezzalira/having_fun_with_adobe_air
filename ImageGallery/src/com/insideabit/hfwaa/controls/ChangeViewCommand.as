package com.insideabit.hfwaa.controls
{
	import com.insideabit.hfwaa.models.MainModel;
	import com.insideabit.hfwaa.utils.ViewList;
	import com.insideabit.hfwaa.views.ChooseImageView;
	import com.insideabit.hfwaa.views.ManipulateImageView;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	public class ChangeViewCommand extends StarlingCommand
	{
		[Inject] public var model:MainModel;
		
		public function ChangeViewCommand()
		{
			super();
		}
		
		override public function execute():void{
			
			while(contextView.numChildren > 0)
				contextView.removeChildAt(0);
			
			switch(model.actualView){
				
				case ViewList.MANIPULATE_IMG:
					contextView.addChild(new ManipulateImageView());
					break;
				
				case ViewList.CHOOSE_IMG:
					contextView.addChild(new ChooseImageView());
					break;
				
			}
			
		}
	}
}