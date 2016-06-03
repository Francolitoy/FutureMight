package Pantallas.Funcionalidades
{
	import Models.Play;
	
	import Partida.Game;
	
	import UI.Button.ButtonsHandler;
	
	import flash.display.Stage;

	public class Reset
	{
		public function init(game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			BotonUI.agregarBoton(200,300, new MC_BotonResetSi,"BotonResetSi",true,game,play);
			BotonUI.agregarBoton(600,300, new MC_BotonResetNo,"BotonResetNo",true,game,play);
			return "Nada";
		}
	}
}