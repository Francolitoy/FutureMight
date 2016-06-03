package Models
{
	import Personajes.Enemigos.BalasDeEnemies;
	import Personajes.Enemigos.Enemies;
	import Personajes.Enemigos.MinionEnemy;
	import Personajes.Enemigos.SlimeEnemy;
	import Personajes.Enemigos.TorretaEnemy;
	import Personajes.Enemigos.ZubatEnemy;
	import Personajes.Enemigos.MagnetBombEnemy;
	
	import flash.display.MovieClip;

	public class EnemiesModel
	{
		public var EnemigosMatados:int = 0;
		//borrar despues esta mierda XD
		public var Enemigos:Vector.<Enemies> = new Vector.<Enemies>;
		public var models:Vector.<MovieClip> = new Vector.<MovieClip>;
		public var AllZubat:Vector.<ZubatEnemy> = new Vector.<ZubatEnemy>();
		public var AllMinion:Vector.<MinionEnemy> = new Vector.<MinionEnemy>();
		public var AllSlime:Vector.<SlimeEnemy> = new Vector.<SlimeEnemy>();
		public var AllTorreta:Vector.<TorretaEnemy> = new Vector.<TorretaEnemy>();
		public var AllMagnetBomb:Vector.<MagnetBombEnemy> = new Vector.<MagnetBombEnemy>();
		public var TodasBalas:Vector.<BalasDeEnemies> = new Vector.<BalasDeEnemies>;
	}
}