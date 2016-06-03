package Pantallas.Niveles
{
	import Models.Play;
	import Models.TextosModel;
	
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

	public class PantallaJefe extends FuncionesPantallas
	{

		private var VidaJefe:int = 1000;
		//private var Jefe:MC_Francolitoy;
		public function init(textosModel:TextosModel,game:Game,play:Play):String
		{
			var Texto:Textos = new Textos();
			var NivelJ:MovieClip = new MC_Nivel2;
			play.Pantalla.view = new Sprite();
			play.Pantalla.view.addChild(NivelJ);
			var ret:String = iniciarPantallas(textosModel,game,play,5,"Jefe",100,NivelJ);
			var Franc:Enemies = new Enemies();
			Franc.spawn(4,play.MiStage);
			play.enemies.Enemigos.push(Franc);
			play.enemies.Enemigos[0].model.scaleX = 0.5;
			play.enemies.Enemigos[0].model.scaleY = 0.5;
			play.enemies.Enemigos[0].model.x = play.MiStage.mouseX;
			play.enemies.Enemigos[0].model.y = play.MiStage.mouseY;
			textosModel.TextoVidaJefe = Texto.dibujarTexto("1000",200,200,600,500,play.MiStage);
			return ret;
		}
		public function exec(textosModel:TextosModel,game:Game,play:Play):String
		{			
			textosModel.TextoVida.text = "Vidas Restantes = " + play.hero.VidaPersonaje;
			textosModel.TextoVidaJefe.text = "Vida del Jefe = " + play.enemies.Enemigos[0].Vida;
			
			play.enemies.Enemigos[0].model.x = play.MiStage.mouseX;
			play.enemies.Enemigos[0].model.y = play.MiStage.mouseY;
			
			for(var I:int = play.allBrains.length -1; I >= 0; I--)
			{
				play.allBrains[I].Update(game.nivel.iDPantalla,game.settings,play);
			}
			var ia:IA = new IA();
			//ia.MoverDisparoEnemigos();
			ia.GenerarDisparoEnemigos(play);
			var GC:GarbageCollector = new GarbageCollector();
			GC.EliminarBalas(1,play.Pantalla.view,play);
			
			ia.ComprobarColisiones(game,play);
			
			if(play.hero.VidaPersonaje <= 0)
			{
				if(play.enemies.Enemigos[0].Vida >= 700)
				{
					game.player.dinero = game.player.dinero + 100;
				}
				else if(play.enemies.Enemigos[0].Vida >= 450)
				{
					game.player.dinero = game.player.dinero + 300;
				}
				else
				{
					game.player.dinero = game.player.dinero + 500;
				}
				play.MiStage.removeChild(textosModel.TextoVidaJefe);
				play.Pantalla.PantallaEjecutandose = 0;
				return "Perdiste";
				
			}
			
			if(play.enemies.Enemigos[0].Vida <= 0)
			{
				if(game.nivel.iDPantalla < play.Pantalla.PantallaEjecutandose)
				{
					game.nivel.iDPantalla = play.Pantalla.PantallaEjecutandose;
				}
				play.MiStage.removeChild(textosModel.TextoVidaJefe);
				game.player.dinero = 9001;
				play.Pantalla.PantallaEjecutandose = 0;
				return "Ganaste";
			}
			return "Nada";
		}
	}
}