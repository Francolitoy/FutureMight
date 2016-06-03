package Partida
{
	import Models.Play;
	
	import Persistence.Querys;
	
	public class ManagerGame
	{
		public function manageGame(game:Game,play:Play):void
		{
			var cn:Querys = new Querys();
			var id_player:int = cn.getId_Player();
			if(play.inicio)
			{
				setGame(game);
				if(id_player > 0)
				{
					var result:Array = cn.loadGame();
					setLoadedGame(result,game);
				}
				else
				{
					cn.saveGame(game);
				}
				play.inicio = false;
			}
			else
			{
				if(play.cambios)
				{
					cn.updateGame(game);
					play.cambios = false;
				}
			}
		}
		
		private function setLoadedGame(result:Array,game:Game) : void
		{
			//Player
			game.player.name = result[0]["name"];
			game.player.dinero = result[0]["money"];
			game.player.exp = result[0]["exp"];
			game.player.siguienteNivel = result[0]["siguienteNivel"];
			game.player.lvl = result[0]["lvl"];
			//Puntos Stats
			game.spend.precioAltura = result[0]["Saltura"];
			game.spend.precioAtaque = result[0]["Satk"];
			game.spend.precioSaltos = result[0]["Ssaltos"];
			game.spend.precioVelocidad = result[0]["Sspd"];
			game.spend.precioVida = result[0]["Shp"];
			game.nivel.iDPantalla = result[0]["stage"];
			//Stats
			game.stats.cantidadAltura = result[0]["altura"];
			game.stats.cantidadAtaque = result[0]["atk"];
			game.stats.cantidadSaltos = result[0]["saltos"];
			game.stats.cantidadVelocidad = result[0]["spd"];
			game.stats.cantidadVida = result[0]["hp"];
			game.stats.puntos = result[0]["puntos"];
			//Configuracion
			game.settings.Mutear = result[0]["Mutear"];
			game.settings.MutearFX = result[0]["MutearFX"];
			game.settings.Arriba = result[0]["Arriba"];
			game.settings.Abajo = result[0]["Abajo"];
			game.settings.Derecha = result[0]["Derecha"];
			game.settings.Izquierda = result[0]["Izquierda"];
			game.settings.Disparo = result[0]["Disparo"];
		}
		
		private function setGame(game:Game) : void
		{
			game.player = setPlayer();
			game.nivel = setStage();
			game.stats = setStats();
			game.spend = setSpend();
			game.settings = setSettings();
			game.bestiario = setBestiario();
		}
		
		private function setPlayer() : Partida.Player
		{
			var player:Partida.Player = new Player();
			player.name = "german";
			player.dinero = 500;
			player.exp = 0;
			player.siguienteNivel = 5;
			player.lvl = 1;
			return player;
		}
		
		private function setStage() : Partida.Nivel
		{
			var nivel:Partida.Nivel = new Nivel();;
			nivel.iDPantalla = 0;
			return nivel;
		}
		
		private function setStats() : Partida.Stats
		{
			var stats:Partida.Stats = new Stats();
			stats.cantidadAltura = 1;
			stats.cantidadAtaque = 1;
			stats.cantidadSaltos = 1;
			stats.cantidadVelocidad = 1;
			stats.cantidadVida = 1;
			stats.puntos = 0;
			return stats;
		}
		
		private function setSpend() : Partida.Spend
		{
			var spend:Partida.Spend = new Spend();
			spend.precioAltura = 100;
			spend.precioAtaque = 50;
			spend.precioSaltos = 2000;
			spend.precioVelocidad = 50;
			spend.precioVida = 500;
			return spend;
		}
		
		private function setSettings() : Partida.Settings
		{
			var settings:Partida.Settings = new Settings();
			settings.Mutear = false;
			settings.MutearFX = false;
			settings.Arriba = 87;
			settings.Abajo = 83;
			settings.Derecha = 39;
			settings.Izquierda = 37;
			settings.Disparo = 69;
			return settings;
		}
		
		private function setBestiario() : Partida.Bestiario
		{
			var bestiario:Partida.Bestiario = new Bestiario();
			bestiario.slime = false;
			bestiario.minion = false;
			bestiario.zubat = false;
			bestiario.torreta = false;
			bestiario.magnetBomb = false;
			return bestiario;
		}
	}
}