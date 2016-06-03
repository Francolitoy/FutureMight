package Pantallas.Funcionalidades
{
	import Models.Play;
	
	import Partida.Game;
	
	import flash.display.Stage;

	public class Upgrades
	{
		import UI.Button.ButtonsHandler;
		public function init(game:Game,play:Play):String
		{
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			BotonUI.agregarBoton(500,100, new MC_BotonAtaque,"BotonAtaque",true,game,play);
			BotonUI.agregarBoton(400,200, new MC_BotonAltura,"BotonAltura",true,game,play);
			BotonUI.agregarBoton(400,300, new MC_BotonVelocidad,"BotonVelocidad",true,game,play);
			BotonUI.agregarBoton(400,400, new MC_BotonSaltos,"BotonSaltos",true,game,play);
			BotonUI.agregarBoton(420,500, new MC_BotonVida,"BotonVida",true,game,play);
			BotonUI.agregarBoton(100,550, new MC_BotonSalirUpgrades,"BotonSalirUpgrades",true,game,play);
			return "Nada";
		}
	}
}