package UI.CheckBox
{
	import Models.UIModel;
	import flash.display.Stage;
	public class CheckBoxs
	{
		public function CheckBoxs()
		{
		}
		public function sacarChecks(MiStage:Stage,ui:UIModel):void
		{
			for (var i:int = ui.Checks.length-1; i >= 0; i--) 
			{
				MiStage.removeChild(ui.Checks[i]);
				ui.Checks.splice(i,1);
			}
		}
	}
}