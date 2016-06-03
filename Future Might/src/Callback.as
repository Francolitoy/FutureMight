package
{
	public class Callback
	{
		public function Callback()
		{
		}
		public static function create(handler:Function,...args):Function{
			
			return function(...innerArgs):void{ 
				handler.apply(this,innerArgs.concat(args)); 
			}
			
		} 
	}
}