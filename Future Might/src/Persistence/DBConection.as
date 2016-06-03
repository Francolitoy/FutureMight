package Persistence
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	//import Persistence.Querys;
	
	public class DBConection extends Readers
	{
		private const FK:String = ",id_player INTEGER ,FOREIGN KEY(id_player) REFERENCES Player(id_player)";
		protected const VERSION:String = "1.0";
		
		internal function dbinit(event:Event,conn:SQLConnection,stmt:SQLStatement):void
		{
			var dir:File = File.applicationDirectory;
			//
			var db:File = dir.resolvePath("future.db");
			// after we set the file for our database we need to open it with our SQLConnection.
			conn.openAsync(db);
			//We set event listeners to check that the database is opened
			//The second event listener is to catch any processing errors
			//The last is handle the results from our queries since
			//Actionscript is an event based language.
			conn.addEventListener(SQLEvent.OPEN, dbLoadedPlayer);
			conn.addEventListener(SQLErrorEvent.ERROR, sqlError);
			conn.addEventListener(SQLEvent.RESULT, sqlResult);
			dbLoadedPlayer(conn,stmt);
		}
		
		//Function to check is the database is connected and that the contacts.db
		//actually exist.
		internal function isDbConnected(conDb:SQLConnection,conn:SQLConnection,stmt:SQLStatement):SQLConnection{
			var dir:File = File.applicationDirectory;
			var db:File = dir.resolvePath("future.db");
			if(!conDb.connected){
				conDb.open(db);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedPlayer);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedStats);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedStage);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedSpend);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedSettings);
				conn.addEventListener(SQLEvent.OPEN, dbLoadedVersion);
				conn.addEventListener(SQLErrorEvent.ERROR, sqlError);
				conn.addEventListener(SQLEvent.RESULT, sqlResult);
				dbLoadedPlayer(conn,stmt);
				dbLoadedStats(conn,stmt);
				dbLoadedStage(conn,stmt);
				dbLoadedSpend(conn,stmt);
				dbLoadedSettings(conn,stmt);
				dbLoadedVersion(conn,stmt);
			}
			return conDb;
		}
		
		internal function dbLoadedPlayer(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Player ( id_player INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,money MONEY, exp BIGINT, siguienteNivel BIGINT , lvl INTEGER); ";
			stmt.execute();
		}
		
		internal function dbLoadedStats(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Stats ( id_stats INTEGER PRIMARY KEY AUTOINCREMENT, hp BIGINT,altura FLOAT,atk BIGINT,saltos BIGINT,spd BIGINT, puntos BIGINT "+FK+"); ";
			stmt.execute();
		}
		
		internal function dbLoadedStage(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Stage ( id_stage INTEGER PRIMARY KEY AUTOINCREMENT, stage BIGINT "+FK+"); ";
			stmt.execute();
		}

		internal function dbLoadedSpend(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Spend ( id_spend INTEGER PRIMARY KEY AUTOINCREMENT, Shp BIGINT,Saltura BIGINT,Satk BIGINT,Ssaltos BIGINT,Sspd BIGINT "+FK+");";
			stmt.execute();
		}
		internal function dbLoadedSettings(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Settings ( id_setting INTEGER PRIMARY KEY AUTOINCREMENT,Mutear INTEGER , MutearFX INTEGER ,Arriba INTEGER ,Abajo INTEGER ,Derecha INTEGER , Izquierda INTEGER,Disparo INTEGER "+FK+");";
			stmt.execute();
		}
		internal function dbLoadedVersion(conn:SQLConnection,stmt:SQLStatement):void{
			stmt.sqlConnection = conn;
			stmt.text = "CREATE TABLE IF NOT EXISTS Version ( id_version INTEGER PRIMARY KEY AUTOINCREMENT, Version TEXT );";
			stmt.execute();
		}
	}
}