package UI
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.Stage;
	
	public class Camera2D
	{
		//public var view:Sprite = new Sprite();
		public var targetZoom:Number;
		public var delayZoom:Number = 20;
		private var MiStage:Stage;
		public var view:Sprite = new Sprite();
		
		public function Camera2D(MiStage:Stage,view:Sprite)
		{
			this.view = view;
			this.MiStage = MiStage;
		}
		
		public function on():void
		{
			this.MiStage.addChild(view);
		}
		
		public function off():void
		{
			this.MiStage.removeChild(view);
		}
		
		public function addToView(obj:Sprite):void
		{
			this.MiStage.addChild(obj);
		}
		
		public function removeFromView(obj:Sprite):void
		{
			this.MiStage.removeChild(obj);
		}
		
		public function set zoom(value:Number):void
		{
			//trace("SET");
			if(value > 0)
			{
				view.scaleX = view.scaleY = value;
			}else
			{
				throw new Error("El zoom no puede ser 0 o menos... " + "Valor: " + value);
			}
		}
		
		public function get zoom():Number
		{
			//trace("GET");
			return view.scaleX;
		}
		
		public function set smoothZoom(value:Number):void
		{
			targetZoom = value;
			MiStage.addEventListener(Event.ENTER_FRAME, evUpdateSmoothZoom);
		}
		
		protected function evUpdateSmoothZoom(event:Event):void
		{
			zoom += (targetZoom - zoom) / delayZoom;
			if(Math.abs((targetZoom - zoom)) <= 0.001)
			{
				zoom = targetZoom;
				MiStage.removeEventListener(Event.ENTER_FRAME, evUpdateSmoothZoom);
			}
		}
		
		public function set x(value:Number):void
		{
			view.x = -value;
		}
		
		public function get x():Number
		{
			return -view.x;
		}
		
		public function set y(value:Number):void
		{
			view.y = -value;
		}
		
		public function get y():Number
		{
			return -view.y;
		}
		
		public function lookAt(target:Sprite):void
		{
			/*x = target.x * zoom - MiStage.stageWidth/2;
			y = target.y * zoom - MiStage.stageHeight/2;*/
			var pLocal:Point = new Point(target.x, target.y);
			var pGlobal:Point = target.parent.localToGlobal(pLocal);
			var pView:Point = view.globalToLocal(pGlobal);
			
			x = pView.x * zoom - MiStage.stageWidth/2;
			y = pView.y * zoom - MiStage.stageHeight/2;
			
			//trace(pLocal, pGlobal);
		}
	}
}