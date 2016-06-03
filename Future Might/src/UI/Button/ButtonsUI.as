package UI.Button
{
	import Models.PantallaModel;
	import Models.Play;
	
	import Pantallas.FuncionesPantallas;
	
	import Partida.Game;
	import Partida.Settings;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundMixer;
	import UI.CheckBox.CheckboxHandler;

	public class ButtonsUI extends Buttons
	{
		public function spawn(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):MovieClip
		{
			play.MiStage.addChild(Boton);
			Boton.x = X;
			Boton.y = Y;
			Boton.buttonMode = buttonMode;
			switch(botonEvento)
			{
				case "BotonAtaque":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonAtaqueClick,game,play));
					break;
				}
				
				case "BotonAltura":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonAlturaClick,game,play));
					break;
				}
				
				case "BotonVelocidad":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonVelocidadClick,game,play));
					break;
				}
				
				case "BotonSaltos":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSaltosClick,game,play));
					break;
				}
				
				case "BotonSalirUpgrades":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSalirUpgradesClick,play.Pantalla));
					break;
				}
				
				case "BotonVida":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonVidaClick,game,play));
					break;
				}
				
				case "BotonSalirHowToPlay":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSalirHowToPlayClick,play.Pantalla));
					break;
				}
				
				case "BotonSalirCreditos":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSalirCreditosClick,play));
					break;
				}
				
				case "BotonResetSi":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonResetSiClick,game,play));
					break;
				}
				
				case "BotonResetNo":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonResetNoClick,play.Pantalla));
					break;
				}
				
				case "BotonContinuar":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonGanasteClick,game.settings,play));
					break;
				}
				
				case "BotonPerdisteClick":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonPerdisteClick,game.settings,play));
					break;
				}
				
				case "BotonSalirConfig":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSalirConfigClick,play));
					break;
				}
					
				default:
				{
					break;
				}
			}
			return Boton;
		}
		
		private function BotonResetSiClick(event:MouseEvent,game:Game,play:Play):void
		{
			play.Pantalla.CargarPantalla = "Inicio";
			game.player.dinero = 500;
			game.nivel.iDPantalla = 0;
			game.stats.cantidadAtaque = 1;
			game.stats.cantidadAltura = 1;
			game.stats.cantidadSaltos = 1;
			game.stats.cantidadVelocidad = 1;
			game.stats.cantidadVida = 1;
			
			game.spend.precioAtaque = 50;
			game.spend.precioAltura = 100;
			game.spend.precioSaltos = 2000;
			game.spend.precioVelocidad = 50;
			game.spend.precioVida = 500;
			play.cambios = true;
		}	
		
		private function BotonResetNoClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Inicio";
		}
		
		private function BotonAtaqueClick(event:MouseEvent,game:Game,play:Play):void
		{
			if(game.player.dinero > game.spend.precioAtaque)
			{
				game.player.dinero = game.player.dinero - game.spend.precioAtaque;
				game.stats.cantidadAtaque = game.stats.cantidadAtaque + 1;
				game.spend.precioAtaque = game.spend.precioAtaque * 1.3;
				play.cambios = true;
			}
		}
		
		protected function BotonSalirHowToPlayClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Inicio";
		}

		private function BotonAlturaClick(event:MouseEvent,game:Game,play:Play):void
		{
			if(game.player.dinero > game.spend.precioAltura)
			{
				game.player.dinero = game.player.dinero - game.spend.precioAltura;
				game.stats.cantidadAltura = game.stats.cantidadAltura + 0.3;
				game.spend.precioAltura = game.spend.precioAltura * 1.3;
				play.cambios = true;
			}
		}
		
		private function BotonVelocidadClick(evento:Event,game:Game,play:Play):void
		{
			if(game.player.dinero > game.spend.precioVelocidad)
			{
				game.player.dinero = game.player.dinero - game.spend.precioVelocidad;
				game.stats.cantidadVelocidad = game.stats.cantidadVelocidad + 1;
				game.spend.precioVelocidad = game.spend.precioVelocidad * 1.3;
				play.cambios = true;
			}
		}
		
		private function BotonSaltosClick(evento:Event,game:Game,play:Play):void
		{
			if(game.player.dinero > game.spend.precioSaltos)
			{
				game.player.dinero = game.player.dinero - game.spend.precioSaltos;
				game.stats.cantidadSaltos = game.stats.cantidadSaltos + 1;
				game.spend.precioSaltos = game.spend.precioSaltos * 3;
				play.cambios = true;
			}
		}
		
		private function BotonVidaClick(event:MouseEvent,game:Game,play:Play):void
		{
			if(game.player.dinero > game.spend.precioVida)
			{
				game.player.dinero = game.player.dinero - game.spend.precioVida;
				game.stats.cantidadVida = game.stats.cantidadVida + 1;
				game.spend.precioVida = game.spend.precioVida * 1.3;
				play.cambios = true;
			}
		}
		
		private function BotonSalirUpgradesClick(evento:Event,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Inicio";
		}
		
		private function BotonPerdisteClick(evento:Event,settings:Settings,play:Play):void
		{			
			resetearAudio("Inicio",0,play.Pantalla,settings);
			play.Pantalla.CargarPantalla = "Inicio";
			play.cambios = true;
		}
		
		private function BotonGanasteClick(event:MouseEvent,settings:Settings,play:Play):void
		{
			resetearAudio("Inicio",0,play.Pantalla,settings);
			play.Pantalla.CargarPantalla = "Inicio";
			play.cambios = true;
		}
		
		private function BotonSalirCreditosClick(event:MouseEvent,play:Play):void
		{
			play.Pantalla.CargarPantalla = "Inicio";
			var CheckUI:CheckboxHandler = new CheckboxHandler();
			CheckUI.sacarChecks(play.MiStage,play.ui);
		}	
		
		private function BotonSalirConfigClick(event:MouseEvent,play:Play):void
		{
			play.Pantalla.CargarPantalla = "Inicio";
			play.Pantalla.PantallaEjecutandose = 0;
			var CheckUI:CheckboxHandler = new CheckboxHandler();
			CheckUI.sacarChecks(play.MiStage,play.ui);
		}	
	}
}