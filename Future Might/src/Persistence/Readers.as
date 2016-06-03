package Persistence
{
	public class Readers
	{
		import flash.data.SQLConnection;
		import flash.data.SQLStatement;
		import flash.events.Event;
		import flash.events.SQLErrorEvent;
		import flash.events.SQLEvent;
		import flash.filesystem.File;
		internal var result:Array = new Array();
		private var stmt:SQLStatement = new SQLStatement();
		internal function sqlResult(res:SQLEvent):void{
			try
			{
				clearArray();
				var data:Array = stmt.getResult().data;
				result = new Array();
				for(var d:int=0;d<=data.length-1;d++)
				{
					result.push(data[d]);
				}
			} 
			catch(error:Error) 
			{
			}
		}
		internal function sqlError(err:SQLErrorEvent):void{
			trace(err.error.message);
		}
		
		internal function setSTMT(stmtInput:SQLStatement):void
		{
			stmt = stmtInput;
		}
		
		private function clearArray():void
		{
			while(result.length>0)
			{
				result.pop();
			}
		}
	}
}