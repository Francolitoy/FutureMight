package Pantallas
{
	import Models.Play;
	
	import flash.display.Stage;

	public class Inicio
	{
		import UI.Button.ButtonsHandler;
		import Partida.Game;
		import Partida.ManagerGame;
		public function init(game:Game,play:Play):String
		{
			var MGame:ManagerGame = new ManagerGame();
			MGame.manageGame(game,play);
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			BotonUI.agregarEscenario(0,0, new MC_FondoPrincipal,"FondoPrincipal",false,1,1,game,play);
			BotonUI.agregarNiveles(200,100, new MC_BotonTutorial,"BotonTutorialClick",true,play.MiStage,play.Pantalla,play.ui);
			BotonUI.agregarNiveles(500,100, new MC_Boton1,"Boton1Click",true,play.MiStage,play.Pantalla,play.ui);
			BotonUI.agregarNiveles(200,300, new MC_Boton2,"Boton2Click",true,play.MiStage,play.Pantalla,play.ui);
			BotonUI.agregarNiveles(500,300, new MC_Boton3,"Boton3Click",true,play.MiStage,play.Pantalla,play.ui);
			BotonUI.agregarNiveles(400,500, new MC_Boton4,"Boton4Click",true,play.MiStage,play.Pantalla,play.ui);
			BotonUI.agregarNiveles(350,300, new MC_BotonJefe,"BotonJefeClick",true,play.MiStage,play.Pantalla,play.ui);
			//BotonUI.agregarEscenario(200,500, new MC_BotonUpgrades,"BotonUpgrades",true,1,1,game,play);
			//BotonUI.agregarEscenario(500,500, new MC_BotonHowToPlay,"BotonHowToPlay",true,1,1,game,play);
			//BotonUI.agregarEscenario(200,400, new MC_BotonReset,"BotonReset",true,1,1,game,play);
			//BotonUI.agregarEscenario(500,400, new MC_BotonCreditos,"BotonCreditos",true,1,1,game,play);
			BotonUI.agregarEscenario(700,200, new MC_BotonSettings,"BotonSettings",true,1,1,game,play);
			
			if(game.nivel.iDPantalla < 1)
			{
				play.ui.Niveles[2].visible = false;
			}
			
			if(game.nivel.iDPantalla < 2)
			{
				play.ui.Niveles[3].visible = false;
			}
			
			if(game.nivel.iDPantalla < 3)
			{
				play.ui.Niveles[4].visible = false;
			}
			
			if(game.nivel.iDPantalla < 8000)
			{
				play.ui.Niveles[5].visible = false;
			}
			play.Pantalla.PantallaSonido = "Inicio";
			return "Nada";
		}
	}
}