package UI.Button
{
	import Models.UIModel;
	
	import Pantallas.FuncionesPantallas;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundMixer;

	public class Buttons extends FuncionesPantallas
	{
		public function sacarBotones(MiStage:Stage,ui:UIModel):void
		{
			for (var i:int = ui.Botones.length-1; i >= 0; i--) 
			{
				if (ui.Botones[i].parent == MiStage) 
				{
					MiStage.removeChild(ui.Botones[i]);
				}
				ui.Botones.splice(i,1);
			}
			for (var j:int =ui.Niveles.length-1; j >= 0; j--) 
			{
				MiStage.removeChild(ui.Niveles[j]);
				ui.Niveles.splice(j,1);
			}
			for (var e:int = ui.Escenarios.length-1; e >= 0; e--) 
			{
				MiStage.removeChild(ui.Escenarios[e]);
				ui.Escenarios.splice(e,1);
			}
		}
	}
}