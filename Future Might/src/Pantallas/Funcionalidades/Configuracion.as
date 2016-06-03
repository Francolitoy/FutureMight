package Pantallas.Funcionalidades
{
	import Models.Play;
	
	import Partida.Game;
	
	import UI.Button.ButtonsHandler;
	import UI.CheckBox.CheckboxHandler;
	import UI.Textos.Textos;
	import UI.Textos.TextosHandler;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	public class Configuracion
	{
		public function init(game:Game,play:Play):String
		{
			/*var functions:Functions = new Functions();
			play.MiStage.removeEventListener(KeyboardEvent.KEY_UP,Callback.create(functions.SoltarTecla,game,play));*/
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			//BotonUI.agregarBoton(200,200, new MC_BotonSettings,"FondoCreditos",false,game,play);
			BotonUI.agregarBoton(400,500, new MC_BotonSalirCreditos,"BotonSalirConfig",true,game,play);
			var CheckUI:CheckboxHandler = new CheckboxHandler();
			CheckUI.sacarChecks(play.MiStage,play.ui);
			CheckUI.agregarCheckbox(200,50, "Musica",false,game,play);
			var textosHandler:TextosHandler = new TextosHandler();
			textosHandler.sacarTextos(play.MiStage,play.textosModel);
			textosHandler.agregarTextoConfig(200,100,"TextoArriba",game,play);
			textosHandler.agregarTextoConfig(200,150,"TextoABajo",game,play);
			textosHandler.agregarTextoConfig(200,200,"TextoDerecha",game,play);
			textosHandler.agregarTextoConfig(200,250,"TextoIzquierda",game,play);
			textosHandler.agregarTextoConfig(200,300,"TextoDisparo",game,play);
			play.textosModel.TextoDinero.text = "";
			play.Pantalla.PantallaEjecutandose = -2;
			return "Nada";
		}
	}
}