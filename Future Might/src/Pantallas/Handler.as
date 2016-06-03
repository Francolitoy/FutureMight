package Pantallas
{
	import Models.Play;
	import Models.TextosModel;
	import Models.TimersModel;
	
	import Partida.Game;
	
	import Personajes.GarbageCollector;
	
	import UI.SoundController;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import Pantallas.Niveles.Pantalla1;
	import Pantallas.Niveles.Pantalla2;
	import Pantallas.Niveles.Pantalla3;
	import Pantallas.Niveles.Pantalla4;
	import Pantallas.Niveles.PantallaJefe;
	import Pantallas.Niveles.PantallaTutorial;
	import Pantallas.Funcionalidades.Configuracion;
	import Pantallas.Funcionalidades.Reset;
	import Pantallas.Funcionalidades.Upgrades;
	import Pantallas.Finalizaciones.Ganaste;
	import Pantallas.Finalizaciones.Perdiste;
	import Pantallas.Informacion.Credits;
	import Pantallas.Informacion.HowToPlay;

	public class Handler
	{
		public function cargarPantalla(game:Game,play:Play):String
		{
			//Elimino todos los fondos al entrar en una pantalla nueva.
			if (play.Pantalla.CargarPantalla != "Nada") 
			{
				var GC:GarbageCollector = new GarbageCollector();
				GC.EliminarEscenarios(play,true,0);
			}
			
			switch(play.Pantalla.CargarPantalla)
			{
				case "Inicio":
				{
					var ini:Inicio = new Inicio();
					return ini.init(game,play);
				}
				case "Upgrades":
				{
					var up:Upgrades = new Upgrades();
					return up.init(game,play);
					//Pantalla Ejecutandose = 6 es que se ejecuta la Seccion de Upgrades XD por ahora lo dejo comentado despues lo tengo que hacer bien XD
					//PantallaEjecutandose = 6;
				}
				case "HowToPlay":
				{
					var how:HowToPlay = new HowToPlay();
					return how.init(game,play);
				}
				case "Creditos":
				{
					var credi:Credits = new Credits();
					return credi.init(game,play);
				}
				case "Reset":
				{
					var reset:Reset = new Reset();
					return reset.init(game,play);
				}
				case "Settings":
				{
					var configuracion:Configuracion = new Configuracion();
					return configuracion.init(game,play);
				}
				case "Tutorial":
				{
					var pantallaTutorial:PantallaTutorial = new PantallaTutorial();
					return pantallaTutorial.init(play.textosModel,game,play);
				}
				case "1":
				{
					var pantalla1:Pantalla1 = new Pantalla1();
					return pantalla1.init(play.textosModel,game,play);
				}
				case "2":
				{
					var pantalla2:Pantalla2 = new Pantalla2();
					return pantalla2.init(play.textosModel,game,play);
				}
				case "3":
				{
					var pantalla3:Pantalla3 = new Pantalla3();
					return pantalla3.init(play.textosModel,game,play);
				}
				case "4":
				{
					var pantalla4:Pantalla4 = new Pantalla4();
					return pantalla4.init(play.textosModel,game,play);
				}
				case "Jefe":
				{
					var pantallaJefe:PantallaJefe = new PantallaJefe();
					return pantallaJefe.init(play.textosModel,game,play);
				}
				case "Ganaste":
				{
					var ganaste:Ganaste = new Ganaste();
					return ganaste.init(play.textosModel,game,play);
				}
				case "Perdiste":
				{
					var perdiste:Perdiste = new Perdiste();
					return perdiste.init(play.textosModel,game,play);
				}
			}
			return "Nada";
		}
		
		public function pantallaEjecutandose(game:Game,play:Play):String
		{
			//Si esta en pausa no updateo los frames
			if (play.pause) 
			{
				return "Nada";
			}
			
			switch(play.Pantalla.PantallaEjecutandose)
			{
				case -1:
				{
					var pantallaTutorial:PantallaTutorial = new PantallaTutorial();
					return pantallaTutorial.exec(play.textosModel,play.Timers,game,play);
				}
				case 1:
				{
					var pantalla1:Pantalla1 = new Pantalla1();
					return pantalla1.exec(play.textosModel,play.Timers,game,play);
				}
				case 2:
				{
					var pantalla2:Pantalla2 = new Pantalla2();
					return pantalla2.exec(play.textosModel,play.Timers,game,play);
				}
				case 3:
				{
					var pantalla3:Pantalla3 = new Pantalla3();
					return pantalla3.exec(play.textosModel,play.Timers,game,play);
				}	
				case 4:
				{
					var pantalla4:Pantalla4 = new Pantalla4();
					return pantalla4.exec(play.textosModel,play.Timers,game,play);
				}
				case 5:
				{
					var pantallaJefe:PantallaJefe = new PantallaJefe();
					return pantallaJefe.exec(play.textosModel,game,play);
				}	
				case 6:
				{
					//Esta Pantalla es la de Seccion de Upgrades XD
					return "Nada";
				}
				default:
				{
					return "Nada";
				}
			}
			return "Nada";
		}
		
		public function handlerSonido(PantallaSonido:String,Mutear:Boolean,Audio:SoundController,MiStage:Stage):SoundController
		{
			switch(PantallaSonido)
			{
				case "Inicio":
				{
					return manejarMuteo(Mutear,Audio,new SND_Inicio(),5,MiStage,PantallaSonido);
				}
				case "Upgrades":
				{
					break;
				}
				case "HowToPlay":
				{
					break;
				}
				case "Creditos":
				{
					break;
				}
				case "Reset":
				{
					break;
				}
				case "Tutorial":
				{
					return manejarMuteo(Mutear,Audio,new SND_Pantalla1(),5,MiStage,PantallaSonido);
				}
				case "1":
				{
					return manejarMuteo(Mutear,Audio,new SND_Pantalla1(),5,MiStage,PantallaSonido);
				}
				case "2":
				{
					return manejarMuteo(Mutear,Audio,new SND_Pantalla1(),5,MiStage,PantallaSonido);
				}
				case "3":
				{
					return manejarMuteo(Mutear,Audio,new SND_Pantalla1(),5,MiStage,PantallaSonido);
				}
				case "4":
				{
					return manejarMuteo(Mutear,Audio,new SND_Pantalla1(),5,MiStage,PantallaSonido);
				}
				case "Jefe":
				{
					return manejarMuteo(Mutear,Audio,new SND_Jefe(),5,MiStage,PantallaSonido);
				}
				case "Ganaste":
				{
					return manejarMuteo(Mutear,Audio,new SND_Ganar(),0,MiStage,PantallaSonido);
				}
				case "Perdiste":
				{
					return manejarMuteo(Mutear,Audio,new SND_Perder(),0,MiStage,PantallaSonido);
				}
			}
			return null;
		}
		
		public function manejarMuteo(Mutear:Boolean,Audio:SoundController,Sonido:Sound,loop:int,MiStage:Stage,PantallaSonido:String):SoundController
		{
			if(Mutear)
			{
				if(Audio != null)
				{
					if(Audio.PantallaSonido == PantallaSonido)
					{
						Audio.pause();
					}
					else
					{
						SoundMixer.stopAll();
						Audio = null;
					}
				}
			}
			else
			{
				if(Audio == null)
				{
					Audio = instanciarSonido(Audio,Sonido,loop,MiStage,PantallaSonido);
				}
				else
				{
					if(Audio.lastPosition != 0)
					{
						if(Audio.PantallaSonido == PantallaSonido)
						{
							Audio.resume();
						}
						else
						{
							Audio = instanciarSonido(Audio,Sonido,loop,MiStage,PantallaSonido);
						}
					}
				}
			}
			return Audio;
		}
		
		private function instanciarSonido(Audio:SoundController,Sonido:Sound,loop:int,MiStage:Stage,PantallaSonido:String):SoundController
		{
			SoundMixer.stopAll();
			Audio = new SoundController(Sonido,MiStage,PantallaSonido);
			Audio.play(loop);
			return Audio;
		}
	}
}