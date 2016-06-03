package Persistence
{
	import Partida.*;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	public class Querys extends DBConection
	{
		private var conn:SQLConnection = new SQLConnection();
		
		private var stmt:SQLStatement = new SQLStatement();
		
		private const WHERE:String = " where id_player = ";
		
		public function saveGame(partida:Game):void
		{
			partida.player.id_player = getId_Player();
			insertPlayer(partida.player);
			partida.player.id_player = getId_Player();
			insertStats(partida.stats,partida.player.id_player);
			insertStage(partida.nivel,partida.player.id_player);
			insertSpend(partida.spend,partida.player.id_player);
			insertSettings(partida.settings,partida.player.id_player);
			insertVersion();
		}
		
		public function updateGame(partida:Game):void
		{
			partida.player.id_player = getId_Player();
			updatePlayer(partida.player);
			updateStats(partida.stats,partida.player.id_player);
			updateStage(partida.nivel,partida.player.id_player);
			updateSpend(partida.spend,partida.player.id_player);
			updateSettings(partida.settings,partida.player.id_player);
		}
		
		private function insertPlayer(player:Player):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO player (name,money,exp,siguienteNivel,lvl) VALUES('"+player.name+"',"+player.dinero+","+player.exp+","+player.siguienteNivel+","+player.lvl+")";
			stmt.execute();
		}
		
		private function updatePlayer(player:Player):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE player set name = '"+player.name+"', money = "+player.dinero+", exp = "+player.exp +", siguienteNivel = "+player.siguienteNivel +", lvl = "+player.lvl + WHERE + player.id_player;
			stmt.execute();
		}
		
		private function insertStats(stats:Stats,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO Stats (hp,altura,atk,saltos,spd,puntos,id_player) VALUES("+stats.cantidadVida+","+stats.cantidadAltura+","+stats.cantidadAtaque+","+stats.cantidadSaltos+","+stats.cantidadVelocidad+","+stats.puntos+","+id_player+")";
			stmt.execute();
		}
		
		private function updateStats(stats:Stats,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE Stats set hp="+stats.cantidadVida+", altura="+stats.cantidadAltura+", atk="+stats.cantidadAtaque+", saltos="+stats.cantidadSaltos+", spd="+stats.cantidadVelocidad+", puntos="+stats.puntos + WHERE + id_player;
			stmt.execute();
		}
		
		private function insertStage(nivel:Nivel,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO Stage (stage,id_player) VALUES("+nivel.iDPantalla+","+id_player+")";
			stmt.execute();
		}
		
		private function updateStage(nivel:Nivel,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE Stage set stage = "+nivel.iDPantalla + WHERE + id_player;
			stmt.execute();
		}
		
		private function insertSpend(spend:Spend,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO Spend (Shp,Saltura,Satk,Ssaltos,Sspd,id_player) VALUES("+spend.precioVida+","+spend.precioAltura+","+spend.precioAtaque+","+spend.precioSaltos+","+spend.precioVelocidad+","+id_player+")";
			stmt.execute();
		}
		
		private function updateSpend(spend:Spend,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE Spend set Shp="+spend.precioVida+", Saltura="+spend.precioAltura+", Satk="+spend.precioAtaque+", Ssaltos="+spend.precioSaltos+", Sspd="+spend.precioVelocidad + WHERE + id_player;
			stmt.execute();
		}
		
		private function insertSettings(settings:Settings,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO settings (Mutear,MutearFX,Arriba,Abajo,Derecha,Izquierda,Disparo,id_player) VALUES("+int(settings.Mutear)+","+int(settings.MutearFX)+","+settings.Arriba+","+settings.Abajo+","+settings.Derecha+","+settings.Izquierda+","+settings.Disparo+","+id_player+")";
			stmt.execute();
		}
		
		private function updateSettings(settings:Settings,id_player:int):void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE settings set Mutear = "+int(settings.Mutear)+", MutearFX = "+int(settings.MutearFX)+", Arriba = "+settings.Arriba+", Abajo = "+settings.Abajo+", Derecha = "+settings.Derecha+", Izquierda = "+settings.Izquierda+", Disparo = "+settings.Disparo + WHERE + id_player;
			stmt.execute();
		}
		
		private function insertVersion():void
		{
			stmt.sqlConnection = conn;
			stmt.text = "INSERT INTO Version (Version) VALUES('"+VERSION+"')";
			stmt.execute();
		}
		
		private function updateVersion():void
		{
			stmt.sqlConnection = conn;
			stmt.text = "UPDATE Version set Version = '"+VERSION+"'";
			stmt.execute();
		}
		
		public function getId_Player():int
		{
			var id_player:int = 0;
			stmt.sqlConnection = this.isDbConnected(conn,conn,stmt);
			stmt.text = "SELECT id_player FROM player";
			stmt.addEventListener(SQLErrorEvent.ERROR, sqlError);
			stmt.addEventListener(SQLEvent.RESULT, sqlResult);
			execSTMT();
			if(result.length > 0)
			{
				id_player = int(result[0]["id_player"].toString());
			}
			return id_player;
		}
		
		public function loadGame():Array
		{
			stmt.sqlConnection = this.isDbConnected(conn,conn,stmt);
			stmt.text = "select p.name,p.money,p.exp,p.siguienteNivel,p.lvl,s.Shp,s.Saltura,s.Satk,s.Ssaltos,"
			stmt.text += "s.Sspd,stg.stage,st.hp,st.altura,st.atk,st.saltos,st.spd,st.puntos,sti.Mutear,sti.MutearFX,";
			stmt.text += "sti.Arriba,sti.Abajo,sti.Derecha,sti.Izquierda,sti.Disparo from player p";
			stmt.text += " inner join spend s on s.id_player = p.id_player";
			stmt.text += " inner join stage stg on stg.id_player = p.id_player";
			stmt.text += " inner join stats st on st.id_player = p.id_player";
			stmt.text += " inner join settings sti on sti.id_player = st.id_player";
			stmt.addEventListener(SQLErrorEvent.ERROR, sqlError);
			stmt.addEventListener(SQLEvent.RESULT, sqlResult);
			execSTMT();
			return result;
		}
		
		private function execSTMT():void
		{
			setSTMT(stmt);
			stmt.execute();
		}
		
	}
}