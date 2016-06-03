package Personajes
{
	import Models.Play;
	
	import Partida.Game;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import Personajes.Hero.Hero;

	public class GarbageCollector
	{
		public function GarbageCollector()
		{
		}
		
		public function EliminarEscenarios(play:Play,todo:Boolean,index:uint):void
		{
			if (todo) 
			{
				for (var i:int = 0; i < play.ui.Escenarios.length; i++) 
				{
					play.MiStage.removeChild(play.ui.Escenarios[i]);
					play.ui.Escenarios.splice(i,1);
				}
			}
			else
			{
				play.MiStage.removeChild(play.ui.Escenarios[index]);
				play.ui.Escenarios.splice(index,1);
			}
		}
		
		//Si el Valor es 1 Significa que el juego esta Corriendo y si es 0 es que necesito Borrarlos si o si XD
		public function EliminarBalas(Valor:int,view:Sprite,play:Play):void
		{
			for(var I:int = Hero.TodasBalas.length -1; I >= 0; I--)
			{
				if(Hero.TodasBalas[I].Distancia >= 40 || Valor == 0)
				{
					view.removeChild(Hero.TodasBalas[I].model);
					Hero.TodasBalas.splice(I,1);
					if(Valor == 1)
					{
						return;
					}
				}
			}

			for(I =  play.enemies.TodasBalas.length -1; I >= 0; I--)
			{
				if(play.enemies.TodasBalas[I].Distancia >= 200 || Valor == 0 )
				{
					view.removeChild(play.enemies.TodasBalas[I].model);
					play.enemies.TodasBalas.splice(I,1);
					if(Valor == 1)
					{
						return;
					}
				}
			}
			
		}
		
		//Cuando elimino un Flyer le paso un valor, si ese Valor es 1 significa que el juego esta corriendo, si el Valor es 0 significa que lo tengo q borrar si o si XD
		public function EliminarEnemigos(Valor:int,game:Game,play:Play):void
		{
			for(var I:int = play.enemies.Enemigos.length - 1; I >= 0; I--)
			{        
				if(play.enemies.Enemigos[I].model != null)
				{
					if(play.enemies.Enemigos[I].model.x < 0 - play.enemies.Enemigos[I].model.width || Valor == 0)
					{
						play.MiStage.removeChild(play.enemies.Enemigos[I].model);
						play.enemies.Enemigos.splice(I,1);
						
						if(Valor == 1)
						{
							play.hero.VidaPersonaje = play.hero.VidaPersonaje - 1;
							return;
						}
					}
				}
			}
		}
	}
}