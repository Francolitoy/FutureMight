package UI.CheckBox
{
	import Models.Play;
	
	import Partida.Game;
	import Partida.Settings;
	
	import fl.controls.CheckBox;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;

	public class CheckboxUI extends CheckBoxs 
	{
		public function CheckboxUI()
		{
		}
		public function spawn(X:int, Y:int, check:CheckBox,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):CheckBox
		{
			play.MiStage.addChild(check);
			check.x = X;
			check.y = Y;
			switch(botonEvento)
			{
				case "Musica":
				{
					if(game.settings.Mutear)
						check.selected = false;
					else
						check.selected = true;
					check.label = "Musica";
					check.addEventListener(MouseEvent.CLICK,Callback.create(this.CheckMusica,game.settings));
					break;
				}
				default:
				{
					break;
				}
			}
			return check;
		}
		
		protected function CheckMusica(event:MouseEvent,settings:Settings):void
		{
			if(event.target.selected)
				settings.Mutear = false;
			else
				settings.Mutear = true;
		}
	}
}