package UI.Textos
{
	import Models.PantallaModel;
	import Models.Play;
	import Models.TextosModel;
	
	import Pantallas.FuncionesPantallas;
	import Pantallas.Funcionalidades.Pausa;
	
	import Partida.Game;
	import Partida.Settings;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class TextosPausa extends Textos
	{
		public function spawn(X:int, Y:int, textField:TextField,textoEvento:String,game:Game,play:Play):TextField
		{
			play.MiStage.addChild(textField);
			textField.x = X;
			textField.y = Y;
			var ancho:int = 250;
			var alto:int = 30;
			switch(textoEvento)
			{
				case "Reanudar":
				{
					dibujarTextoBoton(textoEvento,ancho,alto,X,Y,textField,false,false);
					textField.addEventListener(MouseEvent.CLICK,Callback.create(this.clickReanudar,play));
					break;
				}
				
				case "Salir":
				{
					dibujarTextoBoton(textoEvento,ancho,alto,X,Y,textField,false,false);
					textField.addEventListener(MouseEvent.CLICK,Callback.create(this.clickSalir,play,game));
					break;
				}
				
				default:
				{
					break;
				}
			}
			return textField;
		}
		private function cerrar(play:Play):void
		{
			var pausa:Pausa = new Pausa();
			pausa.destroy(play);
		}
		
		private function clickReanudar(e:MouseEvent,play:Play):void
		{
			cerrar(play);
		}
		
		private function clickSalir(e:MouseEvent,play:Play,game:Game):void
		{
			if (play.Pantalla.PantallaEjecutandose != 0) 
			{
				play.Pantalla.CargarPantalla = "Inicio";
				LimpiarVariables(play,game);
			}
			cerrar(play);
			resetearAudio("Inicio",0,play.Pantalla,game.settings);
			play.cambios = true;
		}
	}
}