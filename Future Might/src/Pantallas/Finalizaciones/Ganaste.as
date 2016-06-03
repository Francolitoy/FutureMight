package Pantallas.Finalizaciones
{
	import Models.Play;
	import Models.TextosModel;
	
	import Partida.Game;
	
	import Personajes.GarbageCollector;
	
	import flash.display.Stage;
	import Pantallas.FuncionesPantallas;

	public class Ganaste extends FuncionesPantallas
	{
		import UI.Button.ButtonsHandler;
		import UI.SoundController;
		import flash.media.SoundMixer;
		public function init(textosModel:TextosModel,game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			LimpiarVariables(play,game);
			BotonUI.agregarEscenario(0,0, new MC_FondoGP,"FondoGP",false,6,5,game,play);
			BotonUI.agregarBoton(400,200, new MC_BotonGanaste,"BotonGanaste",false,game,play);
			BotonUI.agregarBoton(400,400, new MC_BotonContinuar,"BotonContinuar",true,game,play);
			resetearAudio("Ganaste",0,play.Pantalla,game.settings);
			return "Nada";
		}
	}
}