package com.insideabit.hfwaa.controls
{
	import com.insideabit.hfwaa.models.CameraRollService;
	import com.insideabit.hfwaa.views.ChooseImageView;
	
	import feathers.themes.AeonDesktopTheme;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	public class StartupCommand extends StarlingCommand
	{
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute():void{
			
			injector.mapSingleton(CameraRollService);
			
			var _theme:AeonDesktopTheme = new AeonDesktopTheme(contextView.stage);
			contextView.addChild(new ChooseImageView());
			
		}
	}
}