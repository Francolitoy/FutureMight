package Personajes.Hero 
{
	import flash.display.Sprite;
	import flash.display.Stage;

	public class BalasDeHero
	{
		public var model:MC_BalasDeHero;
		private var Velocidad:int = 10;
		private var Dir:int;
		public var Distancia:int = 0;
		
		public function BalasDeHero()
		{
		}
		
		//si quiero que tengan vida tengo que pasarselo por parametro y tambien pasar a model por parametro (a model lo pasaria con un numero si es 1 es BalasDeHero y si es 2 es BalasDeHero2 no se que nombre ponerle ahora XD)
		//onda Public function spawn(X:int, Y:int, Direccion:int, Vida:int, Mod:int):void (y despues un http://prntscr.com/99px3v )
		public function spawn(X:int, Y:int, Direccion:int,view:Sprite):void
		{
			model = new MC_BalasDeHero;
			view.addChild(model);
			
			//Ese + 60 es la longitud del Hero
			model.x = X + 40 * Direccion;
			//Ese - 70 es un poco mas de la mitad de la altura del Hero
			model.y = Y - 80;
			
			Dir = Direccion;
		}
		
		public function Moverse():void
		{
			model.x = model.x + Velocidad * Dir;
			Distancia = Distancia +1;
		}
		
		public function Destruirse():void
		{
			//emm bueno no hagas nada por puto XD
		}
		
		public function Update():void
		{
			//para que esta esto de Update si solo llama a moverse XD por ahora es lo mismo XD
			Moverse();
		}
		
	}
}