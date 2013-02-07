package
{
	import feathers.controls.ImageLoader;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class StreetFighter extends Sprite
	{
		
		[Embed(source="assets/ryu.xml", mimeType="application/octet-stream")]
		public static const RyuXml:Class;
		
		[Embed(source="assets/ryu.png")]
		public static const RyuTexture:Class;
		
		private var _ryu:TextureAtlas;
		private var _bg:ImageLoader
		private var _ryuAttach:Image;
		private var _ryuClip:MovieClip;
		private var _ball:Image;
		
		public function StreetFighter()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var texture:Texture = Texture.fromBitmap(new RyuTexture());
			var xml:XML = XML(new RyuXml());
			_ryu = new TextureAtlas(texture, xml);
			
			_bg = new ImageLoader();
			_bg.addEventListener(Event.COMPLETE, moveBG);
			_bg.source = "/assets/bg.png";
			addChild(_bg);
			
			_ryuAttach = new Image(_ryu.getTexture("hoduken"))
			addChild(_ryuAttach);
			_ryuAttach.y = stage.stageHeight - _ryuAttach.height - 20;
			_ryuAttach.x = 30;
			_ryuAttach.visible = false;
			
			var ryuMovements:Vector.<Texture> = _ryu.getTextures("ryu");

			_ryuClip = new MovieClip(ryuMovements, 10);
			addChild(_ryuClip);
			
			_ryuClip.y = stage.stageHeight - _ryuClip.height - 20;
			_ryuClip.x = 30;
			_ryuClip.loop = true;
			_ryuClip.addEventListener(TouchEvent.TOUCH, manageRyu);
			
			Starling.juggler.add(_ryuClip);
			
		}
		
		private function manageRyu(e:TouchEvent):void
		{
	
			switch(e.touches[0].phase){
				
				case "began":
					stage.addEventListener(Event.ENTER_FRAME, hoduken)
					break;
				
				case "ended":
					stage.removeEventListener(Event.ENTER_FRAME, hoduken)
					_ryuClip.alpha = 1;
					_ryuAttach.visible = false;
					break;
				
			}
		}
		
		private function hoduken(e:Event):void{
			
			_ryuAttach.visible = true;
			_ryuClip.alpha = 0;
			_ball = new Image(_ryu.getTexture("ball"));
			_ball.x = _ryuClip.x + _ryuClip.width;
			_ball.y = _ryuClip.y;
			addChild(_ball);
			Starling.juggler.tween(_ball, 1, {x:stage.stageWidth + _ball.width, onComplete:dispose, onCompleteArgs:[_ball]});
			
		}
		
		private function dispose(_item:Image):void{
			
			removeChild(_item);
			
		}
		
		private function moveBG():void
		{
			_bg.y = stage.stageHeight-_bg.getChildAt(0).height;
		}
	}
}