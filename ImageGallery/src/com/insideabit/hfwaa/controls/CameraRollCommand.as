package com.insideabit.hfwaa.controls
{
	import com.insideabit.hfwaa.models.CameraRollService;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	public class CameraRollCommand extends StarlingCommand
	{
		[Inject] public var cameraRollService:CameraRollService;
		
		public function CameraRollCommand()
		{
			super();
		}
		
		override public function execute():void{
			
			cameraRollService.launchCameraRoll();
			
		}
	}
}