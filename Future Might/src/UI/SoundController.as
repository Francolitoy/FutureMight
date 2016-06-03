package UI
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class SoundController
	{
		private var snd:Sound;
		private var channel:SoundChannel;
		private var settings:SoundTransform;
		public var lastPosition:Number = 0;
		private var MiStage:Stage;
		public var PantallaSonido:String = "";
		
		public function SoundController(snd:Sound,MiStage:Stage,PantallaSonido:String)
		{
			this.snd = snd;
			this.MiStage = MiStage;
			this.PantallaSonido = PantallaSonido;
		}
		
		public function play(Lups:int):void
		{
			settings = new SoundTransform(1, 0);
			channel = snd.play(0, Lups, settings);
			
			if(channel != null)
			{
				channel.addEventListener(Event.SOUND_COMPLETE, evSoundComplete);
			}
		}
		
		protected function evSoundComplete(event:Event):void
		{
			//Cuando todos los loops terminan...
			//play();
		}
		
		public function stop():void
		{
			channel.stop();
		}
		
		public function pause():void
		{
			try
			{
				lastPosition = channel.position; //Guarda la posición en la que está el canal en milisegundos.
				channel.stop();
			} 
			catch(error:Error) 
			{
				
			}
		}
		
		public function resume():void
		{
			channel = snd.play(lastPosition, 0, settings);
			lastPosition = 0;
		}
		
		public function set volume(value:Number):void
		{
			settings.volume = value;
			channel.soundTransform = settings;
		}
		
		public function get volume():Number
		{
			return settings.volume;
		}
		
		public function set pan(value:Number):void
		{
			settings.pan = value;
			channel.soundTransform = settings;
		}
		
		public function get pan():Number
		{
			return settings.pan;
		}
		
		public function set x(value:Number):void
		{
			pan = value * 2 / this.MiStage.stageWidth - 1;
		}
	}
}