package Personajes.Enemigos
{
	import flash.display.MovieClip;

	public class MinionEnemy
	{
		public var model:MovieClip;
		public var Vida:int = 2;
		public var atk:int = 2;
		public var dir:int = 1;
		public var exp:int = 1;
		
		public function MinionEnemy(model:MovieClip)
		{
			this.model = model;
		}
	}
}