package
{
	import Partida.ManagerGame;
	import Models.Play;
	import Partida.Game;
	import Pantallas.Handler;
	import Personajes.Hero.Hero;
	import UI.Textos.Textos;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	[SWF(width = "800", height = "600", frameRate="60")]
	public class Main extends Sprite
	{
		private var play:Play = new Play();	
		private var game:Game = new Game();
		public function Main()
		{
			//Para hacer el load o el save correspondiente la primera vez.
			var MGame:ManagerGame = new ManagerGame();
			MGame.manageGame(game,play);
			play.MiStage = stage;
			var Texto:Textos = new Textos();
			play.textosModel.TextoDinero = Texto.dibujarTexto("",100,100,700,50,play.MiStage);
			play.Pantalla.CargarPantalla = "Inicio";
			play.Pantalla.PantallaSonido =  "Inicio";
			play.Pantalla.PantallaEjecutandose = 0;
			var functions:Functions = new Functions();
			play.MiStage.addEventListener(KeyboardEvent.KEY_UP,Callback.create(functions.SoltarTecla,game,play));
			play.MiStage.addEventListener(Event.ENTER_FRAME, update);
			//MiStage.addEventListener("Explosion",functions.EvExplosion);
		}

		private function update(evento:Event):void
		{
			//GitHub OP :B
			var handler:Handler = new Handler();
			play.Pantalla.Audio = handler.handlerSonido(play.Pantalla.PantallaSonido,game.settings.Mutear,play.Pantalla.Audio,play.MiStage);
			play.Pantalla.CargarPantalla = handler.cargarPantalla(game,play);
			play.Pantalla.CargarPantalla = handler.pantallaEjecutandose(game,play);
			play.textosModel.TextoDinero.text = "Dinero " + game.player.dinero;
		}
	}
}