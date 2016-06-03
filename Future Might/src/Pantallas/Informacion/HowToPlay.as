package Pantallas.Informacion
{
	import flash.display.Stage;
	import Partida.Game;
	import Models.Play;
	public class HowToPlay
	{
		import UI.Button.ButtonsHandler;
		public function init(game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			//BotonUI.agregarEscenario(300,200, new MC_FondoHowToPlay,"FondoHowToPlay",false,0.8,0.8,game,play);
			BotonUI.agregarBoton(400,500, new MC_SalirHowToPlay,"BotonSalirHowToPlay",true,game,play);
			return "Nada";
		}
	}
}