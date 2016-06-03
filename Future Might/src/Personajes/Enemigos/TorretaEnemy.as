package Personajes.Enemigos
{
	import flash.display.MovieClip;

	public class TorretaEnemy
	{
		public var model:MovieClip;
		public var Vida:int = 10;
		public var atk:int = 2;
		public var CooldownTorreta:int = 0;
		public var exp:int = 2;
		
		public function TorretaEnemy(model:MovieClip)
		{
			this.model = model;
		}
	}
}