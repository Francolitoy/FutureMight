package Personajes.Enemigos
{
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class ZubatEnemy
	{
		public var model:MovieClip;
		public var Vida:int = 3;
		public var atk:int = 1;
		public var exp:int = 1;
		
		public function ZubatEnemy(model:MovieClip)
		{
			/*var hitArea:Sprite = new Sprite()
			hitArea.graphics.beginFill( 0xFFFFFF );
			hitArea.graphics.drawRect( model.x,model.y, 40, 20 );
			hitArea.mouseEnabled = false;
			//hitArea.visible = false;
			hitArea.x = model.x
			hitArea.y = model.y
			model.hitArea = hitArea;
			//addChild( bitmap );
			model.addChild( hitArea );*/
			this.model = model;
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0xCCFF00);
			square.graphics.drawRect(-40, -20, 60, 30);
			square.visible = false;
			this.model.hitArea = square;
			this.model.addChild(square) ;
		}
		
	}
}