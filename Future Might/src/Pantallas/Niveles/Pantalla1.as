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
	
	public class Pantalla1 extends FuncionesPantallas
	{		
		public function init(textosModel:TextosModel,game:Game,play:Play):String
		{
			var Nivel1:MovieClip = new MC_Nivel1;
			play.Pantalla.view = new Sprite();
			play.Pantalla.view.addChild(Nivel1);
			return iniciarPantallas(textosModel,game,play,1,"1",-750,Nivel1);
		}
		
		public function exec(textosModel:TextosModel,timersModel:TimersModel,game:Game,play:Play):String
		{			
			var ia:IA = new IA();
			//var enemiesC:EnemiesCreator = new EnemiesCreator();
			//enemiesC.GeneradorFlyer(timersModel,play.MiStage,play.enemies);
			ia.MoverDisparoEnemigos(play);
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