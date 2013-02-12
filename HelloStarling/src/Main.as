package
{
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	public class Main extends Sprite
	{
		[Embed(source="particle/particle.pex", mimeType="application/octet-stream")]
		private static const ParticlePex:Class;
		
		[Embed(source = "particle/texture.png")]
		private static const ParticleTexture:Class;
		
		public function Main()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void{
			
			var particleXML:XML = new XML(new ParticlePex());
			var particleTexture:Texture = Texture.fromBitmap(new ParticleTexture());
			
			var particleSystem:PDParticleSystem = new PDParticleSystem(particleXML, particleTexture);
			particleSystem.emitterX = stage.stageWidth/2-90;
			particleSystem.emitterY = stage.stageHeight - 100;
			addChild(particleSystem);
			
			Starling.juggler.add(particleSystem);
			
			particleSystem.start();
		}
	}
}