package Personajes.Enemigos 
{
	import Models.ConstantsModel;
	import Models.Play;
	
	import Partida.Game;
	import Partida.Settings;
	
	import UI.SoundController;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import Personajes.Hero.Hero;

	public class PlayerBrain
	{
		private var isPressing_Left:Boolean;
		private var isPressing_Right:Boolean;
		private var isPressing_Shoot:Boolean;
		private var isPressing_Jump:Boolean;
		private var objectControlled:Hero;
		private var TeclaDerecha:int;
		private var TeclaIzquierda:int;
		private var TeclaSalto:int;
		private var TeclaShoot:int;
		private var AlturaMaxima:int = 0;
		private var AlturaMinima:int = 0;
		private var Cayendo:int = 0;
		private var Dispara:int = 0;
		private var Recarga:int = 0;
		private var Velocidad:int = 2;
		private var VelocidadSalto:Number = 9;
		private var FlagSaltar:int = 0;
		private var FlagCaer:int = 0;
		private var CantidadAltura:Number = 1;
		
		public function PlayerBrain(objectControlled:Hero, TeclaDer:int, TeclaIzq:int, TeclaSalto:int, TeclaShoot:int, CantidadAltura:Number, CantidadVelocidad:int,MiStage:Stage)
		{
			this.TeclaDerecha = TeclaDer;
			this.TeclaIzquierda = TeclaIzq;
			this.TeclaSalto = TeclaSalto;
			this.TeclaShoot = TeclaShoot;
			
			this.CantidadAltura = CantidadAltura;
			this.Velocidad = CantidadVelocidad;
			
			this.objectControlled = objectControlled;
			
			MiStage.addEventListener(KeyboardEvent.KEY_DOWN, ApretarTecla);
			MiStage.addEventListener(KeyboardEvent.KEY_UP, SoltarTecla);
		}
		
		private function colisionPared(play:Play,x:int):void
		{
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(objectControlled.model.Frente.hitTestObject(pared))
				{
					objectControlled.model.x = x;
				}
			}
			
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(objectControlled.model.Frente.hitTestObject(piso))
				{
					objectControlled.model.x = x;
				}
			}
		}
		
		public function Update(PantallaSonido:String,settings:Settings,play:Play):void
		{
			if(play.FlagRecoil == 0)
			{
				if(isPressing_Right )
				{
					PatchBugSaltoAnulado(play);
					objectControlled.Moverse(1,Velocidad);
					colisionPared(play,objectControlled.model.x - (Velocidad/2 + 2));
				}
				else if(isPressing_Left)
				{
					PatchBugSaltoAnulado(play);
					objectControlled.Moverse(-1,Velocidad);
					colisionPared(play,objectControlled.model.x + (Velocidad/2 + 2));
				}
				
				if(isPressing_Shoot)
				{
					//Disparar();
					Dispara = 1;
					Recarga = Recarga + 1;
				}
				else if (Dispara == 1)
				{
					Dispara = 0;
					objectControlled.Disparar(play.MiStage,PantallaSonido,settings,play.Pantalla.view);
					Recarga = 0;
				}
			}
			var constants:ConstantsModel = new ConstantsModel();
			if (isPressing_Jump) 
			{
				PatchBugSaltoAnulado(play);
			}
			//CantidadAltura tendria q ser el del Main XD (creo que Cantidad Altura ahora si es)
			if(isPressing_Jump && Cayendo == 0 && AlturaMaxima < CantidadAltura * constants.FrameRate/4 && play.FlagRecoil == 0)
			{
				Saltar(play.MiStage,PantallaSonido,settings,play);
			}
			else
			{
				Caer(play);
			}
			
			for(var I:int = Hero.TodasBalas.length-1; I >= 0; I--)
			{
				Hero.TodasBalas[I].Update();
			}
		}
		
		//este parche arregla el bug que sucede cuando la cabeza toca la pared y el frente tambien y los pies con el piso
		public function PatchBugSaltoAnulado(play:Play):void
		{
			var FlagPiso:Boolean = false;
			var FlagPared:Boolean = false;
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(objectControlled.model.Pies.hitTestObject(piso))
				{
					FlagPiso = true;
				}
			}
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(objectControlled.model.Pies.hitTestObject(pared))
				{
					FlagPared = true;
				}
			}
			if(FlagPiso || FlagPared)
			{
				if ((FlagSaltar == 1 && FlagCaer == 1) || (FlagSaltar == 0 && FlagCaer == 1)) 
				{
					FlagSaltar = 1;
					Cayendo = 0;
				}
			}
		}
		
		public function Saltar(MiStage:Stage,PantallaSonido:String,settings:Settings,play:Play):void
		{
			var FlagPiso:Boolean = false;
			var FlagPared:Boolean = false;
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(objectControlled.model.Cabeza.hitTestObject(piso))
				{
					FlagPiso = true;
				}
			}
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(objectControlled.model.Cabeza.hitTestObject(pared))
				{
					FlagPared = true;
				}
			}
			
			if(!FlagPiso && !FlagPared)
			{
				objectControlled.model.y = objectControlled.model.y - VelocidadSalto;
				objectControlled.changeAnimation("Jump_Up");
				AlturaMaxima = AlturaMaxima + 1;
				AlturaMinima = AlturaMaxima;
				
				/*if(VelocidadSalto < 10)
				{
					VelocidadSalto = VelocidadSalto + 0.5;
				}*/
				
				if(FlagSaltar == 0)
				{
					if(!settings.MutearFX)
					{
						var Audio_Saltar:SoundController = new SoundController(new SND_Saltar(),MiStage,PantallaSonido);
						Audio_Saltar.play(0);
					}
					FlagSaltar = 1;
					FlagCaer = 0;
				}
			}
			else
			{
				Cayendo = 1;
			}
		}
		
		public function Caer(play:Play):void
		{
			var FlagPiso:Boolean = false;
			var FlagPared:Boolean = false;
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(objectControlled.model.Pies.hitTestObject(piso))
				{
					FlagPiso = true;
				}

			}
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(objectControlled.model.Pies.hitTestObject(pared))
				{
					FlagPared = true;
				}
				
			}
			
			if(!FlagPiso && !FlagPared)
			{
				objectControlled.model.y = objectControlled.model.y + VelocidadSalto;
				objectControlled.changeAnimation("Jump_Down");
				AlturaMinima = AlturaMinima - 1;
				Cayendo = 1;
				FlagCaer = 0;
			}
			else if (FlagCaer == 0)
			{
				AlturaMaxima = 0;
				objectControlled.changeAnimation("Idle");
				Cayendo = 0;
				FlagSaltar = 0;
				FlagCaer = 1;
				//VelocidadSalto = 2;
			}
			
		}
		
		public function SoltarTecla(event:KeyboardEvent):void
		{	
			switch(event.keyCode)
			{
				case TeclaIzquierda:
					isPressing_Left = false;
					break;
				
				case TeclaDerecha:
					isPressing_Right = false;
					break;
				
				case TeclaShoot:
					isPressing_Shoot = false;
					break;
				
				case TeclaSalto:
					isPressing_Jump = false;
					break;
			}
			
			if(objectControlled.model.currentLabel != "Jump_Up" && objectControlled.model.currentLabel != "Jump_Down" && objectControlled.model.currentLabel != "Shoot" && isPressing_Left == false && isPressing_Right == false)
			{
				objectControlled.changeAnimation("Idle");
			}
		}
		
		public function ApretarTecla(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case TeclaIzquierda:
					isPressing_Left = true;
					break;
				
				case TeclaDerecha:
					isPressing_Right = true;
					break;
				
				case TeclaShoot:
					isPressing_Shoot = true;
					break;
				
				case TeclaSalto:
					isPressing_Jump = true;
					break;
			}
		}
	}
}