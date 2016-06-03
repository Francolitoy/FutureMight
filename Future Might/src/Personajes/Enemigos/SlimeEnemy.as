package Personajes.Enemigos
{
	import flash.display.MovieClip;

	public class SlimeEnemy
	{
		public var model:MovieClip;
		public var Vida:int = 5;
		public var atk:int = 1;
		public var dir:int = 1;
		public var exp:int = 1;
		
		public function SlimeEnemy(model:MovieClip)
		{
			this.model = model;
		}
	}
}