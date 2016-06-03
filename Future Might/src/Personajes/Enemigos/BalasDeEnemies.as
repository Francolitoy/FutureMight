package Personajes.Enemigos
{
	import Models.Play;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class BalasDeEnemies
	{
		public var model:MC_BalasDeEnemies;
		private var Velocidad:int = 4;
		private var Dir:int = 1;
		public var Distancia:int = 0;
		
		//private var PosHeroX:int;
		//private var PosHeroY:int;
		//private var PosEnemigoX:int;
		//private var PosEnemigoY:int;
		
		public function BalasDeEnemies()
		{
		}
		
		public function spawn(X:int, Y:int,view:Sprite):void
		{
			model = new MC_BalasDeEnemies;
			view.addChild(model);
			
			model.x = X;
			model.y = Y;
			
			//PosEnemigoX = X;
			//PosEnemigoY = Y;
			//PosHeroX = HeroX;
			//PosHeroY = HeroY;
			
		}
		
		public function Moverse():void
		{
			//model.x = model.x + (PosHeroX - PosEnemigoX) / 250;
			//model.y = model.y + (PosHeroY - PosEnemigoY) / 250;
			model.x = model.x + Velocidad * -Dir;
			Distancia = Distancia +1;

		}
		
		public function Destruirse():void
		{
			//emm bueno no hagas nada por puto XD
		}
		
		public function Update():void
		{
			//para que esta esto de Update si solo llama a moverse XD por ahora es lo mismo XD pero yo llamo a Update y no a Moverse
			Moverse();
		}
	}
}