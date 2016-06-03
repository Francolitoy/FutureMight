package UI.Button
{
	//Hay que sacarlo despues, solo sirve para credits
	import Models.PantallaModel;
	import Models.Play;
	
	import Partida.Game;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundMixer;

	public class ButtonsEscenes extends Buttons
	{
		public function spawn(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):MovieClip
		{
			play.MiStage.addChild(Boton);
			Boton.x = X;
			Boton.y = Y;
			Boton.buttonMode = buttonMode;
			switch(botonEvento)
			{
				case "BotonUpgrades":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonUpgradesClick,play.Pantalla));
					break;
				}
				
				case "BotonHowToPlay":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonHowToPlayClick,play.Pantalla));
					break;
				}
					
				case "BotonSettings":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonSettingsClick,play.Pantalla));
					break;
				}	
					
				case "BotonReset":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonResetClick,play.Pantalla));
					break;
				}
				
				case "BotonCreditos":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonCreditosClick,game,play));
					break;
				}				
									
				default:
				{
					break;
				}
			}
			return Boton;
		}
		
		private function BotonUpgradesClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Upgrades";
		}
		
		private function BotonHowToPlayClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "HowToPlay";
		}
		
		private function BotonCreditosClick(event:MouseEvent,game:Game,play:Play):void
		{
			play.Pantalla.CargarPantalla = "Creditos";
			game.player.dinero = game.player.dinero + play.cheats.Creditos;
			play.cheats.Creditos = play.cheats.Creditos * 2;
			play.cambios = true;
		}
		
		private function BotonResetClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Reset";
		}
		
		private function BotonSettingsClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Settings";
		}
	}
}