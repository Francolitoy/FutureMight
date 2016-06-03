package UI.CheckBox
{
	import Models.Play;
	import Partida.Game;
	import fl.controls.CheckBox;
	public class CheckboxHandler extends CheckBoxs 
	{
		public function CheckboxHandler()
		{
		}
		
		public function agregarCheckbox(X:int, Y:int,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):void
		{
			play.ui.Checks.push(crearCheckUI(X,Y,botonEvento,buttonMode,game,play));
		}
		
		private function crearCheckUI(X:int, Y:int,botonEvento:String,buttonMode:Boolean,game:Game,play:Play):CheckBox
		{
			var check:CheckBox = new CheckBox(); 
			var CheckBoxUI:CheckboxUI = new CheckboxUI();
			check=CheckBoxUI.spawn(X,Y, check,botonEvento,buttonMode,game,play);
			return check;
		}
	}
}