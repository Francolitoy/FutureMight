package Personajes.Enemigos 
{
	import flash.display.MovieClip;
	import flash.display.Stage;

	public class Enemies
	{
		public var model:MovieClip;
		private var VelocidadFlyer:int = 7;
		private var VelocidadWalker:int = 1;
		public var Vida:int = 5;
		private var PosX:int;
		private var PosY:int;
		public var TipoEnemigo:int;
		private var TimerDisparo:int = 0;
		public static var TodasBalas:Vector.<BalasDeEnemies> = new Vector.<BalasDeEnemies>;
		
		public function Enemies()
		{
		}
		
		//Cambiar Esto XD
		public function spawn(TipoEnemigo:int,MiStage:Stage):void
		{
			this.TipoEnemigo = TipoEnemigo;
			if(TipoEnemigo == 1)
			{
				Vida = 5;
				//model = new MC_Flyer();
				MiStage.addChild(model);
				
				model.x = MiStage.stageWidth + model.width;
				//Esta Y tiene que ser un random Entre un Valor y Otro XD
				model.y = 250 + 100;
			}
			else if (TipoEnemigo == 2)
			{
				Vida = 15;
				//model = new MC_Torre();
				MiStage.addChild(model);
				PosX = Math.random() * 700 + 50;
				if(PosX > 350)
				{
					model.x = 100;
				}
				else
				{
					model.x = 700;
				}
				
				PosY = Math.random() * 250 + 200;
				model.y = PosY;
			}
			else if (TipoEnemigo == 3)
			{
				Vida = 75;
				//model = new MC_Walker();
				MiStage.addChild(model);

				model.x = -model.width;
				model.y = 425;
				
				//Esto es por que la Imagen de ahora esta mirando para el otro lado XD o mejor dicho por que me arrepenti de que mirara para ese lado XD
				model.scaleX = model.scaleX * -1;
			}
			else if (TipoEnemigo == 4)
			{
				Vida = 1000;
				model = new MC_Francolitoy();
				MiStage.addChild(model);
				
				model.x = 600;
				model.y = 100;
			}
		}
		
		public function Moverse():void
		{
			if(TipoEnemigo == 1)
			{
				model.x = model.x - VelocidadFlyer;
			}
			if(TipoEnemigo == 3)
			{
				model.x = model.x + VelocidadWalker /3;
			}
		}
		
		public function Destruir():void
		{
			
		}
		
		public function Disparar(HeroX:int,HeroY:int,MiStage:Stage):void
		{
			
			
			/*if(TipoEnemigo == 2)
			{
				TimerDisparo = TimerDisparo + 1;
				if(TimerDisparo >= 100)
				{
					var Wacho:BalasDeEnemies = new BalasDeEnemies();
					Wacho.spawn(model.x,model.y,HeroX,HeroY,MiStage);
					TodasBalas.push(Wacho);
					TimerDisparo = 0;
				}
			}
			else if(TipoEnemigo == 3)
			{
				TimerDisparo = TimerDisparo + 1;
				if(TimerDisparo >= 100)
				{
					var Wachu:BalasDeEnemies = new BalasDeEnemies();
					Wachu.spawn(model.x,model.y,HeroX,HeroY,MiStage);
					TodasBalas.push(Wachu);
					TimerDisparo = 0;
				}
			}
			else if(TipoEnemigo == 4)
			{
				TimerDisparo = TimerDisparo + 1;
				if(TimerDisparo >= 100 && Vida > 700)
				{
					var Slemst:BalasDeEnemies = new BalasDeEnemies();
					Slemst.spawn(model.x,model.y,HeroX,HeroY,MiStage);
					TodasBalas.push(Slemst);
					TimerDisparo = 0;
				}
				else if(TimerDisparo >= 50 && Vida > 450 && Vida <= 700)
				{
					var Wachugss:BalasDeEnemies = new BalasDeEnemies();
					Wachugss.spawn(model.x,model.y,HeroX,HeroY,MiStage);
					TodasBalas.push(Wachugss);
					TimerDisparo = 0;
				}
				else if(TimerDisparo >= 20 && Vida <= 450)
				{
					var Darkgon:BalasDeEnemies = new BalasDeEnemies();
					Darkgon.spawn(model.x,model.y,HeroX,HeroY,MiStage);
					TodasBalas.push(Darkgon);
					TimerDisparo = 0;
				}
			}*/
			
			
		}
		
		
	}
}