package Personajes.Enemigos
{
	import flash.display.MovieClip;

	public class MagnetBombEnemy
	{
		public var model:MovieClip;
		public var Vida:int = 24;
		public var atk:int = 6;
		public var dir:int = 1;
		public var exp:int = 3;
		
		public function MagnetBombEnemy(model:MovieClip)
		{
			this.model = model;
		}
	}
}