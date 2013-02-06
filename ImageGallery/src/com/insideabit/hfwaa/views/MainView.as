package com.insideabit.hfwaa.views
{
	import com.insideabit.hfwaa.contexts.AppContext;
	
	import starling.display.Sprite;
	
	public class MainView extends Sprite
	{

		private var _context:AppContext;
		
		public function MainView()
		{
			super();
	
			_context = new AppContext(this);
			
		}
		
	}
}