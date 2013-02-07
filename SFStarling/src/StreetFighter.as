package
{
	import feathers.controls.ImageLoader;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.filters.BlurFilter;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class StreetFighter extends Sprite
	{
		
		[Embed(source="assets/ryu.xml", mimeType="application/octet-stream")]
		public static const charactersXml:Class;
		
		[Embed(source="assets/ryu.png")]
		public static const charactersTexture:Class;
		
		private var _ryu:TextureAtlas;
		private var _bg:ImageLoader
		private var _ryuAttach:Image;
		private var _ryuClip:MovieClip;
		private var _kenAttach:Image;
		private var _kenClip:MovieClip;
		private var _ball:Image;
		
		public function StreetFighter()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var texture:Texture = Texture.fromBitmap(new charactersTexture());
			var xml:XML = XML(new charactersXml());
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
			
			_kenAttach = new Image(_ryu.getTexture("kHoduken"))
			addChild(_kenAttach);
			_kenAttach.y = stage.stageHeight - _kenAttach.height - 20;
			_kenAttach.x = stage.stageWidth - 30;
			_kenAttach.scaleX = -1;
			_kenAttach.visible = false;
			
			var ryuMovements:Vector.<Texture> = _ryu.getTextures("ryu");
			var kenMovements:Vector.<Texture> = _ryu.getTextures("ken");

			_ryuClip = new MovieClip(ryuMovements, 10);
			addChild(_ryuClip);
			
			_ryuClip.y = stage.stageHeight - _ryuClip.height - 20;
			_ryuClip.x = 30;
			_ryuClip.loop = true;
			_ryuClip.addEventListener(TouchEvent.TOUCH, manageRyu);
			
			_kenClip = new MovieClip(kenMovements, 10);
			addChild(_kenClip);
			
			_kenClip.y = stage.stageHeight - _kenClip.height - 20;
			_kenClip.x = stage.stageWidth - 30;
			_kenClip.loop = true;
			_kenClip.addEventListener(TouchEvent.TOUCH, manageKen);
			_kenClip.scaleX = -1;
			
			Starling.juggler.add(_kenClip);
			Starling.juggler.add(_ryuClip);
			
		}
		
		private function manageKen(e:TouchEvent):void
		{
			switch(e.touches[0].phase){
				
				case "began":
					stage.addEventListener(Event.ENTER_FRAME, hodukenKen)
					break;
				
				case "ended":
					stage.removeEventListener(Event.ENTER_FRAME, hodukenKen)
					_kenClip.alpha = 1;
					_kenAttach.visible = false;
					break;
				
			}
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
			_ball.x = _ryuClip.x + _ryuClip.width + 50;
			_ball.y = _ryuClip.y;
			addChild(_ball);
			Starling.juggler.tween(_ball, 1, {x:stage.stageWidth + _ball.width, onComplete:dispose, onCompleteArgs:[_ball]});
			
		}
		
		private function hodukenKen(e:Event):void{
			
			_kenAttach.visible = true;
			_kenClip.alpha = 0;
			_ball = new Image(_ryu.getTexture("ball"));
			_ball.x = _kenClip.x - _kenClip.width - 50;
			_ball.y = _kenClip.y;
			_ball.scaleX = -1;
			addChild(_ball);
			Starling.juggler.tween(_ball, 1, {x:-_ball.width, onComplete:dispose, onCompleteArgs:[_ball]});
			
		}
		
		private function dispose(_item:Image):void{
			
			removeChild(_item);
			
		}
		
		private function moveBG():void
		{
			_bg.y = stage.stageHeight-_bg.getChildAt(0).height;
			_bg.filter = new BlurFilter(.3, .3);
		}
	}
}