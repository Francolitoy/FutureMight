package Models
{
	import Personajes.Enemigos.Enemies;
	
	import flash.display.MovieClip;
	import flash.display.Stage; //Nido XD

	public class Play
	{
		//variables
		public var MiStage:Stage;
		public var cambios:Boolean = false;
		public var inicio:Boolean = true;
		public var allBrains:Array = new Array();
		//Objetos
		public var Pantalla:PantallaModel = new PantallaModel();
		public var textosModel:TextosModel = new TextosModel();
		public var Timers:TimersModel = new TimersModel();
		public var hero:HeroModel = new HeroModel();
		public var constants:ConstantsModel = new ConstantsModel();
		public var cheats:CheatsModel = new CheatsModel();
		public var enemies:EnemiesModel = new EnemiesModel();
		public var ui:UIModel = new UIModel();
		public var FlagRecoil:int = 0;
		public var FlagInvencibilidad:int = 0;
		public var pause:Boolean = false;
	}
}