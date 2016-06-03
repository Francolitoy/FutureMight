package Pantallas.Informacion
{
	import flash.display.Stage;
	import Partida.Game;
	import Models.Play;
	public class Credits
	{
		import UI.Button.ButtonsHandler;
		
		public function init(game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			BotonUI.agregarBoton(200,200, new MC_FondoCreditos,"FondoCreditos",false,game,play);
			BotonUI.agregarBoton(400,500, new MC_BotonSalirCreditos,"BotonSalirCreditos",true,game,play);
			return "Nada";
		}
	}
}