package Pantallas.Finalizaciones
{
	import Models.Play;
	import Models.TextosModel;
	import Partida.Game;	
	import Personajes.GarbageCollector;
	import flash.display.Stage;
	import Pantallas.FuncionesPantallas;

	public class Perdiste extends FuncionesPantallas
	{
		import UI.Button.ButtonsHandler;
		import UI.SoundController;
		import flash.media.SoundMixer;
		public function init(textosModel:TextosModel,game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			LimpiarVariables(play,game);
			BotonUI.agregarEscenario(0,0, new MC_FondoGP,"FondoGP",false,6,5,game,play);
			BotonUI.agregarBoton(400,200, new MC_BotonPerdiste,"BotonPerdiste",false,game,play);
			BotonUI.agregarBoton(400,400, new MC_BotonContinuar,"BotonPerdisteClick",true,game,play);
			//game.player.dinero = game.player.dinero + 50;
			resetearAudio("Perdiste",0,play.Pantalla,game.settings);
			return "Nada";
		}
	}
}