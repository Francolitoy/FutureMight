package Personajes.Enemigos
{
	import Models.ConstantsModel;
	import Models.EnemiesModel;
	import Models.TextosModel;
	import Models.TimersModel;
	
	import flash.display.Stage;

	public class EnemiesCreator
	{
		private var constants:ConstantsModel = new ConstantsModel();
		public function EnemiesCreator()
		{
		}
		
		public function GeneradorFlyer(timersModel:TimersModel,MiStage:Stage,enemies:EnemiesModel):void
		{
			//Este timer no funciona bien si yo minimizo y maximizo el juego XD
			timersModel.TimerFlyer = timersModel.TimerFlyer + 1;
			
			if(timersModel.TimerFlyer >= constants.FrameRate)
			{
				var Berse:Enemies = new Enemies();
				Berse.spawn(1,MiStage);
				enemies.Enemigos.push(Berse);
				timersModel.TimerFlyer = 0;
			}
		}
		
		public function GeneradorTower(timersModel:TimersModel,MiStage:Stage,enemies:EnemiesModel):void
		{
			timersModel.TimerTower = timersModel.TimerTower + 1;
			
			if(timersModel.TimerTower >= constants.FrameRate *2)
			{
				var Berseke:Enemies = new Enemies();
				Berseke.spawn(2,MiStage);
				enemies.Enemigos.push(Berseke);
				timersModel.TimerTower = 0;
			}
		}
		
		public function GeneradorWalker(timersModel:TimersModel,MiStage:Stage,enemies:EnemiesModel):void
		{
			timersModel.TimerWalker = timersModel.TimerWalker + 1;
			if(timersModel.TimerWalker >= constants.FrameRate *3)
			{
				var Buerseker:Enemies = new Enemies();
				Buerseker.spawn(3,MiStage);
				enemies.Enemigos.push(Buerseker);
				timersModel.TimerWalker = 0;
			}
		}
	}
}