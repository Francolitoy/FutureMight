package UI.Button
{
	import Models.PantallaModel;
	import Models.Play;
	import Models.UIModel;
	
	import Partida.Game;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundMixer;

	public class ButtonsHandler extends Buttons
	{
		
		public function ButtonsHandler()
		{
		}
		
		public function agregarBar(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):void
		{
			play.ui.Botones.push(crearBotonUI(X,Y,Boton,botonEvento,buttonMode,game,play));
		}
		
		public function agregarEscenario(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,scaleX:Number,scaleY:Number,game:Game,play:Play):void
		{
			play.ui.Escenarios.push(crearBotonEscenes(X,Y,Boton,botonEvento,buttonMode,scaleX,scaleY,game,play));
		}
		
		public function agregarBoton(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):void
		{
			play.ui.Botones.push(crearBotonUI(X,Y,Boton,botonEvento,buttonMode,game,play));
		}
		
		public function agregarNiveles(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,MiStage:Stage,pantalla:PantallaModel,ui:UIModel):void
		{
			ui.Niveles.push(crearBotonNiveles(X,Y,Boton,botonEvento,buttonMode,MiStage,pantalla));
		}
		
		private function crearBotonUI(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):MovieClip
		{
			var Boton:MovieClip;
			var BotonUI:ButtonsUI = new ButtonsUI();
			Boton=BotonUI.spawn(X,Y, Boton,botonEvento,buttonMode,game,play);
			return Boton;
		}
		
		private function crearBotonNiveles(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,MiStage:Stage,pantalla:PantallaModel):MovieClip
		{
			var Boton:MovieClip;
			var BotonUI:ButtonsNiveles = new ButtonsNiveles();
			Boton=BotonUI.spawn(X,Y, Boton,botonEvento,buttonMode,MiStage,pantalla);
			return Boton;
		}
		
		private function crearBotonEscenes(X:int, Y:int, Boton:MovieClip,botonEvento:String,buttonMode:Boolean,scaleX:Number,scaleY:Number,game:Game,play:Play):MovieClip
		{
			var Boton:MovieClip;
			var BotonUI:ButtonsEscenes = new ButtonsEscenes();
			Boton=BotonUI.spawn(X,Y, Boton,botonEvento,buttonMode,game,play);
			Boton.scaleX = scaleX;
			Boton.scaleY = scaleY;
			return Boton;
		}
	}
}