package UI
{
	import Models.Play;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class MiniMap extends Sprite 
	{		
		private var myMainClass:Stage;
		
		private var miniMapBGLayer:Sprite;
		private var objectLayer:Sprite;
		
		private var bg:Sprite;
		
		private var objectArray:Vector.<MovieClip> = new Vector.<MovieClip>();
		
		private var scaleFactorX:Number;
		private var scaleFactorY:Number;
		
		//public function MiniMap(objectArray:Array, mainClass:Main) 
		public function MiniMap(objectArray:Vector.<MovieClip>, play:Play) 
		{
			myMainClass = play.MiStage;
			
			this.objectArray = objectArray;
			
			initLayer();
			initBG();
			
			/*scaleFactorX = bg.width / myMainClass.stage.stageWidth;
			scaleFactorY = bg.height / myMainClass.stage.stageHeight;*/
			
			scaleFactorX = bg.width / play.Pantalla.view.width;
			scaleFactorY = bg.height / play.Pantalla.view.height;
		}
		
		private function initLayer():void
		{
			miniMapBGLayer = new Sprite();
			myMainClass.addChild(miniMapBGLayer);
			
			objectLayer = new Sprite();
			myMainClass.addChild(objectLayer);
		}
		
		private function initBG():void
		{
			bg = new Sprite();
			bg.graphics.beginFill(0x00ff00);
			bg.graphics.drawRect(0, 0, 200, 100);
			bg.graphics.endFill();
			
			miniMapBGLayer.addChild(bg);
		}
		
		public function update():void
		{
			objectLayer.graphics.clear();
			
			for (var i:int = 0; i < objectArray.length; i++)
			{
				var x:Number = objectArray[i].x * scaleFactorX;
				var y:Number = objectArray[i].y * scaleFactorY;
				
				objectLayer.graphics.beginFill(0xff0000);
				objectLayer.graphics.drawCircle(x, y, 2);
			}
		}
	}
}