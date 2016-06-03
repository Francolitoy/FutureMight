package UI.Button
{
	import Models.PantallaModel;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundMixer;

	public class ButtonsNiveles extends Buttons
	{
		public function spawn(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,MiStage:Stage,pantalla:PantallaModel):MovieClip
		{
			MiStage.addChild(Boton);
			Boton.x = X;
			Boton.y = Y;
			Boton.buttonMode = buttonMode;
			
			switch(botonEvento)
			{	
				case "BotonTutorialClick":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonTutorialClick,pantalla));
					break;
				}
				case "Boton1Click":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.Boton1Click,pantalla));
					break;
				}
					
				case "Boton2Click":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.Boton2Click,pantalla));
					break;
				}
				
				case "Boton3Click":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.Boton3Click,pantalla));
					break;
				}
				
				case "Boton4Click":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.Boton4Click,pantalla));
					break;
				}
				
				case "BotonJefeClick":
				{
					Boton.addEventListener(MouseEvent.CLICK,Callback.create(this.BotonJefeClick,pantalla));
					break;
				}
				
				default:
				{
					break;
				}
			}
			return Boton;
		}
		
		private function BotonTutorialClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Tutorial";
		}
		
		private function Boton1Click(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "1";
		}
		
		private function Boton2Click(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "2";
		}
		
		private function Boton3Click(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "3";
		}
		
		private function Boton4Click(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "4";
		}
		
		private function BotonJefeClick(event:MouseEvent,pantalla:PantallaModel):void
		{
			pantalla.CargarPantalla = "Jefe";
		}
	}
}