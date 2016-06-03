package Models
{
	import UI.Camera2D;
	import UI.SoundController;
	import UI.MiniMap;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class PantallaModel
	{
		public var Audio:SoundController;
		public var view:Sprite;
		public var Camara:Camera2D;
		//Indicador de Pantallas que se van a Cargar XD
		public var CargarPantalla:String; //se ejecuta 1 sola ves
		public var PantallaEjecutandose:int; // se ejecuta varias veces "tipo Update"
		public var PantallaSonido:String; // se ejecuta varias veces "tipo Update"
		
		//Cosas de la pantalla XD
		public var AllPisos:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var AllParedes:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var AllHeal:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var AllSpringo:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var AllFinish:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var AllPinches:Vector.<MovieClip> = new Vector.<MovieClip>();
		public var myMiniMap:MiniMap;

	}
}