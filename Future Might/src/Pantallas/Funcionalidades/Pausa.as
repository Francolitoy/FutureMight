package Pantallas.Funcionalidades
{
	import Models.Play;
	
	import Partida.Game;
	
	import Personajes.GarbageCollector;
	
	import UI.Button.ButtonsHandler;
	import UI.Textos.TextosHandler;
	
	public class Pausa
	{
		public function init(game:Game,play:Play):void
		{
			play.pause = true;
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.agregarEscenario(0,0, new MC_FondoPausa,"FondoPausa",false,2,2,game,play);
			var textosHandler:TextosHandler = new TextosHandler();
			textosHandler.sacarTextos(play.MiStage,play.textosModel);
			textosHandler.agregarTextoPausa(400,400,"Reanudar",game,play);
			textosHandler.agregarTextoPausa(400,500,"Salir",game,play);
		}
		
		public function destroy(play:Play):void
		{
			var GC:GarbageCollector = new GarbageCollector();
			GC.EliminarEscenarios(play,false,play.ui.Escenarios.length-1);
			var textosHandler:TextosHandler = new TextosHandler();
			textosHandler.sacarTextos(play.MiStage,play.textosModel);
			play.pause = false;
		}
	}
}