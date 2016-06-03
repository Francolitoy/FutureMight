package UI.Textos
{
	import Models.PantallaModel;
	import Models.Play;
	import Models.TextosModel;
	
	import Partida.Game;
	import Partida.Settings;
	
	import flash.display.MovieClip;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.describeType;

	public class TextosConfig extends Textos
	{
		public function spawn(X:int, Y:int, textField:TextField,textoEvento:String,game:Game,play:Play):TextField
		{
			play.MiStage.addChild(textField);
			textField.x = X;
			textField.y = Y;
			var ancho:int = 250;
			var alto:int = 30;
			textField.addEventListener(FocusEvent.FOCUS_IN, Callback.create(this.onFocusIn,textField,play.textosModel,game));
			switch(textoEvento)
			{
				case "TextoArriba":
				{
					dibujarTextoBoton(ARRIBA + keyDict[game.settings.Arriba],ancho,alto,X,Y,textField,true,true);
					textField.addEventListener(FocusEvent.FOCUS_OUT, Callback.create(this.onFocusOut,textField,game.settings,ARRIBA));
					textField.addEventListener(KeyboardEvent.KEY_DOWN,Callback.create(this.reportKeyDown,game.settings,play,textField,ARRIBA));
					break;
				}
					
				case "TextoABajo":
				{
					dibujarTextoBoton(ABAJO + keyDict[game.settings.Abajo],ancho,alto,X,Y,textField,true,true);
					textField.addEventListener(FocusEvent.FOCUS_OUT, Callback.create(this.onFocusOut,textField,game.settings,ABAJO));
					textField.addEventListener(KeyboardEvent.KEY_DOWN,Callback.create(this.reportKeyDown,game.settings,play,textField,ABAJO));
					break;
				}
					
				case "TextoDerecha":
				{
					dibujarTextoBoton(DERECHA + keyDict[game.settings.Derecha],ancho,alto,X,Y,textField,true,true);
					textField.addEventListener(FocusEvent.FOCUS_OUT, Callback.create(this.onFocusOut,textField,game.settings,DERECHA));
					textField.addEventListener(KeyboardEvent.KEY_DOWN,Callback.create(this.reportKeyDown,game.settings,play,textField,DERECHA));
					break;
				}
					
				case "TextoIzquierda":
				{
					dibujarTextoBoton(IZQUIERDA + keyDict[game.settings.Izquierda],ancho,alto,X,Y,textField,true,true);
					textField.addEventListener(FocusEvent.FOCUS_OUT, Callback.create(this.onFocusOut,textField,game.settings,IZQUIERDA));
					textField.addEventListener(KeyboardEvent.KEY_DOWN,Callback.create(this.reportKeyDown,game.settings,play,textField,IZQUIERDA));
					break;
				}
					
				case "TextoDisparo":
				{
					dibujarTextoBoton(DISPARO + keyDict[game.settings.Disparo],ancho,alto,X,Y,textField,true,true);
					textField.addEventListener(FocusEvent.FOCUS_OUT, Callback.create(this.onFocusOut,textField,game.settings,DISPARO));
					textField.addEventListener(KeyboardEvent.KEY_DOWN,Callback.create(this.reportKeyDown,game.settings,play,textField,DISPARO));
					break;
				}
				
				default:
				{
					break;
				}
			}
			return textField;
		}
		
		private function reportKeyDown(event:KeyboardEvent,settings:Settings,play:Play,textField:TextField,seleccion:String):void 
		{
			if(!teclaNuevaAsignada(settings,event.keyCode))
			{
				if (!teclaReservadaAsignada(event.keyCode)) 
				{
					switch(seleccion)
					{
						case ARRIBA:
						{
							settings.Arriba = event.keyCode;
							textField.text = ARRIBA + keyDict[event.keyCode];
							break;
						}
							
						case ABAJO:
						{
							settings.Abajo = event.keyCode;
							textField.text = ABAJO + keyDict[event.keyCode];
							break;
						}
							
						case DERECHA:
						{
							settings.Derecha = event.keyCode;
							textField.text = DERECHA + keyDict[event.keyCode];
							break;
						}
							
						case IZQUIERDA:
						{
							settings.Izquierda = event.keyCode;
							textField.text = IZQUIERDA + keyDict[event.keyCode];
							break;
						}
							
						case DISPARO:
						{
							settings.Disparo = event.keyCode;
							textField.text = DISPARO + keyDict[event.keyCode];
							break;
						}
							
						default:
						{
							break;
						}
					}
					play.cambios = true;
					play.MiStage.focus = null;
				}
				else
				{
					play.MiStage.focus = null;
					textField.text = TECLARESERVADA + " : " + keyDict[event.keyCode];
				}
			}
			else
			{
				play.MiStage.focus = null;
				textField.text = TECLAASIGNADA + " : " + keyDict[event.keyCode];
			}
		}
		
		private function teclaNuevaAsignada(settings:Settings,tecla:uint):Boolean
		{
			return (settings.Abajo == tecla || settings.Arriba == tecla || settings.Derecha == tecla || settings.Izquierda == tecla || settings.Disparo == tecla) ;
		}
		
		private function teclaReservadaAsignada(tecla:uint):Boolean
		{
			return (Keyboard.ESCAPE == tecla || Keyboard.M == tecla) ;
		}
		
		private function onFocusIn(e:FocusEvent,textField:TextField,txt:TextosModel,game:Game):void 
		{
			limpiarTextosConfig(txt,game);
			textField.text = SELECCIONE;
		}
		
		private function onFocusOut(e:FocusEvent,textField:TextField,settings:Settings,seleccion:String):void 
		{
			switch(seleccion)
			{
				case ARRIBA:
				{
					textField.text = seleccion + keyDict[settings.Arriba];
					break;
				}
					
				case ABAJO:
				{
					textField.text = seleccion + keyDict[settings.Abajo];
					break;
				}
					
				case DERECHA:
				{
					textField.text = seleccion + keyDict[settings.Derecha];
					break;
				}
					
				case IZQUIERDA:
				{
					textField.text = seleccion + keyDict[settings.Izquierda];
					break;
				}
					
				case DISPARO:
				{
					textField.text = seleccion + keyDict[settings.Disparo];
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
	}
}