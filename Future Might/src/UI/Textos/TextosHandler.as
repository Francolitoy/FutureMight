package UI.Textos
{
	import Models.Play;
	
	import Partida.Game;
	
	import flash.display.MovieClip;
	import flash.text.TextField;

	public class TextosHandler extends Textos
	{
		public function TextosHandler()
		{
		}
		public function agregarTextoConfig(X:int, Y:int, textoEvento:String,game:Game,play:Play):void
		{
			play.textosModel.textosTeclas.push(crearTextoConfig(X,Y,new TextField(),textoEvento,game,play));
		}
		
		public function agregarTextoPausa(X:int, Y:int, textoEvento:String,game:Game,play:Play):void
		{
			play.textosModel.textosTeclas.push(crearTextoPausa(X,Y,new TextField(),textoEvento,game,play));
		}
		private function crearTextoConfig(X:int, Y:int, textField:TextField,textoEvento:String,game:Game,play:Play):TextField
		{
			var textField:TextField;
			var textosConfig:TextosConfig = new TextosConfig();
			textField=textosConfig.spawn(X,Y, textField,textoEvento,game,play);
			return textField;
		}
		
		private function crearTextoPausa(X:int, Y:int, textField:TextField,textoEvento:String,game:Game,play:Play):TextField
		{
			var textField:TextField;
			var textosPausa:TextosPausa = new TextosPausa();
			textField=textosPausa.spawn(X,Y, textField,textoEvento,game,play);
			return textField;
		}
	}
}