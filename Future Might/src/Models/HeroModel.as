package Models
{
	import Personajes.Hero.Hero;
	
	import flash.display.MovieClip;

	public class HeroModel
	{
		public var MyHero:Hero;
		public var VidaMaximaPersonaje:int = 5;
		public var VidaPersonaje:int = 5;
		public var VidaTotal:int = 5;
		public var HPBar:MovieClip;
		public var ExpBar:MovieClip;
	}
}