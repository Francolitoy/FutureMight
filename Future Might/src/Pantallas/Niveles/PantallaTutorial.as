package Pantallas.Niveles
{
	import Models.Play;
	import Models.TextosModel;
	import Models.TimersModel;
	
	import Partida.Game;
	
	import Personajes.Enemigos.Enemies;
	import Personajes.Enemigos.EnemiesCreator;
	import Personajes.GarbageCollector;
	import Personajes.Hero.Hero;
	import Personajes.IA;
	
	import UI.Textos.Textos;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	import Pantallas.FuncionesPantallas;
	
	public class PantallaTutorial extends FuncionesPantallas
	{		
		public function init(textosModel:TextosModel,game:Game,play:Play):String
		{
			var NivelTutorial:MovieClip = new MC_NivelTutorial;
			play.Pantalla.view = new Sprite();
			play.Pantalla.view.addChild(NivelTutorial);
			return iniciarPantallas(textosModel,game,play,-1,"Tutorial",-750,NivelTutorial);
		}
		
		public function exec(textosModel:TextosModel,timersModel:TimersModel,game:Game,play:Play):String
		{			
			var ia:IA = new IA();
			var enemiesC:EnemiesCreator = new EnemiesCreator();
			//enemiesC.GeneradorFlyer(timersModel,play.MiStage,play.enemies);
			ia.MoverDisparoEnemigos(play);
			ia.Pinches(game,play);
			UpdatePantalla(game,play,ia);
			if(play.hero.VidaPersonaje <= 0)
			{
				play.Pantalla.PantallaEjecutandose = 0;
				return "Perdiste";
			}
			
			if(play.enemies.EnemigosMatados >= 10)
			{
				if(game.nivel.iDPantalla < play.Pantalla.PantallaEjecutandose)
				{
					game.nivel.iDPantalla = play.Pantalla.PantallaEjecutandose;
				}
				
				play.Pantalla.PantallaEjecutandose = 0;
				return "Ganaste";
			}
			return "Nada";
		}
	}
}