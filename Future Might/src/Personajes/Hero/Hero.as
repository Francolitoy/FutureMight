package Personajes.Hero 
{
	import Partida.Settings;
	
	import UI.SoundController;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class Hero
	{
		
		private var Vida:int;
		private var Velocidad:int = 2;
		private var VelocidadSalto:int = 5;
		public var model:MC_Hero;
		private var CurrentScale:int = 1;
		private var AlturaMaxima:int = 0;
		private var AlturaMinima:int = 0;
		private var Cayendo:int = 0;
		private var Dispara:int = 0;
		private var Recarga:int = 0;
		public static var TodasBalas:Vector.<BalasDeHero> = new Vector.<BalasDeHero>;
		
		public var Dir:int = 1;
		
		//Variables que las creo pero que tendrian que ser pasadas del main
		//private var CantidadAltura:int = 1;
		
		
		
		public function Hero(TeclaDer:int, TeclaIzq:int, TeclaSalto:int, TeclaShoot:int)
		{
			/*
			this.TeclaDerecha = TeclaDer;
			this.TeclaIzquierda = TeclaIzq;
			this.TeclaSalto = TeclaSalto;
			this.TeclaShoot = TeclaShoot;
			
			Main.MiStage.addEventListener(KeyboardEvent.KEY_DOWN, ApretarTecla);
			Main.MiStage.addEventListener(KeyboardEvent.KEY_UP, SoltarTecla);
			*/
		}
		
		public function updateHealthBar(currentHP:int,maxHP:int,healthBar:MovieClip):void
		{
			var widthAnt:Number = healthBar.barColor.width;
			var percentHP:Number = currentHP / maxHP;
			healthBar.barColor.scaleX = percentHP;
			//Para que la barra de hp no pierda la posicion en X
			healthBar.barColor.x = healthBar.barColor.x-((widthAnt-healthBar.barColor.width)/2);
		}
		
		public function updateExpBar(currentExp:int,siguienteNivel:int,ExpBar:MovieClip):void
		{
			var widthAnt:Number = ExpBar.barColorExp.width;
			var percentExp:Number = currentExp / siguienteNivel;
			ExpBar.barColorExp.scaleX = percentExp;
			ExpBar.barColorExp.x = ExpBar.barColorExp.x-((widthAnt-ExpBar.barColorExp.width)/2);
		}
		
		public function Spawn(X:int, Y:int, view:Sprite):void
		{
			model = new MC_Hero();
			view.addChild(model);
			
			model.scaleX = CurrentScale;
			model.scaleY = CurrentScale;
			
			model.x = X;
			model.y = Y;
			
			model.addEventListener("Idling",EvIdling);
			
		}
		
		public function Destroy(view:Sprite):void
		{
			model.removeEventListener("Idling",EvIdling);
			view.removeChild(model);
		}
		
		//Vel es CantidadVelocidad del Main que se la paso por parametro al Brain para despues pasarsela por parametro aca XD
		public function Moverse(Direccion:int, Vel:int):void
		{
			//
			model.x = model.x + (Velocidad + Vel/2) * Direccion;
			if(model.currentLabel != "Jump_Up" && model.currentLabel != "Jump_Down" && model.currentLabel != "Shoot_Walking" && model.currentLabel != "Walk")
			{
			   changeAnimation("Walk");
			}
			model.scaleX = CurrentScale * Direccion;
			Dir = Direccion;
		}
		
		
		public function Disparar(MiStage:Stage,PantallaSonido:String,settings:Settings,view:Sprite):void
		{
			//model.currentLabel != "Jump_Up" && model.currentLabel != "Jump_Down" && model.currentLabel != "Walk" && model.currentLabel != "Shoot_Walking"
			//Esto que comente recien era lo que estaba en este if de aca abajo como condicion XD
			if(model.currentLabel == "Idle")
			{
			   changeAnimation("Shoot");
			}
			else if (model.currentLabel == "Walk" && model.currentLabel != "Shoot_Walking")
			{
				changeAnimation("Shoot_Walking");
			}
			
			if(TodasBalas.length < 3)
			{
				var Wacho:BalasDeHero = new BalasDeHero();
				Wacho.spawn(model.x,model.y,Dir,view);
				TodasBalas.push(Wacho);
				if(!settings.MutearFX)
				{
					var Audio_Disparar:SoundController = new SoundController(new SND_Disparar(),MiStage,PantallaSonido);
					Audio_Disparar.play(0);
				}
			}
		}
		
		public function changeAnimation(name:String):void
		{
			if(model.currentLabel != name)
			{
				model.gotoAndPlay(name);
			}
		}
		
		
		protected function EvIdling(event:Event):void
		{
			//Main.Dinero = Main.Dinero + 10;
		}
	}
}