package UI.Textos
{
	import Models.TextosModel;
	import Pantallas.FuncionesPantallas;
	import Partida.Game;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.describeType;

	public class Textos extends FuncionesPantallas
	{
		public function Textos()
		{
		}
		
		protected const ARRIBA:String = "Arriba : ";
		protected const ABAJO:String = "Abajo : ";
		protected const DERECHA:String = "Derecha : ";
		protected const IZQUIERDA:String = "Izquierda : ";
		protected const DISPARO:String = "Disparo : ";
		protected const SELECCIONE:String = "**Seleccione una tecla**";
		protected const TECLAASIGNADA:String = "**Esta tecla ya fue asignada**";
		protected const TECLARESERVADA:String = "**Esta tecla esta reservada por el sistema**";
		protected var keyDict:Dictionary = getKeyboardDict();
		
		public function dibujarTexto(Texto:String, Width:int, Height:int, X:int, Y:int,MiStage:Stage):TextField
		{
			var CampoTexto:TextField = new TextField();
			
			CampoTexto.text = Texto;
			CampoTexto.width = Width;
			CampoTexto.height = Height;
			CampoTexto.selectable = false;
			
			MiStage.addChild(CampoTexto);
			
			CampoTexto.x = X;
			CampoTexto.y = Y;
			
			return CampoTexto;
		}
		
		public function dibujarTextoBoton(Texto:String, Width:int, Height:int, X:int, Y:int,CampoTexto:TextField,selectable:Boolean,border:Boolean):TextField
		{			
			CampoTexto.text = Texto;
			CampoTexto.width = Width;
			CampoTexto.height = Height;
			CampoTexto.selectable = selectable;
			CampoTexto.border = border;
			CampoTexto.type = "input";
			return CampoTexto;
		}
		
		public function sacarTextos(MiStage:Stage,txt:TextosModel):void
		{
			for (var i:int = txt.textosTeclas.length-1; i >= 0; i--) 
			{
				MiStage.removeChild(txt.textosTeclas[i]);
				txt.textosTeclas.splice(i,1);
			}
		}
		
		protected function limpiarTextosConfig(txt:TextosModel,game:Game):void
		{
			txt.textosTeclas[0].text= ARRIBA + keyDict[game.settings.Arriba];
			txt.textosTeclas[1].text= ABAJO + keyDict[game.settings.Abajo];
			txt.textosTeclas[2].text= DERECHA + keyDict[game.settings.Derecha];
			txt.textosTeclas[3].text= IZQUIERDA + keyDict[game.settings.Izquierda];
			txt.textosTeclas[4].text= DISPARO + keyDict[game.settings.Disparo];
		}
		
		protected function getKeyboardDict():Dictionary {
			var keyDescription:XML = describeType(Keyboard);
			var keyNames:XMLList = keyDescription..constant.@name;
			
			var keyboardDict:Dictionary = new Dictionary();
			
			var len:int = keyNames.length();
			for(var i:int = 0; i < len; i++) {
				keyboardDict[Keyboard[keyNames[i]]] = keyNames[i];
			}
			
			return keyboardDict;
		}
	}
}